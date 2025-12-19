#set text(font: "linux libertine", size: 11pt)

= Integrasi & Repositori Layanan

Karena sistem ini berbasis layanan terdistribusi (*Distributed Services*), setiap komponen dikelola secara mandiri pada repositori GitHub dan di-deploy ke Vercel agar dapat diakses secara publik oleh sistem integrator.

== Daftar Repositori & Endpoint

  KALIAN UBAH LINK GITHUB SAMA VERCEL E YAW
#table(
  columns: (auto, auto, 1fr, 1fr),
  inset: 10pt,
  align: horizon,
  [*Peran*], [*Mahasiswa*], [*URL GitHub (Kode)*], [*URL Vercel (Live API)*],
  
  [Vendor A], 
  [Rahma Titis], 
  [#link("https://github.com/user/vendor-a")], 
  [#link("https://vendor-7btmgn6ma-rahma-titis-projects.vercel.app/vendorA")],
  
  [Vendor B], 
  [Shavira Nindya Putriawan], 
  [#link("https://github.com/ShaviraNindya5/UAS-VendorB.git")], 
  [#link("https://2050-shavira-nindya-uas-vendor-b-kg.vercel.app/products")],
  
  [Vendor C], 
  [Mahasiswa 3], 
  [#link("https://github.com/Martha-Dwi/vendorC-kuliner")], 
  [#link("https://vendorc-kuliner.vercel.app/products")],
  
  [Integrator], 
  [Mahasiswa 4], 
  [#link("https://github.com/user/integrator")], 
  [#link("https://link-vercel-integrator.app")],
)

= Integrasi & Git Branching

== Strategi Branching (Independent Repositories)

Dalam proyek ini, tidak terdapat visualisasi **Git Graph terpusat** dikarenakan setiap vendor menggunakan repositori GitHub yang terpisah secara mandiri. Strategi ini diambil untuk mencerminkan arsitektur *Microservices* di mana setiap penyedia data memiliki kontrol penuh atas infrastrukturnya sendiri.

Integrasi dilakukan sepenuhnya melalui **API Endpoints** yang di-deploy ke cloud (Vercel).

#v(1cm)
// Silakan masukkan screenshot Git Graph di bawah ini menggunakan(image("path/to/image.png"))