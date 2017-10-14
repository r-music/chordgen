possible_tetrads <- function(triad_type) {
  switch (triad_type,
          major = c("A4", "B-4", "B4", "D-5", "D5", "F5"),
          minor = c("A4", "B-4", "B4", "D-5", "D5", "F5"),
          augmented = c("A4", "B-4", "B4", "D-5", "D5", "F5"),
          diminished = c("B--4", "B-4", "B4"),
          sus4 = c("B-4"),
          m3d5 = c("G#4", "A4", "B-4", "B4", "D-5", "D5", "F5")
  )
}
