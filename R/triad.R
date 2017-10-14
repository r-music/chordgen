triad <- function(triad_type = 'major') {
  notes <- switch(
    triad_type,
    major = "C4 E4 G4",
    minor = "C4 E-4 G4",
    augmented = "C4 E4 G#4",
    diminished = "C4 E-4 G-4",
    sus4 = "C4 F4 G4",
    m3d5 = "C4 E4 G-4"
  )
  if (!is.character(notes))
    stop("triad_type should be one of: major, minor, augmented, diminished, sus4 and m3d5")
  chord(notes)
}
