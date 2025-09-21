
// source: https://github.com/typst/typst/issues/2196#issuecomment-1728135476

#let to-str(it) = {
  if type(it) == str {
    it
  } else if type(it) != content {
    str(it)
  } else if it.has("text") {
    it.text
  } else if it.has("children") {
    it.children
      .map(to-str)
      .filter((s) => s.trim() != "")
      .join("\n")
  } else if it.has("body") {
    to-str(it.body)
  } else if it == [ ] {
    " "
  }
}
