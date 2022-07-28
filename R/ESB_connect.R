#' Connect to ESBase
#'
#' Initiates a connection to ESBase. Note this requires the user to have access to http://esbase.nrm.se, i.e. an account and a connection on the local NRM network.
#' @param user ESBase user name
#' @param password ESBase password
#' @return A connection (an rvest_session)
#' @examples
#' \dontrun{
#' con <- ESB_connection(my_username, my_password)
#' }
#' @export
ESB_connection <- function(user, password){
  con <- rvest::session("http://esbase.nrm.se")
  login_form <- rvest::html_form(con)
  filled_form <- rvest::html_form_set(login_form[[1]], login_userid = user, login_password = password)
  rvest::session_submit(con, filled_form)
  con
}
