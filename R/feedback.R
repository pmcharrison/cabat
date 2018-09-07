#' @export
cabat.feedback.no_score <- function(dict = cabat::cabat_dict) {
  psychTestR::new_timeline(
    psychTestR::one_button_page(
      shiny::HTML(psychTestR::i18n("ABAT_0020_I_0001_1"))
    ),
    dict = dict
  )
}

#' @export
cabat.feedback.simple_score <- function() {
  psychTestR::reactive_page(function(answer, ...) {
    psychTestR::one_button_page(shiny::div(
      shiny::p("You finished the test!"),
      shiny::p("Your score was:",
               shiny::strong(round(answer$ability, digits = 2)))
    ))
  })
}
