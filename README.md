<p align="center">
  <img src="man/figures/vvbitwarden-logo.png" width="200" alt="vvbitwarden logo"/>
</p>


# vvbitwarden 🚀🔒

`vvbitwarden` is an R package that provides functions to interact with your Bitwarden Secrets Manager vault. It allows you to securely retrieve secrets stored in your Bitwarden vault. 🔐✨

## Prerequisites ⚠️
Before using vvbitwarden, make sure you have the Bitwarden Secrets Manager CLI (BWS CLI) installed on your system:
[Secrets Manager CLI](https://bitwarden.com/help/secrets-manager-cli/)

## Installation 💻

To install the `vvbitwarden` package, you can use the following command:

```r
# Install the development version from GitHub
devtools::install_github("vusaverse/vvbitwarden")
```

## Usage 📦

### Retrieve a Secret from Bitwarden Secrets Manager 🔑

The `get_bws_secret` function retrieves the value of a secret stored in your Bitwarden Secrets Manager vault using the specified key.

#### Example 📋

```r
library(vvbitwarden)

# Retrieve a secret
secret_value <- get_bws_secret("my_secret_key")
print(secret_value)
```

#### Parameters 📜

- `key`: A character string representing the key of the secret.
- `access_token`: Optional. A character string representing the Bitwarden access token. Defaults to the value of the "BITWARDEN_ACCESS_TOKEN" environment variable.
- `server_url`: Optional. A character string representing the Bitwarden server URL. Defaults to "https://vault.bitwarden.eu".

#### Return Value 📄

The function returns a character string containing the value of the secret.

## License 📄

This package is licensed under the MIT License.
