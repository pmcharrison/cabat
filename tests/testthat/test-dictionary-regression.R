test_that("feb-2021", {
  old_1 <- local({
    env <- new.env()
    load(system.file("regression-tests/dictionaries/dict-feb-2021.rda",
                     package = "cabat",
                     mustWork = TRUE),
         envir = env)
    as.data.frame(env$cabat_dict)
  })
  current <- as.data.frame(cabat_dict)

  expect_equal(old_1$key,
               current$key)
  expect_equal(old_1$de,
               current$de)
  expect_equal(old_1$en,
               current$en)
  expect_equal(old_1$fr,
               current$fr)
  expect_equal(old_1$ru,
               current$ru)
  expect_equal(old_1$nl,
              current$nl)
})


test_that("may-2019", {
  old_1 <- local({
    env <- new.env()
    load(system.file("regression-tests/dictionaries/dict-may-2019.rda",
                     package = "cabat",
                     mustWork = TRUE),
         envir = env)
    as.data.frame(env$cabat_dict)
  })
  current <- as.data.frame(cabat_dict)

  expect_equal(old_1$key,
               current$key)
  expect_equal(old_1$DE,
               current$de)
  expect_equal(old_1$EN,
               current$en)
  expect_equal(old_1$FR,
               current$fr)
  expect_equal(old_1$RU,
               current$ru)
})

test_that("oct-2019", {
  old_1 <- local({
    env <- new.env()
    load(system.file("regression-tests/dictionaries/dict-oct-2019.rda",
                     package = "cabat",
                     mustWork = TRUE),
         envir = env)
    as.data.frame(env$cabat_dict)
  })
  current <- as.data.frame(cabat_dict)

  expect_equal(old_1$key,
               current$key)
  expect_equal(old_1$ES,
               current$es)
})
