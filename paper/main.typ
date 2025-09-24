#import "@preview/clean-math-paper:0.2.4": *
#import "lib/blokus.typ": blokus

#let date = datetime.today().display("[month repr:long] [day], [year]")

// Modify some arguments, which can be overwritten in the template call
#page-args.insert("numbering", "1/1")
#text-args-title.insert("size", 2em)
#text-args-title.insert("fill", black)
#text-args-authors.insert("size", 12pt)

#let abstract = [
  We present an impartial, single-player variant of the board game Blokus@mattel_blokus_2009. Then, we show that in general playing this game with a single polyomino is NP-Complete, by creating a reduction to circuit SAT.
]

#show: template.with(
  title: "Computational Complexity of Single Player Blokus",
  authors: (
    (name: "Ian Shehadeh"),
    (name: "Prof. Alex Meadows",  affiliation-id: 2),
  ),
  affiliations: (
    // (id: 1, name: "St. Mary's College of Maryland"),
    (id: 2, name: "St. Mary's College of Maryland"),
  ),
  date: date,
  heading-color: rgb("#0000ff"),
  link-color: rgb("#008002"),
  // Insert your abstract after the colon, wrapped in brackets.
  // Example: `abstract: [This is my abstract...]`
  abstract: abstract,
  keywords: ("Combinatorial Game Theory", "Computation Complexity", "Recreational Mathematics"),
  // Pass page-args to change page settings
  // page-args: page-args,
  // Pass text-args-authors to change author name text settings
  // text-args-authors: text-args-authors,
  // Pass text-args-title to change title text settings
  // text-args-title: text-args-title,
)

= Introduction

Blokus@mattel_blokus_2009 is a 2-4 player board originally created by mathematician Bernard Tavitian /* TODO: citation */ and published by Sekkoïa. /* TODO: citation */
Sekkoïa was bought by Mattel in 2009@staff-author_mattel_2009.

#blokus("
  __bb
  a_b
  a_b
  aa
")

#blokus("
__a__
__a__
__aa
")


#bibliography("zotero.bib")