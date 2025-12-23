"#import "conf.typ": project

#show: project.with(
  title: "Interoperabilitas",
  semester: "Semester Ganjil 2024/2025",
  team_number: "04",
  members: (
    (name: "Rahma Titis Pratiwi", nim: "362458302052", role: "Vendor A"),
    (name: "Shavira Nindya Putriawan", nim: "362458302150", role: "Vendor B"),
    (name: "Martha Dwi Destya", nim: "362458302035", role: "Vendor C"),
    (name: "Avingka Aulia", nim: "362458302041", role: "Lead Integrator"),
  )
)

// Konten di bawah ini otomatis akan memiliki nomor halaman
#include "chapters/bab1.typ"
#include "chapters/bab2.typ"
#include "chapters/bab3.typ"
#include "chapters/bab4.typ"
#include "chapters/bab5.typ"
#include "chapters/bab6.typ"
#include "chapters/bab7.typ"
