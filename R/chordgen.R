#' Generate random chords
#'
#' Generate random chords using many options
#'
#' @param n number of chords
#' @param n_notes number of notes used for each chord. Between 3 and 7.
#' @param invert make inversions flag
#' @param triad_types 1:major, 2:minor, 3:augmented, 4:diminished,
#'   5:sus4, 6:m3d5
#' @param octave add octaves
#' @param transpose interval to make transpositions
#' @param add_lyric add text below chords?
#'
#' @export
chordgen <- function(n, n_notes = 4, invert = TRUE,
                     triad_types = 1:5,
                     octave = seq(-1, 1, 1),
                     transpose = seq(-5, 6, 1),
                     add_lyric = TRUE) {
  s <- music21$stream$Stream()
  chords <- purrr::map(seq_len(n), chordgen_,
                       n_notes = n_notes, invert = invert,
                       triad_types = triad_types,
                       octave = octave,
                       transpose = transpose,
                       add_lyric = add_lyric)
  for(chord in chords) s$append(chord)
  s
}

chordgen_ <- function(n, n_notes, invert, triad_types,
                      octave, transpose, add_lyric) {
  n <- sample(rep(n_notes, 2), 1)
  if (n > 4) {
    ch <- all_chords() %>%
      dplyr::filter(n_notes == n) %>%
      dplyr::sample_n(1) %>%
      dplyr::pull(notes_c) %>%
      chord()
  } else {
    triad_type <- sample(rep(triad_types, 2), 1)
    ch <- triad(triad_type)
    if (n == 4) {
      accident <- sample(possible_tetrads(triad_type), 1)
      ch$add(accident)
    }
  }
  # transpose!
  transpose_value <- sample(rep(transpose, 2), 1)
  transpose_value <- transpose_value + 12 * sample(rep(octave, 2), 1)
  ch <- ch$transpose(transpose_value)
  root_transpose <- music21$note$Note("C4")$transpose(transpose_value)
  ch$root(root_transpose)

  # invert!
  if (invert) {
    invert_value <- sample(rep(0:(n-1), 2), 1)
    copy <- reticulate::import("copy")
    ch2 <- copy$deepcopy(ch)
    res <- try({
      ch2$inversion(invert_value, transposeOnSet = TRUE)
    }, silent = TRUE)
    if (class(res) != "try-error") ch <- ch2
  }

  if (add_lyric) {
    ch$simplifyEnharmonics(inPlace = TRUE)
    h <- music21$harmony$chordSymbolFigureFromChord(ch)
    if (stringr::str_detect(h, "Cannot")) h <- "?"
    ch$addLyric(h)
  }
  ch
}
