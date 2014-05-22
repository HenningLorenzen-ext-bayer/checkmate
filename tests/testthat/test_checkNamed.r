context("checkNamed")

test_that("checkNamed", {
  expect_true(testNamed(integer(0)))
  expect_true(testNamed(NULL))
  expect_true(testNamed(setNames(integer(0), character(0))))

  x = setNames(1:2, c("a", ".a"))
  expect_true(testNamed(x))
  expect_true(testNamed(x, "unique"))
  expect_true(testNamed(x, "strict"))

  expect_false(testNamed(1))
  expect_false(testNamed(setNames(x, NA_character_)))
  expect_false(testNamed(setNames(x, NA_integer_)))
  expect_false(testNamed(setNames(x, "")))

  x = setNames(1:2, c("a", "a"))
  expect_true(testNamed(x))
  expect_false(testNamed(x, "unique"))

  x = setNames(1:2, c("a", "1"))
  expect_true(testNamed(x))
  expect_false(testNamed(x, "strict"))

  x = setNames(1:2, c("a", "..1"))
  expect_true(testNamed(x))
  expect_false(testNamed(x, "strict"))


  x = setNames(1:2, c("a", ".a"))
  expect_true(assertNamed(x))

  x = setNames(1, "")
  expect_error(assertNamed(x))

  x = setNames(1:2, c("a", "a"))
  expect_error(assertNamed(x, "unique"), "duplicated")

  x = setNames(1:2, c("a", "1"))
  expect_error(assertNamed(x, "strict"), "naming rules")
})
