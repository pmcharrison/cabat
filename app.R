library(psychTest)
library(shiny)
library(CABAT)

options(shiny.error = browser)

elts <- c(
  psychTest::one_button_page("Welcome!"),
  ca_bat(num_items = 5),
  psychTest::final_page("Thanks for taking part.")
)

psychTest::make_test(elts,
                     "CA-BAT",
                     options = psychTest::pt_options(admin_password = "conifer",
                                                     demo = TRUE))
