#' Standalone CA-BAT
#'
#' This function launches a standalone testing session for the CA-BAT.
#' This can be used for data collection, either in the laboratory or online.
#' @param title (Scalar character) Title to display during testing.
#' @param admin_password (Scalar character) Password for accessing the admin panel.
#' @param researcher_email (Scalar character)
#' If not \code{NULL}, this researcher's email address is displayed
#' at the bottom of the screen so that online participants can ask for help.
#' @param languages (Character vector)
#' Determines the languages available to participants.
#' The first language is selected by default.
#' Defaults to the value returned by \code{\link{cabat_languages}()}.
#' The first language is selected by default
#' @param dict The psychTestR dictionary used for internationalisation.
#' @param ... Further arguments to be passed to \code{\link{cabat}()}.
#' @export
standalone_cabat <- function(title = "Beat perception test",
                             admin_password = "replace-with-secure-password",
                             researcher_email = NULL,
                             languages = cabat_languages(),
                             dict = cabat::cabat_dict,
                             ...) {
  elts <- c(
    psychTestR::new_timeline(
      psychTestR::get_p_id(prompt = psychTestR::i18n("enter_p_id"),
                           button_text = psychTestR::i18n("ABAT_0021_I_0001_1")),
      dict = dict
    ),
    cabat(dict = dict, ...),
    psychTestR::elt_save_results_to_disk(complete = TRUE),
    psychTestR::new_timeline(
      psychTestR::final_page(shiny::p(
        psychTestR::i18n("results_have_been_saved"),
        psychTestR::i18n("you_may_close_browser")),
      ), dict = dict)
  )

  psychTestR::make_test(
    elts,
    opt = psychTestR::test_options(title = title,
                                   admin_password = admin_password,
                                   researcher_email = researcher_email,
                                   demo = FALSE,
                                   languages = languages)
  )
}
