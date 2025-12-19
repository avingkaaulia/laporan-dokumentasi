= BAB I
== Pendahuluan

Pemerintah Kabupaten Banyuwangi saat ini sedang mengembangkan "Banyuwangi Marketplace" untuk menyatukan data produk UMKM dalam satu dashboard terpadu. Kendala utamanya adalah data tersebut berasal dari tiga vendor kasir yang berbeda-beda, sehingga struktur datanya (_JSON Schema_) tidak seragam.

Dalam proyek ini, kami bertindak sebagai tim *Backend Integrator*. Tugas utama kami adalah membuat sebuah layanan yang bisa menarik data dari ketiga vendor tersebut, melakukan *parsing*, serta menormalisasi datanya menjadi satu format standar yang siap digunakan oleh dashboard pemerintah.

== Pembagian Kerja

Berikut adalah detail pembagian tugas tim untuk menangani perbedaan spesifikasi data dari tiap vendor:

#table(
  columns: (auto, 1fr, 2fr),
  inset: 10pt,
  align: horizon,
  fill: (x, y) => if y == 0 { gray.lighten(90%) },
  [*Mahasiswa*], [*Peran*], [*Tanggung Jawab*],
  
  [Mahasiswa 1], [Vendor A (Warung Legacy)], [Menangani sistem lama di mana semua data berupa _String_ (termasuk harga) dan stok menggunakan istilah "ada/habis".],
  
  [Mahasiswa 2], [Vendor B (Distro Modern)], [Menyediakan data standar dengan Bahasa Inggris, format _camelCase_, serta tipe data _Number_ dan _Boolean_.],
  
  [Mahasiswa 3], [Vendor C (Resto & Kuliner)], [Mengelola data kompleks (_Nested Object_) yang memisahkan harga dasar dengan pajak serta kategori produk.],
  
  [Mahasiswa 4], [Lead Integrator], [Menyusun logika penggabungan data, normalisasi tipe data, perhitungan diskon Vendor A, dan pemberian label khusus Vendor C.],
)

#v(5mm)

*Logika Integrasi (Mahasiswa 4):*
#set enum(indent: 1cm)
+ *Penyesuaian Tipe Data:* Mengubah harga dari Vendor A yang berbentuk _String_ menjadi angka (_Integer_) agar seragam dan bisa diolah.
+ *Penerapan Diskon:* Membuat logika pemotongan harga otomatis sebesar 10% khusus untuk produk dari Vendor A.
+ *Mapping Data Kompleks:* Menggabungkan harga dasar dan pajak dari Vendor C, serta menambahkan keterangan "(Recommended)" jika kategorinya adalah makanan (_Food_).
+ *Penyeragaman Status:* Memastikan semua status ketersediaan barang ditulis dengan istilah yang sama, yaitu "Tersedia" atau "Habis".