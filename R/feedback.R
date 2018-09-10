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
cabat.feedback.graph <- function() {
  psychTestRCAT::cat.feedback.graph("BAT")
}

#' cabat.feedback.simple_score <- function(dict = cabat::cabat_dict) {
#'   psychTestR::new_timeline(
#'     psychTestR::reactive_page(function(answer, ...) {
#'       psychTestR::one_button_page(shiny::div(
#'         shiny::p(psychTestR::i18n("ABAT_0020_I_0001_1")),
#'         shiny::p("Your score was:",
#'                  shiny::strong(round(answer$ability, digits = 2)))
#'       ))
#'     })
#' }
