#' CA-BAT feedback (no score)
#'
#' Here the participant is given no feedback at the end of the test.
#' @param dict The psychTestR dictionary used for internationalisation.
#' @export
#' @examples
#' \dontrun{
#' demo_cabat(feedback = cabat.feedback.no_score())}
cabat.feedback.no_score <- function(dict = cabat::cabat_dict) {
  psychTestR::new_timeline(
    psychTestR::one_button_page(
      shiny::HTML(psychTestR::i18n("ABAT_0020_I_0001_1"))
    ),
    dict = dict
  )
}

#' CA-BAT feedback (simple score)
#'
#' Here the participant's score is reported at the end of the test.
#' @param dict The psychTestR dictionary used for internationalisation.
#' @export
#' @examples
#' \dontrun{
#' standalone_cabat(feedback = cabat.feedback.simple_score())}
cabat.feedback.simple_score <- function(dict = cabat::cabat_dict) {
  psychTestR::new_timeline(
    psychTestR::reactive_page(function(answer, ...) {
      psychTestR::one_button_page(shiny::div(
        shiny::p(psychTestR::i18n("ABAT_0020_I_0001_1")),
        shiny::p("Your score was:",
                 shiny::strong(round(answer$ability, digits = 2)))
      ))
    }
    ))
}
