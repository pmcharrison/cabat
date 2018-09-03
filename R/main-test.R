main_test <- function(arg) {
  psychTestCAT::adapt_test(
    label = arg$label,
    item_bank = CABAT::item_bank,
    show_item = show_item(arg$item_bank_audio),
    stopping_rule = psychTestCAT::stopping_rule.num_items(n = arg$num_items),
    opt = ca_bat.options(item_bank = CABAT::item_bank, arg = arg)
  )
}
