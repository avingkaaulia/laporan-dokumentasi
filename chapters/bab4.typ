= BAB VI: PENGUJIAN SISTEM (API TESTING) NNATI BERIKAN HASIL PENGUJIAN POSTMAN MU VINGKA

== Arsitektur Gateway & Integrasi
Integrator dibangun menggunakan *Node.js* dan *Express.js* sebagai *Stateless Gateway*. Sistem ini secara aktif melakukan konsumsi data dari tiga vendor melalui protokol HTTP (*fetch*) untuk menyajikan data terpusat secara *real-time*.

=== Mekanisme Gateway
Gateway berfungsi sebagai pintu masuk utama (*single entry point*) yang mengakses API Vendor A, B, dan C melalui endpoint Vercel masing-masing. Integrator melakukan *aggregation* (pengumpulan) data tanpa menyimpan data tersebut secara permanen.

=== Aturan Bisnis & Normalisasi Data
Untuk mencapai interoperabilitas, setiap data dari vendor yang memiliki skema berbeda diubah ke format standar dengan field:
- `id`, `nama`, `harga_final`, `status`, dan `sumber`.

*Aturan khusus (Business Logic) yang diterapkan:*
- **Vendor A**: Pemotongan diskon 10% dari harga original.
- **Vendor C**: Produk kategori "Food" otomatis diberi label "(Recommended)".
- **Tipe Data**: Seluruh nilai harga dipastikan bertipe *Integer*.

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