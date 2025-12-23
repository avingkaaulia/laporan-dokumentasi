#import "conf.typ": project
#import "cover.typ": cover_page

// Data Kelompok Sesuai Pesan Sebelumnya
#let members_data = (
  (name: "Rahma Titis Pratiwi", nim: "362458302052", role: "Vendor A"),
  (name: "Shavira Nindya Putriawan", nim: "362458302150", role: "Vendor B"),
  (name: "Martha Dwi Destya", nim: "362458302136", role: "Vendor C"),
  (name: "Avingka Aulia", nim: "362458302045", role: "Lead Integrator"),
)

#show: doc => project(
  title: "INTEROPERABILITAS",
  semester: "Semester Ganjil 2024/2025",
  team_number: "04",
  members: members_data,
  doc
)


// Include Bab-bab
#include "chapters/bab1.typ"
#include "chapters/bab2.typ"
#include "chapters/bab3.typ"
#include "chapters/bab4.typ"
#include "chapters/bab5.typ"
#include "chapters/bab6.typ"
#include "chapters/bab7.typ"