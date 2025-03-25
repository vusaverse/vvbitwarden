#' Get a secret from your Bitwarden Secrets Manager vault
#'
#' This function retrieves the value of a secret stored in your Bitwarden Secrets Manager vault using the specified key.
#'
#' @param key A character string representing the key of the secret.
#' @param access_token Optional. A character string representing the Bitwarden access token. Defaults to the value of the "BITWARDEN_ACCESS_TOKEN" environment variable.
#' @param server_url Optional. A character string representing the Bitwarden server URL. Defaults to "https://vault.bitwarden.eu".
#'
#' @return A character string containing the value of the secret.
#' @export
#'
get_bws_secret <- function(key, access_token = Sys.getenv("BITWARDEN_ACCESS_TOKEN"), server_url = "https://vault.bitwarden.eu") {
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
