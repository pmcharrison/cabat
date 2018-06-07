#' @export
ca_bat <- function(
  num_items = 25L,
  take_training = TRUE,
  label = "BAT",
  feedback = ca_bat.feedback.no_score(),
  item_bank_audio = "http://media.gold-msi.org/test_materials/BAT/v1/audio",
  practice_items = "http://media.gold-msi.org/test_materials/BAT/v1/practice-items"
) {
  stopifnot(is.scalar.character(label), is.scalar.numeric(num_items),
            is.scalar.logical(take_training), is.scalar.character(item_bank_audio),
            is.scalar.character(practice_items))
  c(
    if (take_training) training(),
    main_test(label, item_bank_audio, num_items),
    feedback
  )
}

warning("Reminder: need to constrain starting item")

training <- function() {
  NULL
}

main_test <- function(label, item_bank_audio, num_items) {
  psychTestCAT::adapt_test(
    label = label,
    item_bank = CABAT::item_bank,
    show_item = show_item(item_bank_audio),
    stopping_rule = psychTestCAT::stopping_rule.num_items(n = num_items),
    opt = ca_bat.options(CABAT::item_bank)
  )
}

ca_bat.feedback.no_score <- function() {
  psychTest::one_button_page("You finished the test!")
}

ca_bat.options <- function(item_bank) {
  psychTestCAT::adapt_test_options(
    next_item.criterion = "bOpt",
    next_item.estimator = "BM",
    next_item.prior_dist = "norm",
    next_item.prior_par = c(0, 1),
    final_ability.estimator = "WL",
    cb_control = get_cb_control(item_bank),
    cb_group = get_cb_group(item_bank)
  )
}

get_cb_group <- function(item_bank) {
  res <- item_bank$track_name
  stopifnot(!is.null(res))
  res
}

get_cb_control <- function(item_bank) {
  cb_group <- get_cb_group(item_bank)
  cb_names <- names(table(cb_group))
  cb_props <- rep(x = 1 / (length(cb_names)), times = length(cb_names))
  list(names = cb_names, props = cb_props)
}

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
