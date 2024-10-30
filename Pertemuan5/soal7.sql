-- Foreign key dari Mahasiswa ke Jurusan
ALTER TABLE Mahasiswa
ADD CONSTRAINT jurusan_id
FOREIGN KEY (jurusan_id) REFERENCES Jurusan(id) ON DELETE CASCADE;

-- Foreign key dari Mahasiswa ke Dosen_Wali
ALTER TABLE Mahasiswa
ADD CONSTRAINT dosen_wali_id
FOREIGN KEY (dosen_wali_id) REFERENCES Dosen_Wali(id) ON DELETE CASCADE;

-- Hapus 5 mahasiswa berdasarkan ID
DELETE FROM Mahasiswa
WHERE id IN (1, 2, 3, 4, 5);

-- Check mahasiswa
SELECT * FROM Mahasiswa;

-- Check dosen wali
SELECT * FROM Dosen_Wali;

-- Check jurusan
SELECT * FROM Jurusan;