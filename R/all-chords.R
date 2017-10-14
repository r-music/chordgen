all_chords <- function() {
  ct <- music21$harmony$CHORD_TYPES
  chords <- purrr::map_dfr(
    .x = stats::setNames(names(ct), names(ct)),
    .f = ~tibble::as_tibble(purrr::set_names(ct[[.x]], c("notes", "names"))),
    .id = "chord"
  ) %>%
    dplyr::group_by(chord, notes) %>%
    dplyr::summarise(names = paste(names, collapse = ",")) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(
      n_notes = stringr::str_count(notes, ",") + 1,
      notes_c = notes %>%
        stringr::str_split(",") %>%
        purrr::map_chr(index_to_chord_chr)
    ) %>%
    dplyr::arrange(n_notes) %>%
    dplyr::filter(n_notes > 2, !stringr::str_detect(chord, "^[A-Z]"))
  chords
}

index_to_chord_chr <- function(x) {
  notes <- LETTERS[c(3:7, 1:2)]
  note_index <- x %>%
    stringr::str_replace_all("[^0-9]", "") %>%
    as.numeric() %>%
    abs() %% 7
  note_index[note_index == 0] <- 7
  accidents <- x %>%
    stringr::str_replace_all("[0-9]", "")
  paste0(notes[note_index], accidents, collapse = " ")
}
