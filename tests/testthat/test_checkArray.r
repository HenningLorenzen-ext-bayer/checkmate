context("checkArray")

test_that("checkArray", {
  x = array(dim = c(2, 3))
  expect_true(testArray(x))
  expect_true(testArray(x, d = 2L))
  expect_false(testArray(x, d = 1L))
  
  x[2,2] = NA
  expect_true(testMatrix(x))
  expect_false(testMatrix(x, any.missing = FALSE))

  expect_true(assertArray(x))
  expect_error(assertArray(iris))
})
