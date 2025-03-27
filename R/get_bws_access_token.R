#' Retrieve BWS Access Token from Environment
#'
#' Retrieves the `BWS_ACCESS_TOKEN` from environment variables. This token is
#' used to authenticate with the Bitwarden Secrets Manager API.
#'
#' @return A character string containing the BWS access token.
#' @examples
#' # Set an environment variable (for testing purposes)
#' Sys.setenv(BWS_ACCESS_TOKEN = "example_token_123")
#'
#' # Retrieve the token
#' token <- get_bws_access_token()
get_bws_access_token <- function() {
  bws_access_token <- Sys.getenv("BWS_ACCESS_TOKEN")
  if (bws_access_token == "") {
    stop("No BWS_ACCESS_TOKEN provided or set as environment variable.")
  }
  return(bws_access_token)
}
