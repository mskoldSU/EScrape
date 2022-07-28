#' Converts geographical coordinates
#'
#' Converts coordinates of the form "E 19 51,52" to decimal degrees. Mainly for internal use.
#' @param degree A text string coordinate
#' @return A decimal coordinate
#' @examples
#' ESB_deg2dec(c("N 63 32,49", "E 19 51,52", "W 19 51,52"))
#' @export

ESB_deg2dec <- function(degree){
  dec_degree <- degree |>
    stringr::str_sub(3) |>
    stringr::str_replace(",", ".") |>
    stringr::str_split(" ") |>
    purrr::map_dbl(function(x) as.numeric(x[1]) + as.numeric(x[2])/60)
  dec_degree * (-1)^(stringr::str_sub(degree, 1, 1) %in% c("S", "W"))
}
