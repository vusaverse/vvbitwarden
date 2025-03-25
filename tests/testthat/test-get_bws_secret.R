test_that("A secret can be retrieved", {
  testthat::expect_no_error(get_bws_secret("93eee860-b006-4607-ab9b-b2ab008cee89"))
})
