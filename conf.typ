#import "cover.typ"
#let project(
  title: "",
  semester: "",
  team_number: "",
  members: (),
  body
) = {

  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "id"
  )

  cover_page(
    title: title,
    semester: semester,
    team_number: team_number,
    members: members
  )

  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    numbering: "1",
    footer: align(center)[
      page-number()
    ],
  )

  counter(page).update(1)

  set heading(numbering: "1")

  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    align(center)[
      #v(1em)
      #text(size: 14pt, weight: "bold")[
        BAB #counter(heading).display()
      ]
      #v(0.5em)
      #text(size: 14pt, weight: "bold")[
        #upper(it.body)
      ]
      #v(1.5em)
    ]
  }

  body
}
