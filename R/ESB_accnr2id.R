#' Converts accession nr to ESBase id
#'
#' @param accnr An NRM accession nr
#' @return An ESBase id
#' @examples
#' ESB_accnr2id("A2022/12345");
#' @export
ESB_accnr2id <- function(accnr){
  accnr <- stringr::str_remove(accnr, "/")
  nr <- stringr::str_sub(accnr, -5)
  yr <- stringr::str_sub(accnr, -7, -6)
  lst <- stringr::str_sub(accnr, 1, 1)
  prefix <- dplyr::case_when(
    lst == "A" ~ "10",
    lst == "B" ~ "20",
    lst == "C" ~ "30"
  )
  id <- paste0(prefix, yr, nr)
  id
}
