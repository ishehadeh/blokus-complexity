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
    (name: "Ian Shehadeh", affiliation-id: 1),
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

= Equations

The template uses #link("https://typst.app/universe/package/i-figured/")[`i-figured`] for labeling equations. Equations will be numbered only if they are labelled. Here is an equation with a label:

$
  sum_(k=1)^n k = (n(n+1)) / 2
$<equation>

We can reference it by `@eq:label` like this: @eq:equation, i.e., we need to prepend the label with `eq:`. The number of an equation is determined by the section it is in, i.e. the first digit is the section number and the second digit is the equation number within that section.

Here is an equation without a label:

$
  exp(x) = sum_(n=0)^oo (x^n) / n!
$

As we can see, it is not numbered.

= Theorems

The template uses #link("https://typst.app/universe/package/great-theorems/")[`great-theorems`] for theorems. Here is an example of a theorem:

#theorem(title: "Example Theorem")[
  This is an example theorem.
]<th:example>
#proof[
  This is the proof of the example theorem.
]


We also provide `definition`, `lemma`, `remark`, `example`, and `question`s among others. Here is an example of a definition:

#definition(title: "Example Definition")[
  This is an example definition.
]

#question(title: "Custom mathblock?")[
  How do you define a custom mathblock?
]

#let answer = my-mathblock(
  blocktitle: "Answer",
  bodyfmt: text.with(style: "italic"),
)

#answer[
  You can define a custom mathblock like this:
  ```typst
  #let answer = my-mathblock(
    blocktitle: "Answer",
    bodyfmt: text.with(style: "italic"),
  )
  ```
]

Similar as for the equations, the numbering of the theorems is determined by the section they are in. We can reference theorems by `@label` like this: @th:example.


#lorem(50)

#bibliography("zotero.bib")

// Create appendix section
#show: appendices
=

If you have appendices, you can add them after `#show: appendices`. The appendices are started with an empty heading `=` and will be numbered alphabetically. Any appendix can also have different subsections.

== Appendix section

#lorem(100)
