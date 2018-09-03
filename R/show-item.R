show_item <- function(item_bank_audio) {
  function(item) {
    stopifnot(is(item, "item"), nrow(item) == 1L)
    item_number <- psychTestCAT::get_item_number(item)
    num_items_in_test <- psychTestCAT::get_num_items_in_test(item)
    prompt <- get_prompt(item_number, num_items_in_test)
    choices <- get_choices()
    psychTest::audio_NAFC_page(
      label = paste0("q", item_number),
      prompt = prompt,
      choices = choices,
      url = file.path(item_bank_audio, item$file_name),
      wait = FALSE,
      on_complete = NULL
    )
  }
}

get_prompt <- function(item_number, num_items_in_test) {
  shiny::div(
    shiny::p(
      "Question ",
      shiny::strong(item_number),
      " out of ",
      shiny::strong(if (is.null(num_items_in_test)) "?" else num_items_in_test)),
    shiny::p(
      "In which extract was the beep-track on the beat?"
    ))
}

get_choices <- function() {
  c(`First was on the beat` = "1", `Second was on the beat` = "2")
}
