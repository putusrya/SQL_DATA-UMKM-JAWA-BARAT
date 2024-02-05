CREATE DATABASE umkm_jabar;

-- 1. Cek tabel hasil import
SELECT * FROM umkm;

-- 2. Tunjukan data UMKM di Kota Bandung!
SELECT * FROM umkm WHERE nama_kabupaten_kota="KOTA BANDUNG";

-- 3. Tunjukan data UMKM dari tahun 2019 dan disusun berdasarkan kategori usaha!
SELECT * FROM umkm WHERE tahun >= 2019 ORDER BY jenis_usaha,tahun;

-- 4. Soal no.3 tapi dibatasi 10 row!
SELECT * FROM umkm WHERE tahun >= 2019 ORDER BY jenis_usaha,tahun LIMIT 10;

-- 5. Kategori usaha apa saja yang tersedia di dalam dataset!
SELECT DISTINCT jenis_usaha FROM umkm;

-- 6. Tunjukan Seluruh data yang hanya kategori usaha Fashion dan kuliner!
SELECT * FROM umkm WHERE jenis_usaha = "FASHION" OR jenis_usaha= "KULINER";
SELECT * FROM umkm WHERE jenis_usaha IN("MAKANAN","MINUMAN");

-- 7. Tunjukan seluruh data usaha fashion di karawang!
SELECT * FROM umkm WHERE jenis_usaha = "FASHION" AND nama_kabupaten_kota="KABUPATEN KARAWANG";

-- 8. Tunjukan seluruh data selain usaha kuliner, makanan dan minuman!
SELECT * FROM umkm WHERE jenis_usaha NOT IN("KULINER","MAKANAN","MINUMAN");

-- 9. Dari tahun 2019 s.d 2023, bagaimana tren jumlah UMKM di Kab.Tasikmalaya pada usaha Kuliner!
SELECT nama_kabupaten_kota, jenis_usaha, jumlah_umkm, tahun FROM umkm WHERE tahun >= 2019 AND tahun <= 2023 AND nama_kabupaten_kota="KABUPATEN TASIKMALAYA" AND jenis_usaha="KULINER";

-- 10. Diantara Kota Bandung, Kabupaten Bandung, Kabupaten Bandung Barat, Dimanakah UMKM Kuliner Terpusat pada tahun 2021?
SELECT * FROM umkm WHERE nama_kabupaten_kota LIKE "%BANDUNG%" 
AND jenis_usaha = "KULINER" AND tahun = 2021 ORDER BY jumlah_umkm DESC;

-- 11. Kota mana saja yang memiliki angka 7 pada digit ke 3 kode tersebut!
SELECT DISTINCT kode_kabupaten_kota, nama_kabupaten_kota FROM umkm WHERE kode_kabupaten_kota LIKE "__7%";

-- 12. berapa jumlah baris dalam tabel!
select count(*) as jumlah_baris from umkm;

-- 13. berapa jumlah umkm di Kota Cimahi tahun 2020!
select sum(jumlah_umkm) as jumlah_umkm_bekasi_2020 from umkm where nama_kabupaten_kota = "KOTA CIMAHI" AND tahun = 2020;

-- 14. Bagaimana tren jumlah umkm di kota bogor dari tahun 2019-2021!
select tahun, sum(jumlah_umkm) as tren_jumlah_umkm_Bogor from umkm where nama_kabupaten_kota = "KOTA BOGOR" AND tahun >= 2019 GROUP BY tahun;

-- 15. berapa jumlah rata" jumlah umkm setiap kategori per kabupaten/kota di jawa barat di tahun 2020?
select jenis_usaha, tahun, avg(jumlah_umkm) as rerata_jumlah_umkm from umkm where tahun = 2020 group by jenis_usaha,tahun order by rerata_jumlah_umkm desc;

-- 16. nilai minimum dan maksimum dari kolom jumlah umkm!
select min(jumlah_umkm) as nilai_minimum_jumlah_umkm, max(jumlah_umkm) as nilai_maksimum_jumlah_umkm from umkm;

-- 17. Kab/kota mana yang memiliki jumlah umkm lebih dari 140 di tahun 2021?
select nama_kabupaten_kota, tahun, sum(jumlah_umkm) as total_umkm from umkm where tahun = 2021 group by nama_kabupaten_kota, tahun having total_umkm >= 140;