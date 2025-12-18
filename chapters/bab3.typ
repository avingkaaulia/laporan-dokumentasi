= BAB III
== Implementasi Integrator

Integrator dibangun menggunakan Node.js dan Express.js.
Aplikasi ini mengambil data dari tiga vendor menggunakan HTTP request (fetch).

=== Gateway
Gateway berfungsi sebagai pintu masuk utama yang mengakses API vendor A, B, dan C
melalui endpoint masing-masing.

=== Normalisasi Data
Setiap data vendor diubah ke format standar dengan field:
- id
- nama
- harga_final
- status
- sumber

=== Aturan Bisnis
Aturan khusus diterapkan sebagai berikut:
- Vendor A mendapatkan diskon 10% dari harga awal
- Vendor C dengan kategori "Food" diberi label "(Recommended)"
- Semua harga dikonversi ke tipe Integer

Endpoint utama integrator adalah:
GET /products
