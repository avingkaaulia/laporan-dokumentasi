= BAB I
== Pendahuluan

Pemerintah Kabupaten Banyuwangi saat ini sedang mengembangkan "Banyuwangi Marketplace" untuk menyatukan data produk UMKM dalam satu dashboard terpadu. Kendala utama yang dihadapi adalah data produk berasal dari beberapa vendor kasir yang berbeda, yaitu Vendor A, Vendor B, dan Vendor C, di mana masing-masing vendor memiliki sistem backend serta struktur data (_JSON Schema_) yang tidak seragam.

Dalam proyek ini, dikembangkan sebuah layanan *Backend Integrator* yang berfungsi sebagai lapisan integrasi (*interoperability layer*). Layanan ini bertugas untuk mengambil data produk dari backend Vendor A, Vendor B, dan Vendor C melalui API, melakukan proses *parsing* dan normalisasi data, serta menyajikannya ke dalam satu format standar yang siap digunakan oleh dashboard Pemerintah Kabupaten Banyuwangi.


== Pembagian Kerja

Berikut adalah detail pembagian tugas tim untuk menangani perbedaan spesifikasi data dari tiap vendor:

#table(
  columns: (auto, 1fr, 2fr),
  inset: 10pt,
  align: horizon,
  fill: (x, y) => if y == 0 { gray.lighten(90%) },
  [*Mahasiswa*], [*Peran*], [*Tanggung Jawab*],
  
  [Rahma], [Vendor A (Warung Legacy)], [Menangani sistem lama di mana semua data berupa _String_ (termasuk harga) dan stok menggunakan istilah "ada/habis".],
  
  [Shavira], [Vendor B (Distro Modern)], [Menyediakan data standar dengan Bahasa Inggris, format _camelCase_, serta tipe data _Number_ dan _Boolean_.],
  
  [Martha], [Vendor C (Resto & Kuliner)], [Mengelola data kompleks (_Nested Object_) yang memisahkan harga dasar dengan pajak serta kategori produk.],
  
  [Avingka], [Lead Integrator], [Menyusun logika penggabungan data, normalisasi tipe data, perhitungan diskon Vendor A, dan pemberian label khusus Vendor C.],
)

#v(5mm)

*Logika Integrasi (Mahasiswa 4):*
#set enum(indent: 1cm)
+ *Penyesuaian Tipe Data:* Mengubah harga dari Vendor A yang berbentuk _String_ menjadi angka (_Integer_) agar seragam dan bisa diolah.
+ *Penerapan Diskon:* Membuat logika pemotongan harga otomatis sebesar 10% khusus untuk produk dari Vendor A.
+ *Mapping Data Kompleks:* Menggabungkan harga dasar dan pajak dari Vendor C, serta menambahkan keterangan "(Recommended)" jika kategorinya adalah makanan (_Food_).
+ *Penyeragaman Status:* Memastikan semua status ketersediaan barang ditulis dengan istilah yang sama, yaitu "Tersedia" atau "Habis".