#' Gets accession information
#'
#' Downloads the accession information of an individual from ESBase
#' @param con A connection initiated by ESB_connect
#' @param accnr An accession number
#' @return A tibble
#' @examples
#' \dontrun{
#' con <- ESB_connection(my_username, my_password)
#' ESB_read_accession(con, "A2022/12345")
#' }
#' @export

ESB_read_accession <- function(con, accnr, quietly = FALSE){
  if (quietly == FALSE)
    cat("Progress: ")
  purrr::map_df(accnr, function(x){
    id <- ESB_accnr2id(x)
    url <- URLencode(paste0("http://esbase.nrm.se/accession?id=", id))
    page <- rvest::session_jump_to(con, url)
    entry <- tibble::tibble(
      catalog = rvest::html_node(page, css = "#table_catalog") |> rvest::html_text(),
      accnr = rvest::html_node(page, css = "#table_aid") |> rvest::html_attr("value"),
      species = rvest::html_node(page, css = "#table_Accession_SpeciesId") |> ESB_get_selected(),
      project = rvest::html_node(page, css = "#table_Accession_ProjectId") |> ESB_get_selected(),
      arrived_date = rvest::html_node(page, css = "#table_Accession_ArrivalDate") |> rvest::html_attr("value"),
      found_date_start = rvest::html_node(page, css = "#table_discovery_date_start") |> rvest::html_attr("value"),
      found_date_end = rvest::html_node(page, css = "#table_discovery_date_end") |> rvest::html_attr("value"),
      found_circumstances = rvest::html_node(page, css = "#table_Accession_DiscoveryId") |> ESB_get_selected(),
      found_note = rvest::html_node(page, css = "#table_Accession_Description") |> rvest::html_text(),
      found_place = rvest::html_node(page, css = "#table_Accession_FindplaceNote") |> rvest::html_text(),
      latitude = rvest::html_node(page, css = "#table_Latitude") |> rvest::html_attr("value") |> ESB_deg2dec(),
      longitude = rvest::html_node(page, css = "#table_Longitude") |> rvest::html_attr("value") |> ESB_deg2dec(),
      accession_note = rvest::html_node(page, css = "#table_Accession_Note") |> rvest::html_text()
    )
    if (quietly == FALSE)
      cat(paste0(x, " "))
    entry
  })
}
