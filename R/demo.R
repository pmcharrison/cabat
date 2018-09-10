#' @export
demo_cabat <- function(num_items = 25L,
                       take_training = TRUE,
                       feedback = psychTestRCAT::cat.feedback.graph("BAT"),
                       admin_password = "demo",
                       researcher_email = "p.m.c.harrison@qmul.ac.uk",
                       languages = "EN",
                       dict = cabat::cabat_dict) {
  elts <- cabat::cabat(num_items = num_items,
                       take_training = take_training,
                       feedback = feedback,
                       dict = dict)

  psychTestR::make_test(
    elts,
    opt = psychTestR::test_options(title = "CABAT demo",
                                   admin_password = admin_password,
                                   researcher_email = researcher_email,
                                   demo = TRUE,
                                   languages = languages))
}
