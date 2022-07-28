#' Get selected item from drop-down menu
#'
#' Mainly for internal use
#' @param node A html node
#' @return A value
ESB_get_selected <- function(node){
  node |>
    as.character() |>
    stringr::str_extract("(?<=selected>)(.*)(?=<)") |>
    trimws()
}
