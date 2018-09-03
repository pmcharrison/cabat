#' @export
cabat <- function(
  num_items = 25L,
  take_training = TRUE,
  label = "BAT",
  feedback = ca_bat.feedback.no_score(),
  item_bank_audio = "http://media.gold-msi.org/test_materials/BAT/v1/audio",
  practice_items = "http://media.gold-msi.org/test_materials/BAT/v1/practice-items",
  next_item.criterion = "bOpt",
  next_item.estimator = "WL",
  next_item.prior_dist = "norm",
  next_item.prior_par = c(0, 1),
  final_ability.estimator = "WL",
  constrain_answers = FALSE
) {
  stopifnot(is.scalar.character(label), is.scalar.numeric(num_items),
            is.scalar.logical(take_training), is.scalar.character(item_bank_audio),
            is.scalar.character(practice_items))
  arg <- as.list(environment())
  c(
    if (take_training) training(),
    main_test(opt),
    feedback
  )
}

warning("Reminder: need to constrain starting item")

# get_cb_group <- function(item_bank) {
#   res <- item_bank$track_name
#   stopifnot(!is.null(res))
#   res
# }
#
# get_cb_control <- function(item_bank) {
#   cb_group <- get_cb_group(item_bank)
#   cb_names <- names(table(cb_group))
#   cb_props <- rep(x = 1 / (length(cb_names)), times = length(cb_names))
#   list(names = cb_names, props = cb_props)
# }
