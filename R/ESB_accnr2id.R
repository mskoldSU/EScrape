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
  yr <- stringr::str_sub(accnr, -8, -6)
  lst <- stringr::str_sub(accnr, 1, 1) |> toupper()
  prefix <- dplyr::case_when(
    lst == "A" ~ "1",
    lst == "B" ~ "2",
    lst == "C" ~ "3",
    lst == "D" ~ "4",
    lst == "G" ~ "7",
    lst == "H" ~ "8",
    lst == "L" ~ "5",
    lst == "P" ~ "9",
    lst == "X" ~ "6",
    TRUE ~ "0"
  )
  id <- paste0(prefix, yr, nr)
  id
}
