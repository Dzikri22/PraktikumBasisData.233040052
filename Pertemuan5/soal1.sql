CREATE TABLE jurusan (
	id BIGINT PRIMARY KEY,
	nama_jurusan BIGINT
	);

CREATE TABLE Dosen_Wali (
	id BIGINT PRIMARY KEY,
	NIP BIGINT,
	nama VARCHAR(100),
	tanggal_lahir DATE,
	alamat VARCHAR(100),
	no_hp INT
	);


CREATE TABLE mahasiswa (
	id BIGINT PRIMARY KEY,
	NPM INT,
	nama VARCHAR(100),
	tanggal_lahir DATE,
	alamat VARCHAR(100),
	no_hp INT,
	jurusan_id BIGINT, 
	dosen_wali_id BIGINT,
	 FOREIGN KEY (jurusan_id) REFERENCES Jurusan(id),
	 FOREIGN KEY (dosen_wali_id) REFERENCES Dosen_Wali(id)
	 );