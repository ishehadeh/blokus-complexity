#import "./to-str.typ": to-str;

#let cellColors = (
  a: rgb(0, 0, 0),
  b: rgb(255, 0, 0),
  c: rgb(0, 255,0)
);

// render a Blokus board
#let blokus(board, tile-size: 1em,  hlabel: none, vlabel: none) = {
  let str = to-str(board);
  let str_rows = str.trim().split("\n").map(v => v.trim())
  let width = calc.max(..str_rows.map(r => r.len()))
  let height = str_rows.len()
  let inset = 2pt;
  grid(
    rows: (if hlabel != none { (auto,) } else { () }) + (tile-size + inset * 2,) * height,
    columns: (if vlabel != none { (auto,) } else { () }) + (tile-size + inset * 2,) * width,
    inset: inset,
    ..if vlabel != none { ([],) } else { () },
    ..if hlabel != none {
      range(0, width).map(i => align(center)[#hlabel(i)])
    } else {
      ()
    },
    ..str_rows.enumerate().map(
      ((row_i, row)) => (
        ..if vlabel != none {
          (align(horizon)[#vlabel(row_i)],)
        } else {
          ()
        },
        ..range(width).map(
          x => {
            let cell = row.at(x, default: "_")

            grid.cell(stroke: 1pt + black,
              if cell in cellColors {
                rect(fill: cellColors.at(cell), width: tile-size, height: tile-size)
              } else if cell == "_" {
                box(width: tile-size, height: tile-size)
              } else {
                panic("invalid cell: '" + cell + "'")
              })
          }),
      )
    ).flatten()
  )
}