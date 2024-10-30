# Modul

# Materi Minggu Ke-3 Praktikum

**`DATA TYPES`** : Digunakan untuk mengambil data dari tabel.

1. **`INTEGER TYPES`** :
1. **Integer Types**
    
    Digunakan untuk menyimpan data bilangan bulat.
    

- **`TINYINT`**: Menyimpan bilangan bulat kecil, dari -128 hingga 127.
- **`SMALLINT`**: Menyimpan bilangan bulat dari -32,768 hingga 32,767.
- **`MEDIUMINT`**: Menyimpan bilangan bulat dari -8,388,608 hingga 8,388,607.
- **`INT`** atau **`INTEGER`**: Menyimpan bilangan bulat dari -2,147,483,648 hingga 2,147,483,647.
- **`BIGINT`**: Menyimpan bilangan bulat sangat besar dari -9,223,372,036,854,775,808 hingga 9,223,372,036,854,775,807.

1. **`FLOATING POINT TYPES`**:
Digunakan untuk menyimpan angkat desimal

- **`FLOAT`**: Menyimpan bilangan desimal dengan presisi lebih rendah (hingga 4 byte).
- **`DOUBLE`**: Menyimpan bilangan desimal dengan presisi lebih tinggi (hingga 8 byte).
- **`DECIMAL`** atau **`NUMERIC`**: Menyimpan angka desimal dengan presisi tetap. Berguna untuk data keuangan.

1. **`STRING TYPES`**:
Digunakan untuk menyimpan teks

- **`CHAR(n)`**: Menyimpan string dengan panjang tetap, hingga 255 karakter. Jika string lebih pendek dari `n`, sisa ruang akan diisi dengan spasi.
- **`VARCHAR(n)`**: Menyimpan string dengan panjang variabel, hingga 65,535 karakter. Tidak ada tambahan spasi untuk string yang lebih pendek.
- **`TEXT`**: Menyimpan string panjang hingga 65,535 karakter.
- **`BLOB`**: Menyimpan data biner dalam ukuran yang sama dengan `TEXT`.

1. **`DATE AND TIME TYPES`** :
Digunakan untuk menyimpan data tanggal dan waktu

- **`DATE`**: Menyimpan tanggal dalam format `YYYY-MM-DD`.
- **`TIME`**: Menyimpan waktu dalam format `HH:MM:SS`.
- **`DATETIME`**: Menyimpan kombinasi tanggal dan waktu `YYYY-MM-DD HH:MM:SS`.
- **`TIMESTAMP`**: Menyimpan cap waktu (timestamp) yang diperbarui otomatis ketika data diubah.
- **`YEAR`**: Menyimpan tahun dalam format `YYYY`.

1. **`BOOLEAN TYPE`**:
Di MySQL, tipe boolean diwakili oleh **`TINYINT(1)`**, di mana 0 berarti `false` dan 1 berarti `true`.

0 berarti `false` 

 1 berarti `true`.

# CONSTRAINT

### 1. **Primary Key**

**Primary Key** adalah kolom atau kombinasi kolom dalam tabel yang secara unik mengidentifikasi setiap baris dalam tabel tersebut. Primary key tidak boleh memiliki nilai duplikat atau NULL.

### Karakteristik Primary Key:

- **Unik**: Setiap nilai di kolom primary key harus unik.
- **Tidak boleh NULL**: Kolom primary key harus selalu memiliki nilai.
- **Hanya satu primary key per tabel**: Sebuah tabel hanya bisa memiliki satu primary key, tetapi bisa terdiri dari lebih dari satu kolom (disebut *composite primary key*).

### Contoh Primary Key:

Misalnya, kita memiliki tabel **Mahasiswa** yang ingin kita buat dengan kolom **id** sebagai primary key.

```sql
CREATE TABLE Mahasiswa (
    id INT PRIMARY KEY,  -- id adalah primary key
    nama VARCHAR(100),
    jurusan VARCHAR(100)
);

```

### 2. **Foreign Key**

**Foreign Key** adalah kolom atau kumpulan kolom dalam satu tabel yang digunakan untuk membuat hubungan antar tabel. Foreign key adalah referensi ke **primary key** di tabel lain. Ini berguna untuk menjaga integritas data dan memastikan bahwa data di antara dua tabel tetap konsisten.

### Karakteristik Foreign Key:

- **Menjaga integritas referensial**: Foreign key memastikan bahwa nilai di kolom yang direferensikan benar-benar ada di tabel lain.
- **Memungkinkan hubungan antar tabel**: Foreign key digunakan untuk mendefinisikan hubungan antar tabel, seperti *one-to-many* atau *many-to-many*.
- **Dapat berisi NULL**: Jika tidak ada nilai untuk foreign key, kolom ini bisa berisi NULL, kecuali ada aturan khusus yang mencegahnya.

### Contoh Foreign Key:

Misalnya, kita memiliki dua tabel: **Mahasiswa** dan **Jurusan**. Tabel **Mahasiswa** memiliki kolom **jurusan_id** yang merupakan foreign key yang mengacu ke primary key dari tabel **Jurusan**.

```sql

CREATE TABLE Jurusan (
    id INT PRIMARY KEY,  -- id adalah primary key
    nama_jurusan VARCHAR(100)
);

CREATE TABLE Mahasiswa (
    id INT PRIMARY KEY,  -- id adalah primary key
    nama VARCHAR(100),
    jurusan_id INT,      -- foreign key yang mengacu ke tabel Jurusan
    FOREIGN KEY (jurusan_id) REFERENCES Jurusan(id)
);

```

Pada contoh ini:

- **`jurusan_id`** di tabel **Mahasiswa** adalah foreign key yang mengacu ke kolom **`id`** di tabel **Jurusan**.
- Foreign key memastikan bahwa setiap **`jurusan_id`** yang dimasukkan di tabel **Mahasiswa** harus ada di tabel **Jurusan**.

### Ringkasan Perbedaan:

- **Primary Key**: Digunakan untuk secara unik mengidentifikasi setiap baris dalam sebuah tabel. Tidak boleh NULL atau duplikat.
- **Foreign Key**: Digunakan untuk membuat hubungan antar tabel dan memastikan integritas data. Merujuk pada primary key di tabel lain.

### Contoh Relasi Antar Tabel:

Misalnya, kita memiliki tabel **Orders** dan **Customers**. Di tabel **Orders**, kita ingin menyimpan informasi pelanggan melalui foreign key **customer_id** yang merujuk ke primary key **id** di tabel **Customers**.

```sql
CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

```

Di sini, **`customer_id`** di tabel **Orders** adalah foreign key yang menghubungkan setiap order dengan pelanggan yang ada di tabel **Customers**.

### 3. **NOT NULL**

**NOT NULL** digunakan untuk memastikan bahwa kolom tidak boleh menyimpan nilai **NULL**. Setiap baris harus memiliki nilai pada kolom yang diberi constraint **NOT NULL**.

### Contoh:

```sql

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL  -- Kolom ini tidak boleh kosong
);

```

Dalam contoh ini, kolom **`name`** harus memiliki nilai untuk setiap baris yang dimasukkan ke dalam tabel.

### 4. **UNIQUE**

**UNIQUE** digunakan untuk memastikan bahwa nilai dalam kolom tertentu atau gabungan kolom harus **unik** di seluruh tabel. Berbeda dengan **primary key**, tabel bisa memiliki lebih dari satu kolom dengan **UNIQUE constraint**.

### Contoh:

```sql

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE  -- Kolom email harus unik, tidak boleh ada duplikasi
);

```

Dalam contoh ini, kolom **`email`** harus unik di seluruh baris tabel **Users**. Tidak boleh ada dua pengguna yang memiliki alamat email yang sama.

### 5. **DEFAULT**

**DEFAULT** digunakan untuk menetapkan nilai default pada kolom jika pengguna tidak memberikan nilai saat menyisipkan data.

### Contoh:

```sql

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    price DECIMAL(10, 2) DEFAULT 0.00  -- Jika harga tidak diberikan, akan disetel ke 0.00
);

```

Dalam contoh ini, jika pengguna tidak menyisipkan nilai untuk **`price`**, maka kolom ini secara otomatis akan berisi nilai **`0.00`**.

### 6. **CHECK** (Belum Didukung di MySQL hingga versi 8.0)

**CHECK** constraint digunakan untuk menetapkan kondisi atau aturan yang harus dipenuhi oleh nilai kolom. Jika nilai tidak memenuhi aturan yang ditentukan, maka data tidak akan diterima oleh tabel. Perintah ini diperkenalkan di MySQL 8.0.

### Contoh:

```sql

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    age INT CHECK (age >= 18)  -- Usia harus 18 tahun ke atas
);

```

Dalam contoh ini, **`age`** harus bernilai 18 atau lebih tinggi. Jika seseorang mencoba memasukkan usia kurang dari 18, maka query akan ditolak.

### 7. **AUTO_INCREMENT**

**AUTO_INCREMENT** digunakan pada kolom **primary key** untuk secara otomatis memberikan nilai bertambah secara berurutan setiap kali baris baru dimasukkan. Biasanya digunakan pada kolom ID.

### Contoh:

```sql

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,  -- Nilai akan bertambah otomatis
    order_date DATE NOT NULL
);

```

Menentukan Auto Increment di T-SQL:

```sql

CREATE TABLE Orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,  -- Nilai akan bertambah otomatis
    order_date DATE NOT NULL
);

```

Dalam contoh ini, setiap kali data baru dimasukkan, **`order_id`** akan bertambah secara otomatis.

### 8. **ON DELETE CASCADE** dan **ON UPDATE CASCADE**

Ini adalah aturan yang dapat diterapkan pada **foreign key**. Dengan **ON DELETE CASCADE**, jika baris di tabel yang direferensikan dihapus, maka baris terkait di tabel lain juga akan dihapus secara otomatis. **ON UPDATE CASCADE** memastikan bahwa jika primary key di tabel lain diperbarui, foreign key yang merujuk ke primary key tersebut juga akan diperbarui.

### Contoh:

```sql

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

```

Dengan **`ON DELETE CASCADE`**, jika pelanggan dihapus dari tabel **Customers**, semua pesanan yang terkait dengan pelanggan tersebut akan secara otomatis dihapus dari tabel **Orders**.

### Ringkasan Constraint:

1. **PRIMARY KEY**: Unik dan tidak boleh NULL.
2. **FOREIGN KEY**: Menjaga hubungan antar tabel dan memastikan integritas referensial.
3. **NOT NULL**: Kolom tidak boleh kosong.
4. **UNIQUE**: Setiap nilai dalam kolom harus unik.
5. **DEFAULT**: Menyediakan nilai default jika tidak ada nilai yang diberikan.
6. **CHECK**: Memastikan bahwa nilai memenuhi kondisi tertentu (hanya didukung di MySQL 8.0+).
7. **AUTO_INCREMENT**: Mengisi kolom secara otomatis dengan nilai yang bertambah.
8. **ON DELETE/UPDATE CASCADE**: Aturan untuk memodifikasi atau menghapus data secara otomatis berdasarkan perubahan di tabel terkait.

# MEMBUAT DATABASE

Perintah **`CREATE DATABASE`** digunakan dalam SQL untuk membuat database baru. Sebuah database adalah koleksi dari satu atau lebih tabel yang dapat digunakan untuk menyimpan data terstruktur.

### Sintaks Dasar

```sql

CREATE DATABASE database_name;

```

- **`database_name`**: Nama database yang ingin dibuat. Nama ini harus unik di dalam server database.

### Contoh Membuat Database

Misalkan kita ingin membuat database bernama **`my_database`**.

```sql

CREATE DATABASE my_database;

```

### Langkah-Langkah Setelah Membuat Database

1. **Memilih Database**: Setelah membuat database, Anda perlu memilihnya agar perintah SQL selanjutnya diterapkan pada database tersebut. Anda dapat menggunakan perintah **`USE`**.
    
    ```sql
    
    USE my_database;
    
    ```
    

### Menampilkan Daftar Database

Anda dapat menampilkan semua database yang ada di server dengan perintah berikut:

```sql

SHOW DATABASES;

```

### Menghapus Database

Jika Anda perlu menghapus database yang telah dibuat, Anda bisa menggunakan perintah **`DROP DATABASE`**.

```sql

DROP DATABASE my_database;

```

**Peringatan**: Menghapus database akan menghapus semua tabel dan data di dalamnya secara permanen.

### Contoh Lengkap

Berikut adalah contoh langkah-langkah untuk membuat database dan tabel:

```sql

-- Membuat database
CREATE DATABASE my_database;

-- Memilih database
USE my_database;

```

### Kesimpulan

Perintah **`CREATE DATABASE`** adalah langkah pertama untuk memulai penyimpanan data dalam database. Setelah membuat database, Anda dapat melanjutkan dengan membuat tabel dan menyimpan data terstruktur di dalamnya

# MEMBUAT TABEL

Perintah **`CREATE TABLE`** dalam SQL digunakan untuk membuat tabel baru dalam database. Tabel terdiri dari kolom (fields) yang memiliki tipe data dan batasan (constraints) tertentu. Setiap baris dalam tabel menyimpan data dalam bentuk record.

### Sintaks Dasar **`CREATE TABLE`**

```sql
CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ...
);

```

- **`table_name`**: Nama tabel yang akan dibuat.
- **`column1, column2, ...`**: Nama kolom yang ingin dimasukkan dalam tabel.
- **`datatype`**: Tipe data untuk kolom, seperti `INT`, `VARCHAR`, `DATE`, dll.
- **`constraint`**: Batasan opsional seperti `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, dll., yang digunakan untuk memastikan integritas data.

Perintah **`CREATE TABLE`** digunakan untuk membuat tabel dalam database dengan menentukan kolom, tipe data, dan constraint untuk memastikan integritas data. Dengan tabel yang dirancang baik, kita dapat menjaga struktur data yang konsisten dan akurat

# MENAMBAHKAN DATA

Perintah **`INSERT`** dalam SQL digunakan untuk menambahkan data baru ke dalam tabel. Dengan menggunakan **`INSERT`**, kita dapat memasukkan satu atau lebih baris data ke tabel yang sudah ada dalam database.

### Sintaks Dasar

1. **Insert Satu Baris**
    
    ```sql
    INSERT INTO table_name (column1, column2, column3, ...)
    VALUES (value1, value2, value3, ...);
    
    ```
    
    - **`table_name`**: Nama tabel yang akan dimasukkan data.
    - **`column1, column2, ...`**: Kolom yang ingin diisi dengan data.
    - **`value1, value2, ...`**: Nilai yang akan dimasukkan ke dalam kolom yang sesuai.
2. **Insert Beberapa Baris Sekaligus**
    
    ```sql
    
    INSERT INTO table_name (column1, column2, column3, ...)
    VALUES (value1a, value2a, value3a, ...),
           (value1b, value2b, value3b, ...);
    
    ```
    

### Contoh Menggunakan INSERT

Misalkan kita memiliki tabel **`Customers`** yang berisi data pelanggan:

```sql

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

```

### 1. Insert Satu Baris

Untuk menambahkan satu pelanggan baru:

```sql

INSERT INTO Customers (name, email)
VALUES ('John Doe', 'john@example.com');

```

Dalam contoh ini, kita memasukkan data nama pelanggan "John Doe" dan email "john@example.com". Kolom **`customer_id`** otomatis bertambah karena menggunakan **`AUTO_INCREMENT`**.

### 2. Insert Beberapa Baris

Untuk memasukkan beberapa pelanggan sekaligus:

```sql

INSERT INTO Customers (name, email)
VALUES ('Jane Smith', 'jane@example.com'),
       ('Alice Johnson', 'alice@example.com'),
       ('Bob Brown', 'bob@example.com');

```

Contoh di atas menambahkan tiga pelanggan sekaligus ke tabel **`Customers`**.

# PERBAHARUI DATA

Perintah **`UPDATE`** dalam SQL digunakan untuk mengubah data yang sudah ada dalam tabel. Dengan perintah ini, Anda dapat memperbarui satu atau lebih kolom dalam satu atau lebih baris tabel berdasarkan kriteria tertentu.

### Sintaks Dasar

```sql

UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

```

- **`table_name`**: Nama tabel yang ingin diubah datanya.
- **`SET`**: Menentukan kolom yang akan diperbarui dan nilai baru yang ingin dimasukkan.
- **`WHERE`**: Menentukan kondisi untuk memilih baris yang akan diperbarui. Penting untuk menggunakan klausa ini untuk menghindari pembaruan semua baris dalam tabel.

### Contoh Menggunakan UPDATE

Misalkan kita memiliki tabel **`Customers`** sebagai berikut:

```sql

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

```

### 1. Mengupdate Satu Kolom

Jika kita ingin mengubah email pelanggan dengan **`customer_id`** 1 menjadi **`john_new@example.com`**, kita dapat menggunakan perintah berikut:

```sql

UPDATE Customers
SET email = 'john_new@example.com'
WHERE customer_id = 1;

```

Dalam contoh ini, hanya baris dengan **`customer_id`** 1 yang akan diperbarui, mengubah email yang sesuai.

### 2. Mengupdate Beberapa Kolom

Anda juga dapat memperbarui beberapa kolom sekaligus. Misalkan kita ingin mengubah nama dan email pelanggan dengan **`customer_id`** 2:

```sql

UPDATE Customers
SET name = 'Jane Doe', email = 'jane_new@example.com'
WHERE customer_id = 2;

```

Dalam contoh ini, baik **`name`** dan **`email`** pelanggan dengan **`customer_id`** 2 akan diperbarui.

### 3. Mengupdate Beberapa Baris

Anda dapat memperbarui beberapa baris sekaligus dengan menggunakan kondisi yang sesuai di dalam klausa **`WHERE`**. Misalkan kita ingin mengupdate semua pelanggan yang memiliki nama "John":

```sql

UPDATE Customers
SET email = 'john_update@example.com'
WHERE name = 'John';

```

Dalam contoh ini, semua baris yang memiliki nama "John" akan diperbarui dengan email baru.

### Tanpa Klausa WHERE

Hati-hati! Jika Anda tidak menggunakan klausa **`WHERE`**, perintah **`UPDATE`** akan menerapkan perubahan pada semua baris dalam tabel. Misalkan:

```sql

UPDATE Customers
SET email = 'default@example.com';

```

Perintah di atas akan mengubah email semua pelanggan menjadi **`default@example.com`**, yang mungkin tidak diinginkan.

### Menggunakan Subquery dalam UPDATE

Anda juga bisa menggunakan subquery untuk memperbarui data berdasarkan nilai yang diambil dari tabel lain. Misalnya, jika Anda ingin memperbarui email pelanggan berdasarkan nilai dari tabel lain:

```sql

UPDATE Customers
SET email = (SELECT new_email FROM New_Emails WHERE New_Emails.customer_id = Customers.customer_id)
WHERE customer_id IN (SELECT customer_id FROM New_Emails);

```

### Kesalahan yang Perlu Diperhatikan

1. **Tidak Menggunakan WHERE**: Pastikan Anda selalu menyertakan klausa **`WHERE`** jika Anda tidak ingin memperbarui semua baris.
2. **Tipe Data**: Pastikan nilai yang Anda masukkan sesuai dengan tipe data kolom yang akan diperbarui.
3. **Keterbatasan Unik**: Jika kolom memiliki batasan **UNIQUE**, pastikan nilai baru yang dimasukkan tidak sudah ada di tabel.

### Kesimpulan

Perintah **`UPDATE`** adalah cara untuk mengubah data yang ada di tabel dalam database. Dengan menggunakan klausa **`SET`** dan **`WHERE`**, Anda dapat mengatur nilai baru untuk kolom tertentu dengan presisi. Selalu perhatikan penggunaan klausa **`WHERE`** untuk menghindari pembaruan yang tidak diinginkan pada semua baris dalam tabel.

# HAPUS BARIS

Perintah **`DELETE`** dalam SQL digunakan untuk menghapus satu atau lebih baris dari sebuah tabel dalam database. Perintah ini sangat berguna ketika Anda ingin menghapus data tertentu berdasarkan kondisi yang diberikan.

### Sintaks Dasar

```sql

DELETE FROM table_name
WHERE condition;

```

- **`table_name`**: Nama tabel tempat baris akan dihapus.
- **`condition`**: Kondisi yang digunakan untuk menentukan baris mana yang akan dihapus. Penting untuk selalu menggunakan **`WHERE`** untuk menghindari penghapusan semua data dalam tabel.

### Contoh Menggunakan DELETE

Misalkan kita memiliki tabel **`Customers`** sebagai berikut:

```sql

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

```

### 1. Menghapus Baris Tertentu

Jika Anda ingin menghapus pelanggan dengan **`customer_id`** 1, Anda dapat menggunakan perintah berikut:

```sql

DELETE FROM Customers
WHERE customer_id = 1;

```

Perintah ini akan menghapus baris dengan **`customer_id`** 1 dari tabel **`Customers`**.

### 2. Menghapus Beberapa Baris

Anda juga dapat menghapus beberapa baris yang memenuhi kondisi tertentu. Misalkan Anda ingin menghapus semua pelanggan yang memiliki nama "John Doe":

```sql

DELETE FROM Customers
WHERE name = 'John Doe';

```

Semua baris yang memiliki nama **John Doe** akan dihapus dari tabel.

### Menghapus Semua Data

Jika Anda ingin menghapus **semua** data dalam tabel tanpa menghapus tabel itu sendiri, Anda dapat mengabaikan klausa **`WHERE`**, tetapi ini harus dilakukan dengan sangat hati-hati:

```sql

DELETE FROM Customers;

```

Perintah di atas akan menghapus **semua baris** dalam tabel **`Customers`**, tetapi struktur tabel masih tetap ada. Sebagai alternatif, Anda dapat menggunakan perintah **`TRUNCATE`** yang lebih efisien untuk menghapus semua data dalam tabel:

```sql

TRUNCATE TABLE Customers;

```

### Kesalahan yang Perlu Diperhatikan

1. **Tidak Menggunakan WHERE**: Jika Anda lupa menambahkan klausa **`WHERE`**, maka semua baris dalam tabel akan dihapus, yang mungkin tidak diinginkan.
2. **Foreign Key Constraints**: Jika tabel memiliki **foreign key** yang bergantung pada tabel lain, penghapusan baris bisa ditolak atau memicu penghapusan berantai (cascading delete) tergantung pada aturan **foreign key** yang diterapkan.

### Contoh Penggunaan dengan Kondisi Lebih Kompleks

Misalkan Anda ingin menghapus pelanggan yang belum memperbarui email mereka (email masih **NULL**):

```sql

DELETE FROM Customers
WHERE email IS NULL;

```

### Kesimpulan

Perintah **`DELETE`** memungkinkan Anda untuk menghapus baris data dari tabel dalam database. Penggunaan klausa **`WHERE`** sangat penting untuk mengontrol baris mana yang dihapus. Jika Anda ingin menghapus semua baris, Anda dapat menggunakan perintah **`DELETE`** tanpa **`WHERE`**, tetapi lebih efisien menggunakan **`TRUNCATE`** untuk menghapus semua data.

# UBAH TABLE (ALTER TABLE)

Perintah **`ALTER TABLE`** dalam SQL digunakan untuk mengubah struktur tabel yang sudah ada di dalam database. Dengan **`ALTER TABLE`**, Anda bisa menambah, menghapus, atau memodifikasi kolom, serta menambah atau menghapus constraint (batasan) pada tabel.

### Fungsi **`ALTER TABLE`**

1. **Menambah kolom baru**
2. **Menghapus kolom**
3. **Mengubah tipe data kolom**
4. **Menambah atau menghapus constraint** (misalnya: primary key, foreign key, unique, dll.)

### Sintaks Dasar

```sql

ALTER TABLE table_name
action;

```

- **`table_name`**: Nama tabel yang ingin diubah.
- **`action`**: Tindakan yang dilakukan (misalnya menambah kolom, menghapus kolom, mengubah tipe data kolom, dll.).

### 1. Menambah Kolom Baru

Untuk menambah kolom baru ke tabel, gunakan perintah berikut:

```sql
sql
Salin kode
ALTER TABLE table_name
ADD column_name data_type;

```

### Contoh:

Misalkan kita memiliki tabel **`Customers`** dan ingin menambah kolom **`phone_number`**:

```sql

ALTER TABLE Customers
ADD phone_number VARCHAR(15);
```

Ini akan menambahkan kolom **`phone_number`** dengan tipe data **`VARCHAR(15)`** ke tabel **`Customers`**.

### 2. Menghapus Kolom

Untuk menghapus kolom dari tabel, gunakan perintah berikut:

```sql

ALTER TABLE table_name
DROP COLUMN column_name;
```

### Contoh:

Jika kita ingin menghapus kolom **`phone_number`** dari tabel **`Customers`**:

```sql

ALTER TABLE Customers
DROP COLUMN phone_number;
```

### 3. Mengubah Tipe Data Kolom

Untuk mengubah tipe data dari kolom yang sudah ada, gunakan perintah berikut:

```sql

ALTER TABLE table_name
MODIFY column_name new_data_type;
```

Alter table di T-SQL

```sql
ALTER TABLE table_name
ALTER COLUMN column_name new_data_type;
```

### Contoh:

Jika kita ingin mengubah tipe data kolom **`email`** menjadi **`TEXT`** di tabel **`Customers`**:

```sql

ALTER TABLE Customers
MODIFY email TEXT;
```

### 4. Menambahkan Constraint

Anda juga dapat menggunakan **`ALTER TABLE`** untuk menambah constraint, seperti **`PRIMARY KEY`**, **`FOREIGN KEY`**, atau **`UNIQUE`** pada tabel yang sudah ada.

### Contoh: Menambahkan Primary Key

Jika kolom **`customer_id`** belum memiliki primary key, kita bisa menambahkannya dengan:

```sql

ALTER TABLE Customers
ADD PRIMARY KEY (customer_id);
```

### Contoh: Menambahkan Foreign Key

Misalkan kita memiliki tabel **`Orders`** yang berhubungan dengan tabel **`Customers`**, dan kita ingin menambahkan foreign key pada kolom **`customer_id`** di tabel **`Orders`**:

```sql

ALTER TABLE Orders
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);

```

### 5. Menghapus Constraint

Untuk menghapus constraint, gunakan perintah **`DROP`**. Misalnya, untuk menghapus primary key atau foreign key:

```sql
ALTER TABLE table_name
DROP PRIMARY KEY;

```

```sql

ALTER TABLE Orders
DROP CONSTRAINT fk_customer;
```

### Kesimpulan

Perintah **`ALTER TABLE`** sangat berguna untuk mengubah struktur tabel yang sudah ada, seperti menambah atau menghapus kolom, serta menambahkan atau menghapus constraint. Ini memungkinkan tabel untuk dikembangkan atau dimodifikasi sesuai kebutuhan tanpa harus menghapus dan membuat ulang tabel tersebut.