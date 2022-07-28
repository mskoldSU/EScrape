#' Get projects
#'
#' Downloads a tibble containing details of projects stored in ESBase.
#' @param con A connection initiated by ESB_connect
#' @return A tibble
#' @examples
#' \dontrun{
#' con <- ESB_connection(my_username, my_password)
#' projects <- ESB_projects(con)
#' }
#' @export
ESB_projects <- function(con){
  url <- "http://esbase.nrm.se/project_list?catalog=&show_all=on"
  page <- rvest::session_jump_to(con, url)
  tables <- rvest::html_table(page)
  dplyr::arrange(tables[[3]], dplyr::desc(1:dplyr::n()))
}
