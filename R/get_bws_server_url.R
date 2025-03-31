#' Retrieve BWS Server URL from Environment
#'
#' Retrieves the `BWS_SERVER_URL` from environment variables. This URL is
#' used to define the Bitwarden Secrets Manager server endpoint.
#'
#' @return A character string containing the BWS server URL.
#' @examples
#' \dontrun{
#' # Set an environment variable for the server URL (example value)
#' Sys.setenv(BWS_SERVER_URL = "https://vault.bitwarden.eu")
#'
#' # Retrieve the server URL
#' url <- get_bws_server_url()
#' print(url)
#' }
get_bws_server_url <- function() {
  bws_server_url <- Sys.getenv("BWS_SERVER_URL")
  if (bws_server_url == "") {
    stop("No BWS_SERVER_URL provided or set as environment variable.")
  }
  return(bws_server_url)
}
