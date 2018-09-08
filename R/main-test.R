main_test <- function(arg, dict) {
  psychTestR::new_timeline(
    psychTestRCAT::adapt_test(
      label = arg$label,
      item_bank = cabat::item_bank,
      show_item = show_item(arg$item_bank_audio),
      stopping_rule = psychTestRCAT::stopping_rule.num_items(n = arg$num_items),
      opt = get_options(item_bank = cabat::item_bank, arg = arg)
    ), dict = dict)
}
