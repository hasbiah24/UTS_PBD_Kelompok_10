DROP DATABASE IF EXISTS uts_pbd_kelompok_10;
CREATE DATABASE uts_pbd_kelompok_10;
USE uts_pbd_kelompok_10;

-- ==========================================
-- TABEL MAHASISWA
-- ==========================================
CREATE TABLE mahasiswa (
    nim VARCHAR(15) PRIMARY KEY,
    nama VARCHAR(100),
    kelas VARCHAR(10),
    angkatan YEAR
);

-- ==========================================
-- TABEL DOSEN
-- ==========================================
CREATE TABLE dosen (
    kode_dosen VARCHAR(10) PRIMARY KEY,
    nama_dosen VARCHAR(100),
    email VARCHAR(100)
);

-- ==========================================
-- TABEL MATA KULIAH
-- ==========================================
CREATE TABLE mata_kuliah (
    kode_mk VARCHAR(10) PRIMARY KEY,
    nama_mk VARCHAR(100),
    sks INT,
    semester INT,
    kode_dosen VARCHAR(10),
    FOREIGN KEY (kode_dosen)
    REFERENCES dosen(kode_dosen)
);

-- ==========================================
-- TABEL GRADE
-- ==========================================
CREATE TABLE grade_nilai (
    grade VARCHAR(2) PRIMARY KEY,
    bobot DECIMAL(3,2),
    nilai_bawah DECIMAL(5,2),
    nilai_atas DECIMAL(5,2)
);

-- ==========================================
-- TABEL NILAI PRAKTIKUM
-- ==========================================
CREATE TABLE nilai_praktikum (
    id_nilai INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(15),
    kode_mk VARCHAR(10),
    nilai_tugas DECIMAL(5,2),
    nilai_kuis DECIMAL(5,2),
    nilai_uts DECIMAL(5,2),
    nilai_akhir DECIMAL(5,2),
    grade VARCHAR(2),
    bobot DECIMAL(3,2),
    status_lulus VARCHAR(20),

    FOREIGN KEY (nim)
    REFERENCES mahasiswa(nim),

    FOREIGN KEY (kode_mk)
    REFERENCES mata_kuliah(kode_mk)
);

-- ==========================================
-- TABEL LOG REKAP
-- ==========================================
CREATE TABLE log_rekap_nilai (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(15),
    kode_mk VARCHAR(10),
    nilai_akhir DECIMAL(5,2),
    grade VARCHAR(2),
    bobot DECIMAL(3,2),
    status_lulus VARCHAR(20),
    keterangan VARCHAR(100),
    waktu_proses DATETIME
);
