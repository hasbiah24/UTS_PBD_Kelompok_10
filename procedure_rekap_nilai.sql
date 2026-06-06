CREATE PROCEDURE rekap_semua_nilai()
BEGIN

DECLARE selesai INT DEFAULT 0;

DECLARE v_id INT;
DECLARE v_nim VARCHAR(15);
DECLARE v_kode_mk VARCHAR(10);

DECLARE v_tugas DECIMAL(5,2);
DECLARE v_kuis DECIMAL(5,2);
DECLARE v_uts DECIMAL(5,2);

DECLARE v_akhir DECIMAL(5,2);
DECLARE v_grade VARCHAR(2);
DECLARE v_bobot DECIMAL(3,2);
DECLARE v_status VARCHAR(20);

DECLARE cur CURSOR FOR
SELECT id_nilai,nim,kode_mk,nilai_tugas,nilai_kuis,nilai_uts
FROM nilai_praktikum;

DECLARE CONTINUE HANDLER FOR NOT FOUND
SET selesai = 1;

OPEN cur;

ulang:
LOOP

FETCH cur INTO
v_id,v_nim,v_kode_mk,
v_tugas,v_kuis,v_uts;

IF selesai = 1 THEN
LEAVE ulang;
END IF;

SET v_akhir =
(v_tugas*0.30)+
(v_kuis*0.30)+
(v_uts*0.40);

SELECT grade,bobot
INTO v_grade,v_bobot
FROM grade_nilai
WHERE v_akhir BETWEEN nilai_bawah AND nilai_atas
LIMIT 1;

IF v_grade IN ('A','A-','B+','B','B-','C+','C') THEN
SET v_status='LULUS';
ELSE
SET v_status='TIDAK LULUS';
END IF;

UPDATE nilai_praktikum
SET
nilai_akhir=v_akhir,
grade=v_grade,
bobot=v_bobot,
status_lulus=v_status
WHERE id_nilai=v_id;

INSERT INTO log_rekap_nilai
(
nim,
kode_mk,
nilai_akhir,
grade,
bobot,
status_lulus,
keterangan,
waktu_proses
)
VALUES
(
v_nim,
v_kode_mk,
v_akhir,
v_grade,
v_bobot,
v_status,
'Rekap Semua Nilai',
NOW()
);

END LOOP;

CLOSE cur;

SELECT ROW_COUNT() AS jumlah_data_diproses;

END $$

DELIMITER ;

-- ==========================================
-- PROCEDURE CURSOR DENGAN PARAMETER
-- ==========================================

DELIMITER $$

CREATE PROCEDURE rekap_nilai_per_mk
(
IN p_kode_mk VARCHAR(10)
)
BEGIN

DECLARE selesai INT DEFAULT 0;

DECLARE v_id INT;
DECLARE v_nim VARCHAR(15);

DECLARE v_tugas DECIMAL(5,2);
DECLARE v_kuis DECIMAL(5,2);
DECLARE v_uts DECIMAL(5,2);

DECLARE v_akhir DECIMAL(5,2);
DECLARE v_grade VARCHAR(2);
DECLARE v_bobot DECIMAL(3,2);
DECLARE v_status VARCHAR(20);

DECLARE cur CURSOR FOR
SELECT
id_nilai,
nim,
nilai_tugas,
nilai_kuis,
nilai_uts
FROM nilai_praktikum
WHERE kode_mk = p_kode_mk;

DECLARE CONTINUE HANDLER FOR NOT FOUND
SET selesai = 1;

OPEN cur;

ulang:
LOOP

FETCH cur INTO
v_id,v_nim,v_tugas,v_kuis,v_uts;

IF selesai=1 THEN
LEAVE ulang;
END IF;

SET v_akhir=
(v_tugas*0.30)+
(v_kuis*0.30)+
(v_uts*0.40);

SELECT grade,bobot
INTO v_grade,v_bobot
FROM grade_nilai
WHERE v_akhir BETWEEN nilai_bawah AND nilai_atas
LIMIT 1;

IF v_grade IN ('A','A-','B+','B','B-','C+','C') THEN
SET v_status='LULUS';
ELSE
SET v_status='TIDAK LULUS';
END IF;

UPDATE nilai_praktikum
SET
nilai_akhir=v_akhir,
grade=v_grade,
bobot=v_bobot,
status_lulus=v_status
WHERE id_nilai=v_id;

INSERT INTO log_rekap_nilai
(
nim,
kode_mk,
nilai_akhir,
grade,
bobot,
status_lulus,
keterangan,
waktu_proses
)
VALUES
(
v_nim,
p_kode_mk,
v_akhir,
v_grade,
v_bobot,
v_status,
'Rekap Per Mata Kuliah',
NOW()
);

END LOOP;

CLOSE cur;

SELECT ROW_COUNT() AS jumlah_data_diproses;

END $$

DELIMITER ;
