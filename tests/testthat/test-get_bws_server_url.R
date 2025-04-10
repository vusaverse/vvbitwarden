test_that("get_bws_server_url returns the correct URL when set", {
  withr::local_envvar(c(BWS_SERVER_URL = "https://example.com"))
  expect_equal(get_bws_server_url(), "https://example.com")
})

test_that("get_bws_server_url throws an error when not set", {
  withr::local_envvar(c(BWS_SERVER_URL = ""))
  expect_error(get_bws_server_url(), "No BWS_SERVER_URL provided or set as environment variable.")
})
