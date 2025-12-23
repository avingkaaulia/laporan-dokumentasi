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

