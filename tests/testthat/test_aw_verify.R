context("test aw_verify function")

# load test data ------------------------------------------------

# target data
data(ar_stl_wards, package = "areal")

# source data
data(ar_stl_race, package = "areal")

# interpolate data
totalResult1 <- aw_interpolate(ar_stl_wards, tid = WARD, source = ar_stl_race, sid = GEOID,
                               weight = "sum", output = "sf", extensive = "TOTAL_E")

totalResult2 <- aw_interpolate(ar_stl_wards, tid = WARD, source = ar_stl_race, sid = GEOID,
                              weight = "total", output = "sf", extensive = "TOTAL_E")

# test errors ------------------------------------------------

test_that("errors with missing objects", {
  expect_error(aw_verify(source = ham, sourceValue = TOTAL_E, result = totalResult1, resultValue = TOTAL_E),
               "object 'ham' not found")
  expect_error(aw_verify(source = ar_stl_race, sourceValue = TOTAL_E, result = ham, resultValue = TOTAL_E),
               "object 'ham' not found")
})

test_that("errors with missing parameters", {
  expect_error(aw_verify(sourceValue = TOTAL_E, result = totalResult1, resultValue = TOTAL_E),
               "A sf object containing source data must be specified for the 'source' argument.")
  expect_error(aw_verify(source = ar_stl_race, result = totalResult1, resultValue = TOTAL_E),
               "A variable name must be specified for the 'sourceValue' argument.")
  expect_error(aw_verify(source = ar_stl_race, sourceValue = TOTAL_E, resultValue = TOTAL_E),
               "A sf object containing interpolated data must be specified for the 'result' argument.")
  expect_error(aw_verify(source = ar_stl_race, sourceValue = TOTAL_E, result = totalResult1),
               "A variable name must be specified for the 'resultValue' argument.")
})

test_that("errors with misspecified parameters", {
  expect_error(aw_verify(source = ar_stl_race, sourceValue = c("TOTAL_E", "WHITE_E"),
                         result = totalResult1, resultValue = TOTAL_E),
               "Variable 'c\\(\"TOTAL_E\", \"WHITE_E\"\\)', given for the source value, cannot be found in the given source object. Make sure only one existing variable is given.")
  expect_error(aw_verify(source = ar_stl_race, sourceValue = TOTAL_E,
                         result = totalResult1, resultValue = c("TOTAL_E", "WHITE_E")),
               "Variable 'c\\(\"TOTAL_E\", \"WHITE_E\"\\)', given for the result value, cannot be found in the given result object. Make sure only one existing variable is given.")
})

# test result ------------------------------------------------

test_that("correctly returns logic test results", {
  expect_equal(aw_verify(source = ar_stl_race, sourceValue = "TOTAL_E",
                         result = totalResult2, resultValue = "TOTAL_E"), FALSE)
})
