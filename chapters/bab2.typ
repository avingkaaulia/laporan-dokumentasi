= BAB II
= Bukti Keaslian Kode (Strict Mode)

Sesuai instruksi ujian untuk mencegah penggunaan *code generator* otomatis, kami menerapkan identitas unik pada penulisan kode sumber. 

== Watermark Code
Berikut adalah bukti penggunaan suffix inisial pada variabel dan fungsi utama dalam proses integrasi data:

===  - Vendor A (Mahasiswa 1) - Rahma Titis Pratiwi
#image("../public/vendorA/vendorA.png", width: 100%)

*Penjelasan:* Pada Vendor A, saya mengimplementasikan layanan API sederhana menggunakan Serverless Function yang didefinisikan pada file api/vendorA.js. Data produk didefinisikan secara eksplisit di dalam fungsi handler(req, res) menggunakan struktur array of object. Setiap objek merepresentasikan satu produk dengan atribut kd_produk, nm_brg, hrg, dan ket_stok. Penulisan data dilakukan secara manual tanpa menggunakan code generator otomatis, sehingga struktur dan isi data sepenuhnya dikontrol oleh Mahasiswa 1

== Logic Trap (Custom Route & Git Authentication)
Sebagai bentuk Logic Trap, Vendor A menerapkan endpoint API spesifik yang hanya tersedia melalui file api/vendorA.js. Data hanya dapat diakses apabila integrator mengetahui dan memanggil endpoint Vendor A secara eksplisit

=== - Vendor B (Mahasiswa 2) - SHAVIRA NINDYA PUTRIAWAN 
#image("../public/vendorB/vendorB.png", width: 100%)

*Penjelasan:* Pada baris **11 dan 12**, variabel `dataPath_shavira` dan `vendorData_shavira` menggunakan suffix nama saya. Hal ini membuktikan bahwa alur pembacaan data dari file JSON ke dalam memori sistem dikerjakan secara manual. Selain itu, pada baris **31**, saya menggunakan nama rute `/api/products_shavira` sebagai identitas unik layanan API Vendor B.

== Logic Trap (Custom Route & Git Authentication)
Sebagai bentuk pembuktian keaslian, saya menerapkan "Logic Trap" pada struktur output data untuk memastikan integrator (Mahasiswa 4) melakukan *parsing* secara manual


// Potongan kode dari server.js (Vendor B)
```javascript
*app.get("/api/products_shavira", (req, res) => {
  // Logic Trap: Mengarahkan integrator ke endpoint spesifik 
  // dan menggunakan variabel yang telah di-watermark
  res.json(vendorData_shavira);
});*
```

Penggunaan rute khusus ini mengharuskan tim integrator (Mahasiswa 4) untuk membaca kode sumber saya secara teliti. Jika menggunakan asumsi rute generik, data tidak akan bisa ditarik, sehingga hal ini membuktikan adanya integrasi manual antar anggota tim.
**Git Author Validation:** Seperti terlihat pada bagian bawah editor (status bar), terdapat keterangan akun "ShaviraNindya5" yang telah melakukan commit pada repositori ini. Ini membuktikan bahwa pengerjaan dilakukan di github saya sendiri

=== - Vendor C (Mahasiswa 3) - Martha Dwi Destya
#image("../public/vendorC/vendorC.png", width: 100%)

*Penjelasan:* Pada baris **11** variabel `dataPath_Martha` menggunakan suffix nama saya yaitu Martha sebagai watermark identitas. Hal ini menandakan bahwa file JSON vendorC.json dikerjakan secara spesifik oleh mahasiswa 3 dan tidak generik. Pada baris **12** variabel `vendorCData` menampung data dari file JSON ke dalam memori. Ini membuktikan alur pengambilan data dilakukan manual, bukan otomatis melalui code generator. Selanjutnya, pada baris **15**, saya membuat route khusus `/api/products_vendorC` untuk tim integrator (Mahasiswa 4) agar bisa mengakses data produk Vendor C. Selain itu, proses *database seeding* dilakukan melalui file `seed.js`, yang secara eksplisit membaca file `vendorC.json` dan memasukkan data ke NeonDB menggunakan query SQL terstruktur. Hal ini membuktikan bahwa integrasi data tidak bersifat otomatis, melainkan dirancang dan dijalankan secara sadar oleh mahasiswa  3 .

== Logic Trap (Custom Route & Git Authentication)
Sebagai bentuk *Logic Trap*, saya menerapkan kombinasi **struktur JSON bertingkat (nested)** dan **mekanisme seeding manual ke NeonDB**. Pendekatan ini mengharuskan tim integrator (Mahasiswa 4) untuk memahami struktur data secara detail sebelum melakukan proses integrasi.

```javascript
// Potongan kode dari seed.js (Vendor C)
*for (let item of data) {
      // Masukkan ke tabel products_json
      await client.query(
        `INSERT INTO products_json (id, details, pricing, stock)
         VALUES ($1, $2, $3, $4)
         ON CONFLICT (id) DO NOTHING`,
        [item.id, item.details, item.pricing, item.stock]
      );*
      ```
Integrator (Mahasiswa 4) tidak dapat langsung menggunakan data Vendor C tanpa memahami struktur internalnya. Harga akhir produk tidak tersedia secara langsung, melainkan harus dihitung dari `base_price` dan `tax` yang berada di dalam objek `pricing`. Jika integrator hanya mengasumsikan struktur data flat, maka proses normalisasi data ke format standar akan gagal.
Dengan adanya Logic Trap ini, integrator diwajibkan membaca dan memahami kode Vendor C secara manual, sehingga membuktikan bahwa proses integrasi dilakukan secara sah dan kolaboratif.

**Git Author Validation : ** Berdasarkan riwayat commit pada repositori GitHub, perubahan pada file vendorC.json, server.js, dan seed.js tercatat atas akun GitHub Mahasiswa 3 (Martha-Dwi). Hal ini membuktikan bahwa pengembangan Vendor C dilakukan secara mandiri oleh mahasiswa 3.

=== - Lead Integrator (Mahasiswa 4) - Avingka Aulia
#image("../public/integrator/server.png", width: 80%)

*Penjelasan:*  
Pada file `server.js`, saya menuliskan fungsi normalisasi data secara terpisah untuk setiap vendor, yaitu `fromVendorA`, `fromVendorB`, dan `fromVendorC`. Penamaan fungsi ini menunjukkan bahwa proses integrasi tidak bersifat generik, melainkan disesuaikan secara manual dengan struktur data masing-masing vendor. Seluruh field seperti `id`, `nama`, `harga_final`, `status`, dan `sumber` ditentukan sendiri oleh saya sebagai integrator.

== Logic Trap (Parsing Manual & Struktur Berbeda)

Sebagai bentuk *Logic Trap*, setiap vendor memiliki struktur data yang berbeda sehingga tidak dapat diproses menggunakan asumsi struktur yang sama. Hal ini memaksa saya sebagai integrator untuk membaca dokumentasi dan kode sumber vendor secara manual.

Vendor A menggunakan struktur field sederhana seperti `kd_produk`, `nm_brg`, dan `hrg`, sehingga saya menerapkan logika diskon 10% secara langsung.  
Vendor B menggunakan struktur boolean `isAvailable` dan field `price` yang sudah numerik.  
Vendor C memiliki struktur JSON bertingkat (*nested*) dengan objek `details` dan `pricing`, sehingga harga akhir harus dihitung manual dari `base_price` dan `tax`.

```javascript
// Contoh potongan kode normalisasi Vendor C
const harga = item.pricing.base_price + item.pricing.tax;
 ```
