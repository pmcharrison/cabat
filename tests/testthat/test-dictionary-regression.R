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
               current$DE)
  expect_equal(old_1$EN,
               current$EN)
  expect_equal(old_1$FR,
               current$FR)
  expect_equal(old_1$RU,
               current$RU)
})

test_that("sep-2019", {
  old_1 <- local({
    env <- new.env()
    load(system.file("regression-tests/dictionaries/dict-sep-2019.rda",
                     package = "cabat",
                     mustWork = TRUE),
         envir = env)
    as.data.frame(env$cabat_dict)
  })
  current <- as.data.frame(cabat_dict)

  expect_equal(old_1$key,
               current$key)
  expect_equal(old_1$ES,
               current$ES)
})
