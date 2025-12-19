= BAB III
= Arsitektur Sistem Integrasi (Backend & Database) 

= Integrator (Stateless Gateway)
Mahasiswa 4 bertindak sebagai *Stateless Gateway*. Integrator tidak menyimpan data produk di database lokal, melainkan melakukan *fetching* secara dinamis dari API Vendor A, B, dan C. Hal ini memastikan data yang tampil di Dashboard selalu merupakan data terbaru (*real-time*) dari masing-masing vendor.

== Strategi Penyimpanan Data 
Proyek ini menggunakan pendekatan *Decentralized Database* di mana setiap vendor (A, B, dan C) memiliki database independen untuk menjaga integritas data masing-masing. Dengan sistem "dapur sendiri-sendiri" ini, jika database vendor A mengalami gangguan, data milik Vendor B tetap aman dan bisa diakses secara mandiri. Hal ini menjamin stabilitas sistem secara keseluruhan.

== Vendor A


== Vendor B

- **Vendor B (Shavira):** Menggunakan PostgreSQL (NeonDB) dengan skrip seeding seedData_shavira().
- Tabel di NeonDB: #image("../public/vendorB/tabelB.png", width: 100%)
#v(2mm)


Data Seeding (Proses Pengisian Data) Karena setiap vendor mengelola datanya sendiri, maka proses Seeding (mengisi data awal) dilakukan secara mandiri oleh masing-masing mahasiswa vendor, bukan oleh integrator.
- Data di NeonDB: #image("../public/VendorB/dataB.png", width: 100%)

== Vendor C

- **Vendor C (Martha):** Menggunakan PostgreSQL (NeonDB) dengan skrip seeding seed.js.
- Tabel di NeonDB: #image("../public/vendorC/tableVendorC.png", width: 100%)
#v(2mm)

Proses seeding data untuk Vendor C dilakukan sepenuhnya oleh saya, Martha, dengan menggunakan skrip seed.js. Skrip ini mengisi database NeonDB Vendor C dengan data produk awal yang dibutuhkan. 
- Data yang telah dimasukkan dapat dilihat pada gambar berikut:
#image("../public/vendorC/dataVendorC.png", width: 100%)

Hal ini membuktikan bahwa setiap vendor bertanggung jawab terhadap pengelolaan data mentah masing-masing. Sementara itu, Mahasiswa 4 sebagai integrator tidak mengubah data asli di database vendor; tugas integrator adalah mengambil, menormalisasi, dan memproses data sesuai kebutuhan sistem, sehingga data mentah tetap terjaga integritasnya.
