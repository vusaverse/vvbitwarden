#' Get a secret from you bws vault
#'
#' This function takes a key of your secret and returns the corresponding value
#'
#' @param key A character string
#' @param access_token Optional. A character string
#' @param server_url Optional. A character string
#'
#' @return A character string containing your secret
#' @export
#'
get_bws_secret <- function(key, access_token = Sys.getenv("BITWARDEN_ACCES_TOKEN"), server_url = "https://vault.bitwarden.eu") {
  # Validate access token
  if (access_token == "") {
    stop("No BWS_ACCESS_TOKEN provided or set as environment variable.")
  }

  # Directly retrieve the secret value for a specific key
  result <- processx::run(
    command = "bws",
    args = c("secret", "get", key, "-t", access_token, "-c", "no", "--server-url", server_url),
    error_on_status = TRUE
  )

  # Parse and return only the value
  secret <- jsonlite::fromJSON(result$stdout)
  return(secret$value)
}
