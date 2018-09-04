#' @export
demo_cabat <- function(num_items = 25L,
                       take_training = TRUE,
                       feedback = cabat::cabat.feedback.simple_score(),
                       admin_password = "demo",
                       researcher_email = "p.m.c.harrison@qmul.ac.uk") {
  elts <- c(
    cabat::cabat(num_items = num_items,
                 take_training = take_training,
                 feedback = cabat::cabat.feedback.simple_score()),
    psychTestR::final_page("You may now close the browser window.")
  )

  psychTestR::make_test(
    elts,
    opt = psychTestR::test_options(title = "CABAT demo",
                                   admin_password = admin_password,
                                   researcher_email = researcher_email,
                                   demo = TRUE))
}
