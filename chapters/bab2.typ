= BAB II
== Bukti Keaslian Kode (Strict Mode)

Sesuai instruksi ujian untuk mencegah penggunaan *code generator* otomatis, kami menerapkan identitas unik pada penulisan kode sumber. 

== Watermark Code
Berikut adalah bukti penggunaan suffix inisial pada variabel dan fungsi utama dalam proses integrasi data:

=== Vendor A (Mahasiswa 1)
#image("../public/vendorB/vendorB.png", width: 80%) KASIH PENJELASAN DAN LOGIC TRAP KAYA PUNYAKU.

#v(50mm)
=== Vendor B (Mahasiswa 2) - SHAVIRA NINDYA PUTRIAWAN 
#image("../public/vendorB/vendorB.png", width: 80%)

*Penjelasan:* Pada baris **11 dan 12**, variabel `dataPath_shavira` dan `vendorData_shavira` menggunakan suffix nama saya. Hal ini membuktikan bahwa alur pembacaan data dari file JSON ke dalam memori sistem dikerjakan secara manual. Selain itu, pada baris **31**, saya menggunakan nama rute `/api/products_shavira` sebagai identitas unik layanan API Vendor B.

== Logic Trap (Custom Route & Git Authentication)
Sebagai bentuk pembuktian keaslian, saya menerapkan "Logic Trap" pada struktur output data untuk memastikan integrator (Mahasiswa 4) melakukan *parsing* secara manual. 

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


