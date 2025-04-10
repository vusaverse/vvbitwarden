test_that("get_bws_access_token returns the correct token when set", {
  withr::local_envvar(c(BWS_ACCESS_TOKEN = "my_fake_token_123"))
  expect_equal(get_bws_access_token(), "my_fake_token_123")
})

test_that("get_bws_access_token throws an error when not set", {
  withr::local_envvar(c(BWS_ACCESS_TOKEN = ""))
  expect_error(get_bws_access_token(), "No BWS_ACCESS_TOKEN provided or set as environment variable.")
})
