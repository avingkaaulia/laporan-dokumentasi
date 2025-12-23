#let cover_page(title: "", semester: "", team_number: "", members: ()) = {
  set page(numbering: none)
  align(center)[
    #v(2em)
    #text(size: 16pt, weight: "bold")[POLITEKNIK NEGERI BANYUWANGI]
    
    #v(1cm)
    #image("public/logo_pwg.png", width: 8cm)
    
    #v(2em)
    #text(size: 18pt, weight: "bold")[#upper(title)]
    #v(1em)
    #text(size: 14pt)[Mobile Application Development]
    #linebreak()
    #text(size: 14pt)[#semester]
    
    #v(4em)
    #text(size: 14pt, weight: "bold")[Disusun Oleh Kelompok #team_number:]
    #v(1em)
    
    #table(
      columns: (1fr, auto, 1fr),
      stroke: none,
      align: (left, left, left),
      ..members.map(m => (
        text(weight: "bold")[#m.name], 
        [#m.nim], 
        text(style: "italic")[#m.role]
      )).flatten()
    )

    #v(1fr)
    #text(size: 12pt)[Tahun 2025]
  ]
  pagebreak()
}