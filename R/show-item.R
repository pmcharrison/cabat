show_item <- function(item_bank_audio) {
  function(item, ...) {
    stopifnot(is(item, "item"), nrow(item) == 1L)
    item_number <- psychTestRCAT::get_item_number(item)
    num_items_in_test <- psychTestRCAT::get_num_items_in_test(item)
    prompt <- get_prompt(item_number, num_items_in_test)
    choices <- c("1", "2")
    labels <- psychTestR::i18n(c("ABAT_0010_I_0001_1", "ABAT_0015_I_0001_1"))
    psychTestR::audio_NAFC_page(
      label = paste0("q", item_number),
      prompt = prompt,
      choices = choices,
      labels = labels,
      url = file.path(item_bank_audio, item$file_name),
      wait = TRUE,
      on_complete = NULL,
      save_answer = FALSE
    )
  }
}

get_prompt <- function(item_number, num_items_in_test) {
  shiny::div(
    shiny::p(
      shiny::HTML(psychTestR::i18n("ABAT_0017_I_0001_1", sub = list(
        num_question = item_number,
        test_length = num_items_in_test
      )))),
    shiny::p(shiny::HTML(psychTestR::i18n("ABAT_0019_I_0001_1"))))
}
