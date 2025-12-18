= BAB II
== Arsitektur Sistem

Sistem terdiri dari empat komponen utama:

- Vendor A (Warung Legacy)
- Vendor B (Distro Modern)
- Vendor C (Resto & Kuliner)
- Integrator (Mahasiswa 4)

Masing-masing vendor menyediakan API dengan struktur data berbeda.
Integrator berfungsi sebagai API Gateway yang mengambil data dari seluruh vendor,
melakukan normalisasi, lalu menampilkan hasil akhir dalam satu format standar.

Alur sistem:
Vendor → API Gateway → Client (Postman / Browser)
