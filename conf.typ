#import "cover.typ": cover_page

#let project(title: "", semester: "", team_number: "", members: (), body) = {
  set page(paper: "a4", margin: (x: 2.5cm, y: 2.5cm))
  set text(font: "Times New Roman", size: 12pt, lang: "id")

  cover_page(title: title, semester: semester, team_number: team_number, members: members)

  set page(numbering: "1")
  counter(page).update(1)
  set heading(numbering: "1.1")

  // --- LOGIKA ANTI HALAMAN KOSONG ---
  show heading.where(level: 1): it => {
    // Cek apakah judul mengandung kata "BAB"
    let is_bab_label = it.body.has("text") and it.body.text.contains("BAB")
    
    // HANYA pindah halaman jika judulnya adalah label nomor BAB (misal: "BAB III")
    // Jika judul di bawahnya (tanpa kata BAB), JANGAN pindah halaman lagi
    if is_bab_label {
      pagebreak(weak: true)
    }

    set align(center)
    set text(size: 14pt, weight: "bold")
    
    // Atur spasi agar nomor BAB dan Judul menempel rapat
    block(width: 100%, inset: (
      top: if is_bab_label { 1.5em } else { 0em }, 
      bottom: 0.6em
    ))[
      #upper(it.body)
    ]
  }

  body
}