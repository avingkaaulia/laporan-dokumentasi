= Integrasi & Repositori Layanan

== Git Graph Repo Kelompok

Berikut adalah screenshot Git Graph dari repo kelompok kita:

#image("../public/git_graph.png")

*Keterangan:*  
- Branch `feature/vendor-c` dibuat dari `main` dan sudah digabung (merge) kembali ke `main`.  
- Commit terbaru di `main` berisi update integrator (Mahasiswa 4) dan perbaikan logika Vendor B.  
- Beberapa commit masih WIP (Work In Progress) sebelum di-merge.  
- Dari grafik ini terlihat alur kerja tim dan kontribusi masing-masing anggota.



Karena sistem ini berbasis layanan terdistribusi (*Distributed Services*), setiap komponen dikelola secara mandiri pada repositori GitHub dan di-deploy ke Vercel agar dapat diakses secara publik oleh sistem integrator.

