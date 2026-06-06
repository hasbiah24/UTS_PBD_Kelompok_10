# SISTEM REKAP NILAI PRAKTIKUM MAHASISWA

## UTS PEMROGRAMAN BASIS DATA

---

# Judul Projek

**Sistem Rekap Nilai Praktikum Mahasiswa**

---

# Nama Kelompok

**Kelompok 10**

---

# Daftar Anggota

1. Elysia
2. Hasbiah
3. Dinda
4. Sintia

---

# Deskripsi Sistem

Sistem Rekap Nilai Praktikum Mahasiswa merupakan sistem berbasis database yang dibuat menggunakan MySQL untuk membantu proses pengolahan nilai mahasiswa secara otomatis. Sistem ini digunakan untuk menyimpan data mahasiswa, dosen, mata kuliah, grade nilai, serta data nilai praktikum mahasiswa.

Sistem mampu menghitung nilai akhir berdasarkan nilai tugas, nilai kuis, dan nilai UTS. Setelah nilai akhir diperoleh, sistem secara otomatis menentukan grade, bobot nilai, serta status kelulusan mahasiswa. Selain itu, setiap proses rekap nilai akan dicatat ke dalam tabel log sehingga seluruh aktivitas pengolahan data dapat terdokumentasi dengan baik.

---

# Struktur Tabel

Database yang digunakan:

```sql
uts_pbd_kelompok_10
```

### 1. Tabel mahasiswa

Menyimpan data mahasiswa.

Field:

* nim
* nama
* kelas
* angkatan

### 2. Tabel dosen

Menyimpan data dosen.

Field:

* kode_dosen
* nama_dosen
* email

### 3. Tabel mata_kuliah

Menyimpan data mata kuliah.

Field:

* kode_mk
* nama_mk
* sks
* semester
* kode_dosen

### 4. Tabel grade_nilai

Menyimpan data grade dan bobot nilai.

Field:

* grade
* bobot
* nilai_bawah
* nilai_atas

### 5. Tabel nilai_praktikum

Menyimpan data nilai mahasiswa.

Field:

* id_nilai
* nim
* kode_mk
* nilai_tugas
* nilai_kuis
* nilai_uts
* nilai_akhir
* grade
* bobot
* status_lulus

### 6. Tabel log_rekap_nilai

Menyimpan riwayat hasil rekap nilai.

Field:

* id_log
* nim
* kode_mk
* nilai_akhir
* grade
* bobot
* status_lulus
* keterangan
* waktu_proses

---

# Cara Menjalankan Program

### 1. Jalankan XAMPP

Aktifkan:

* Apache
* MySQL

### 2. Buka phpMyAdmin

Buka browser kemudian akses:

```text
http://localhost/phpmyadmin
```

### 3. Import Script SQL

Salin seluruh kode program SQL ke menu SQL pada phpMyAdmin kemudian klik **Go/Kirim**.

### 4. Jalankan Procedure Rekap Semua Nilai

```sql
CALL rekap_semua_nilai();
```

### 5. Jalankan Procedure Rekap Berdasarkan Mata Kuliah

```sql
CALL rekap_nilai_per_mk('MK001');
```

### 6. Melihat Hasil Rekap

```sql
SELECT * FROM nilai_praktikum;
```

### 7. Melihat Log Rekap

```sql
SELECT * FROM log_rekap_nilai;
```

---

# Daftar Stored Procedure

## 1. rekap_semua_nilai()

Procedure ini digunakan untuk memproses seluruh data nilai mahasiswa yang terdapat pada tabel nilai_praktikum. Procedure akan menghitung nilai akhir, menentukan grade, bobot nilai, status kelulusan, serta menyimpan hasilnya ke tabel log_rekap_nilai.

Contoh penggunaan:

```sql
CALL rekap_semua_nilai();
```

---

## 2. rekap_nilai_per_mk()

Procedure ini digunakan untuk memproses nilai mahasiswa berdasarkan mata kuliah tertentu menggunakan parameter kode mata kuliah.

Contoh penggunaan:

```sql
CALL rekap_nilai_per_mk('MK001');
```

---

# Pembagian Tugas Anggota

| Nama    | Tugas                                                                                                                   |
| ------- | ----------------------------------------------------------------------------------------------------------------------- |
| Elysia  | Membuat database, tabel, relasi, serta data awal mahasiswa, dosen, mata kuliah, dan grade nilai                         |
| Dinda   | Membuat logika perhitungan nilai akhir menggunakan variabel dan penentuan grade nilai                                   |
| Sintia  | Membuat percabangan (IF), perulangan (LOOP), serta proses penentuan status kelulusan mahasiswa                          |
| Hasbiah | Membuat stored procedure, explicit cursor, implicit cursor, cursor dengan parameter, dokumentasi, dan pengujian program |

---

# Screenshot Hasil Program

Tambahkan screenshot berikut pada repository GitHub:

### Data Awal

```sql
SELECT * FROM mahasiswa;
SELECT * FROM dosen;
SELECT * FROM mata_kuliah;
SELECT * FROM grade_nilai;
SELECT * FROM nilai_praktikum;
```

### Hasil Eksekusi Procedure

```sql
CALL rekap_semua_nilai();
```

```sql
CALL rekap_nilai_per_mk('MK001');
```

### Hasil Tabel Nilai Praktikum

```sql
SELECT * FROM nilai_praktikum;
```

### Hasil Tabel Log Rekap Nilai

```sql
SELECT * FROM log_rekap_nilai;
```

---

# Kesimpulan

Sistem Rekap Nilai Praktikum Mahasiswa berhasil dibuat menggunakan MySQL dengan menerapkan konsep pemrograman basis data seperti variabel, percabangan, perulangan, implicit cursor, explicit cursor, dan cursor dengan parameter. Sistem mampu menghitung nilai akhir mahasiswa secara otomatis, menentukan grade dan status kelulusan, serta mencatat seluruh proses rekap nilai ke dalam tabel log sehingga pengolahan data menjadi lebih cepat, akurat, dan terstruktur.

---

# Tahun

2026
# Screenshot Hasil Program

## Data Mahasiswa

![Data mahasiswa](Data_mahasiswa.png)

## Datta dosen

![Datta dosen](Data_Dosen.png)

## Grade Nilai

![Grade Nilai](Grade_Nilai.png)


## Hasil Rekap Semua Nilai

![Rekap hasil Semua Nilai](rekap_semua_nilai.png)

## Mata Kuliah

![Mata kuliah](Mata_Kuliah.png)

## Nilai Praktikum

![](Data_Dosen.png)

## Log Rekap Nilai

![Log 2 Rekap Nilai](log_2_rekap_nilai.png)

## Rekap nilai per MK

![Rekap nilai per mk](Rekap_nilai_per_mk.png)
