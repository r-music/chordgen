#' Chords
#'
#' Chords
#'
#' @export
chords <- function() {
  c('C', 'D', 'E', 'F', 'G', 'A', 'B')
}

bsus <- function() {
  c('', '#', 'b')
}

min_maj <- function() {
  c('', 'm', ' dim', ' aug', ' sus2', ' sus4')
}

setima <- function() {
  c('', ' maj7', ' 7', ' Ø')
}

dissonance <- function() {
  c('', ' 9', ' 13')
}

adds <- function() {
  c('(add 9)', '(add 13)', '(#11)')
}

aplicar_regras <- function(x) {
  if (x[4] == 'Ø') x[3] <- ''
  if (x[4] != '7') x[3] <- ''
  if (x[5] != '') x[4] <- ''
  x
}

gerar_um <- function(i) {
  componentes <- c(
    sample(chords(), 1),
    sample(bsus(), 1),
    sample(min_maj(), 1),
    sample(setima(), 1),
    sample(dissonance(), 1)
  )
  componentes <- aplicar_regras(componentes)
  paste(componentes, collapse = '')
}

gerar_n <- function(n = 1) {
  purrr::map_chr(1:n, gerar_um)
}
