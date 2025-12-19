== Arsitektur Gateway & Integrasi
- *Endpoint URL*: #link("https://interoperability-integrator.vercel.app/products")
Sistem integrator dibangun menggunakan *Node.js* dan *Express.js* dengan konsep *Stateless Gateway*. Artinya, integrator tidak menyimpan data produk ke dalam database lokal, melainkan hanya mengambil data dari Vendor A, Vendor B, dan Vendor C melalui protokol HTTP (*fetch*).
Pendekatan ini memungkinkan sistem menyajikan data terpusat secara *real-time* serta memastikan bahwa data yang ditampilkan selalu merupakan data terbaru dari masing-masing vendor.

=== Mekanisme Gateway

Gateway berfungsi sebagai pintu masuk utama (*single entry point*) bagi pengguna untuk mengakses data produk. Ketika endpoint integrator diakses, sistem akan:
- Mengirim permintaan (*request*) ke API Vendor A, B, dan C
- Menerima data mentah (*raw data*) dari masing-masing vendor
- Melakukan normalisasi dan penerapan aturan bisnis
- Menggabungkan seluruh data ke dalam satu respon JSON

Integrator hanya melakukan proses *aggregation* tanpa menyimpan data tersebut secara permanen.

=== Aturan Bisnis & Normalisasi Data

Karena setiap vendor memiliki struktur data yang berbeda, integrator melakukan proses normalisasi ke dalam format standar agar data dapat digunakan secara seragam. Format standar yang digunakan terdiri dari field:
- `id`
- `nama`
- `harga_final`
- `status`
- `sumber`

Aturan bisnis (*business logic*) yang diterapkan pada proses normalisasi adalah sebagai berikut:
- **Vendor A**: Harga produk dikenakan diskon sebesar 10% dari harga asli.
- **Vendor C**: Produk dengan kategori *Food* secara otomatis diberi label tambahan “(Recommended)”.
- **Tipe Data**: Seluruh nilai harga dipastikan bertipe *Integer* untuk menjaga konsistensi data.

== VendorA
Vendor A menyediakan API produk yang diakses oleh Integrator melalui endpoint Vercel. Data yang dikirimkan merupakan data asli (raw data) yang bersumber dari PostgreSQL (NeonDB) milik Vendor A dan belum melalui proses normalisasi maupun aturan bisnis dari gateway
- *Endpoint URL*: #link("https://vendor-a-orcin.vercel.app/api/vendorA")

=== Output JSON API (Vendor A) Ini disediakan untuk integrator
```json
[
  {
    "kd_produk": "A001",
    "nm_brg": "Kopi Bubuk 200g",
    "hrg": 15000,
    "ket_stok": "ada"
  },
  {
    "kd_produk": "A002",
    "nm_brg": "Gula Aren 250g",
    "hrg": 12000,
    "ket_stok": "habis"
  },
  {
    "kd_produk": "A003",
    "nm_brg": "Teh Celup 50pcs",
    "hrg": 9000,
    "ket_stok": "ada"
  }
]
```

#v(5mm)

== Vendor B 
Vendor B menggunakan **PostgreSQL (NeonDB)** sebagai sumber data utama. Pengujian pada endpoint Vendor B menunjukkan respon data asli (*raw data*) sebelum diproses oleh Integrator.
- *Endpoint URL*: #link("https://2050-shavira-nindya-uas-vendor-b-kg.vercel.app/products")

=== Output JSON API (Vendor B) Ini disediakan untuk integrator
```json
[
  {
    "sku": "TSHIRT-001",
    "productName": "Ijen Crater T-Shirt",
    "price": 75000,
    "isAvailable": true
  },
  {
    "sku": "WEAR-882",
    "productName": "Gandrung Motion Sensor Fitness Band",
    "price": 178000,
    "isAvailable": true
  },
  {
    "sku": "AUDIO-334",
    "productName": "Red Island Wireless Pocket Speaker",
    "price": 98000,
    "isAvailable": false
  },
  {
    "sku": "ACC-129",
    "productName": "Osing Engraved Stainless Keyholder",
    "price": 59000,
    "isAvailable": true
  },
  {
    "sku": "HOME-721",
    "productName": "Banyuwangi Breeze Aroma Diffuser",
    "price": 145000,
    "isAvailable": true
  }
]
```

== Vendor C
Vendor C menggunakan **PostgreSQL (NeonDB)** sebagai sumber data utama. Data produk diambil melalui API yang telah saya sediakan pada endpoint Vercel, dan digunakan oleh integrator untuk penggabungan serta normalisasi data.
- **Endpoint URL Vendor C** : #link("https://vendorc-kuliner.vercel.app/products")

=== Output JSON API (Vendor C) Ini disediakan untuk integrator
```json
[
  {
    "id": 501,
    "details": {
      "name": "Nasi Tempong",
      "category": "Food"
    },
    "pricing": {
      "base_price": 20000,
      "tax": 2000
    },
    "stock": 50
  },
  {
    "id": 502,
    "details": {
      "name": "Es Teh Manis",
      "category": "Drink"
    },
    "pricing": {
      "base_price": 5000,
      "tax": 500
    },
    "stock": 100
  },
  {
    "id": 503,
    "details": {
      "name": "Pisang Goreng",
      "category": "Snack"
    },
    "pricing": {
      "base_price": 10000,
      "tax": 1000
    },
    "stock": 30
  },
  {
    "id": 504,
    "details": {
      "name": "Ayam Bakar Taliwang",
      "category": "Food"
    },
    "pricing": {
      "base_price": 35000,
      "tax": 3500
    },
    "stock": 25
  },
  {
    "id": 505,
    "details": {
      "name": "Jus Alpukat",
      "category": "Drink"
    },
    "pricing": {
      "base_price": 12000,
      "tax": 1200
    },
    "stock": 40
  }
]
```