== Pengujian Sistem Integrator

Pengujian dilakukan untuk memastikan bahwa layanan interoperability integrator dapat menggabungkan data dari beberapa vendor dengan struktur berbeda ke dalam satu format standar. Pengujian dilakukan dengan mengakses endpoint integrator melalui browser dan API testing tool (Postman).

=== Handling Data & Normalisasi

Pengujian menunjukkan bahwa sistem integrator mampu menangani perbedaan struktur data dari Vendor A, Vendor B, dan Vendor C dengan baik. Data yang diterima dari masing-masing vendor berhasil dinormalisasi ke dalam format standar tanpa menyebabkan error, meskipun jumlah data antar vendor berbeda.

Sistem juga mampu menangani kondisi ketika salah satu vendor tidak mengirimkan data atau mengalami keterlambatan respon. Pada kondisi tersebut, integrator tetap dapat menampilkan data dari vendor lain tanpa menghentikan proses integrasi secara keseluruhan.

=== Hasil Pengujian Endpoint Integrator

Pengujian endpoint integrator dilakukan melalui URL berikut:

Endpoint URL: #link("https://interoperability-integrator.vercel.app/products
")

Berikut merupakan contoh response JSON yang dihasilkan oleh sistem integrator setelah proses normalisasi dan penerapan aturan bisnis:
```json
[
  {
    "id": "A001",
    "nama": "Kopi Bubuk 200g",
    "harga_final": 13500,
    "status": "ada",
    "sumber": "Vendor A"
  },
  {
    "id": "TSHIRT-001",
    "nama": "Ijen Crater T-Shirt",
    "harga_final": 75000,
    "status": "tersedia",
    "sumber": "Vendor B"
  },
  {
    "id": 501,
    "nama": "Nasi Tempong (Recommended)",
    "harga_final": 22000,
    "status": "tersedia",
    "sumber": "Vendor C"
  }
]
```
#v(5mm)
== Kesimpulan
Hasil pengujian menunjukkan bahwa data dari berbagai vendor berhasil digabungkan dan disajikan dalam satu format yang konsisten. Aturan bisnis seperti pemberian diskon pada Vendor A dan penambahan label rekomendasi pada produk kategori Food dari Vendor C telah diterapkan dengan benar.

== Link Video Demo
Sebagai bukti bahwa sistem integrator berjalan dengan baik, berikut disertakan video demo pengujian endpoint integrator:

Link Video Demo: [https://www.youtube.com/watch?v=vq_4ZwyewRg]

Video tersebut menampilkan proses pemanggilan endpoint integrator serta hasil respon JSON yang dihasilkan secara real-time.