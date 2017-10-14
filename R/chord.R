chord <- function(notes, root_first = TRUE, duration = 4) {
  notes <- stringr::str_trim(notes)
  d <- music21$duration$Duration(duration)
  ch <- music21$chord$Chord(notes, duration = d)
  if (root_first) ch$root(stringr::str_extract(notes, "^[^ ]+"))
  ch
}
