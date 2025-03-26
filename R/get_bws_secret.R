#' Get a secret from your Bitwarden Secrets Manager vault
#'
#' This function retrieves the value of a secret stored in your Bitwarden Secrets Manager vault using the specified key.
#'
#' @param key A character string representing the key of the secret.
#' @param bws_access_token Optional. A character string representing the Bitwarden access token. Defaults to the value of the "BITWARDEN_ACCESS_TOKEN" environment variable.
#' @param bws_server_url Optional. A character string representing the Bitwarden server URL. Defaults to the value of the "BWS_SERVER_URL" environment variable. For example "https://vault.bitwarden.eu".
#'
#' @return A character string containing the value of the secret.
#' @export
#'
get_bws_secret <- function(key, bws_access_token = get_bws_access_token(), bws_server_url = get_bws_server_url()) {
  # Directly retrieve the secret value for a specific key
  result <- processx::run(
    command = "bws",
    args = c("secret", "get", key, "-t", bws_access_token, "-c", "no", "--server-url", bws_server_url),
    error_on_status = TRUE
  )

  # Parse and return only the value
  secret <- jsonlite::fromJSON(result$stdout)
  return(secret$value)
}
