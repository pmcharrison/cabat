info_page <- function(id) {
  psychTestR::one_button_page(psychTestR::i18n(id),
                              button_text = psychTestR::i18n("ABAT_0021_I_0001_1"))
}

audio_ex_page <- function(prompt_id, url) {
  psychTestR::audio_NAFC_page(
    label = "ex",
    prompt = shiny::HTML(psychTestR::i18n(prompt_id)),
    choices = psychTestR::i18n("ABAT_0021_I_0001_1"),
    url = url,
    save_answer = FALSE
  )
}

intro <- function(practice_items, dict) {
  psychTestR::new_timeline(
    c(
      psychTestR::code_block(function(state, ...) {
        psychTestR::set_local("do_intro", TRUE, state)
      }),
      psychTestR::while_loop(
        test = function(state, ...) psychTestR::get_local("do_intro", state),
        logic = c(
          info_page("ABAT_0002_I_0001_1"),
          info_page("ABAT_0003_I_0001_1"),
          audio_ex_page("ABAT_0004_I_0001_1", file.path(practice_items, "training1.mp3")),
          audio_ex_page("ABAT_0006_I_0001_1", file.path(practice_items, "training2.mp3")),
          info_page("ABAT_0008_I_0001_1"),
          practice(practice_items),
          ask_repeat()
        )),
      info_page("ABAT_0016_I_0001_1")
    ), dict = dict)
}

ask_repeat <-function() {
  psychTestR::NAFC_page(
    label = "ask_repeat",
    prompt = shiny::HTML(psychTestR::i18n("ABAT_0014_I_0001_1",
                                          sub = c(feedback = ""))),
    choices = c("go_back", "continue"),
    labels = lapply(c("ABAT_0022_I_0001_1", "ABAT_0021_I_0001_1"), psychTestR::i18n),
    save_answer = FALSE,
    arrange_vertically = FALSE,
    on_complete = function(state, answer, ...) {
      psychTestR::set_local("do_intro", identical(answer, "go_back"), state)
    }
  )
}
