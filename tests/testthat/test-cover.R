context("Cover")

test_that("Cover greater than 0", {
  expect_true(all(cover$proportion>0))
})

test_that("Cover less than 1", {
  expect_true(all(cover$proportion<1))
})
