#' @export
cabat.feedback.no_score <- function() {
  psychTestR::one_button_page("You finished the test!")
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
