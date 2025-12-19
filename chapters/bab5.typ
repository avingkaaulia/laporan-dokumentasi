= BAB V
== State Management & Logic (Sisi Penyedia Data)
== A. Mahasiswa 4 (Integrator) — Pelaku Utama 
Sebagai Lead Integrator, Mahasiswa 4 bertanggung jawab penuh atas tercapainya interoperabilitas antara tiga skema JSON yang heterogen. Implementasi yang dilakukan meliputi:

- Data Mapping: Melakukan pemetaan ulang (re-mapping) terhadap berbagai kunci (key) JSON yang berbeda. Mengakses Nested Object pada Vendor C (details.name) dan menyatukannya dengan nm_brg (Vendor A) serta productName (Vendor B) ke dalam satu standard key yaitu nama.

- Transformation & Type Safety: Menjamin konsistensi tipe data pada output akhir. Kasus tersulit ada pada Vendor A di mana harga berupa String "15000", integrator melakukan parsing menjadi Integer agar field harga_final konsisten berupa angka untuk seluruh produk.
#v(2mm)
*Implementasi Logika Bisnis):*

- Diskon Warung (Vendor A): Menerapkan logika kalkulasi otomatis harga dikali 0.9 (diskon 10%) khusus untuk data yang berasal dari Vendor A.

- Label Kuliner (Vendor C): Melakukan pengecekan kondisi pada kategori Vendor C. Jika category == "Food", sistem secara otomatis menambahkan string (Recommended) pada nama produk.

- Normalisasi Status: Menyegeramkan indikator stok yang beragam ("ada", true, dan stock > 50) menjadi satu istilah standar: "Tersedia".
#v(5mm)
== B.   Mahasiswa 1, 2, & 3 (Vendor A, B, C) — Sumber Data (Dat

*_Data Management (Kesiapan Harga) Setiap Vendor bertanggung jawab memastikan data harga selalu siap diakses oleh sistem pusat untuk kalkulasi akhir._*

-- Vendor A: Menyediakan harga dalam format String yang akan dikonversi oleh sistem.

-- Vendor B: Mengirimkan harga asli (Number) dari database PostgreSQL agar Mahasiswa 4 dapat menghitung diskon secara akurat.

-- Vendor C: Menyediakan struktur harga terpisah (harga dasar + pajak).

#v(2mm)
*_Transaction Validation (Validasi Stok) Vendor menyediakan indikator ketersediaan barang agar sistem integrator dapat melakukan validasi sebelum transaksi diproses:_*

-- Vendor A: Menggunakan String ("ada"/"habis"). Integrator melakukan pencocokan kata manual.

-- Vendor B: Menggunakan Boolean (true/false). Jika false, transaksi otomatis diblokir oleh sistem.

-- Vendor C: Menggunakan Integer (jumlah angka). Validasi dilakukan dengan cek stock > 0