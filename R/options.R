get_options <- function(item_bank, arg) {
  psychTestRCAT::adapt_test_options(
    next_item.criterion = arg$next_item.criterion,
    next_item.estimator = arg$next_item.estimator,
    next_item.prior_dist = arg$next_item.prior_dist,
    next_item.prior_par = arg$next_item.prior_par,
    final_ability.estimator = arg$final_ability.estimator,
    constrain_answers = arg$constrain_answers,
    avoid_duplicates = "track_name",
    eligible_first_items = if (arg$fix_first_item) c(23L, 24L) else NULL
  )
}
