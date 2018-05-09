library(psychTest)
library(shiny)
library(CABAT)

options(shiny.error = browser)

elts <- c(
  psychTest::one_button_page("Welcome!"),
  psychTest::one_button_page("Here's a simple example of how you could give feedback to a participant."),
  psychTest::NAFC_page(label = "favourite_colour",
                       prompt = "What's your favourite colour?",
                       choices = c("Yellow", "Red", "Green"),
                       on_complete = function(state, answer, ...)
                         psychTest::set_global(key = "fave", value = answer,
                                               state = state)),
  psychTest::reactive_page(function(state, ...) {
    psychTest::one_button_page(
      paste0("Your favourite colour is ",
             psychTest::get_global("fave", state),
             ".")
    )
  }),
  psychTest::one_button_page("Now for the main test."),
  ca_bat(num_items = 5),
  psychTest::final_page("Thanks for taking part.")
)

psychTest::make_test(elts,
                     opt = psychTest::pt_options(title = "CA-BAT",
                                                 admin_password = "conifer",
                                                 researcher_email = "p.m.c.harrison@qmul.ac.uk",
                                                 demo = TRUE))
