#' CABAT
#'
#' This function defines a CA-BAT module for incorporation into a
#' psychTestR timeline.
#' Use this function if you want to include the CA-BAT in a
#' battery of other tests, or if you want to add custom psychTestR
#' pages to your test timeline.
#' For demoing the CA-BAT, consider using \link{\code{demo_cabat}}.
#' For a standalone implementation of the CA-BAT,
#' consider using \link{\code{standalone_cabat}}.
#' @param num_items (Integer scalar) Number of items in the test.
#' @param take_training (Logical scalar) Whether to include the training phase.
#' @param label (Character scalar) Label to give the CA-BAT results in the output file.
#' @param feedback (Function) Defines the feedback to give the participant
#' at the end of the test.
#' @param item_bank_audio (Character scalar) File path to the directory
#' hosting the item bank audio (typically a publicly accessible web directory).
#' @param practice_items (Character scalar) File path to the directory
#' hosting the practice items audio (typically a publicly accessible web directory).
#' @param next_item.criterion (Character scalar)
#' Criterion for selecting successive items in the adaptive test.
#' See the \code{criterion} argument in \link[catR]{nextItem} for possible values.
#' \code{"bOpt"} corresponds to the setting used in the original CA-BAT paper.
#' @param next_item.estimator (Character scalar)
#' Ability estimation method used for selecting successive items in the adaptive test.
#' See the \code{method} argument in \link[catR]{thetaEst} for possible values.
#' \code{"BM"}, Bayes modal,
#' corresponds to the setting used in the original CA-BAT paper.
#' \code{"WL"}, weighted likelihood,
#' corresponds to the default setting used in versions <= 0.3.0 of this package.
#' @param next_item.prior_dist (Character scalar)
#' The type of prior distribution to use when calculating ability estimates
#' for item selection.
#' Ignored if \code{next_item.estimator} is not a Bayesian method.
#' Defaults to \code{"norm"} for a normal distribution.
#' See the \code{priorDist} argument in \link[catR]{thetaEst} for possible values.
#' @param next_item.prior_par
#' Parameters for the normal
#' @param final_ability.estimator
#' @param constrain_answers
#' @param fix_first_item
#' @param dict
#' @export
cabat <- function(
  num_items = 25L,
  take_training = TRUE,
  label = "BAT",
  feedback = cabat.feedback.no_score(),
  item_bank_audio = "http://media.gold-msi.org/test_materials/BAT/v1/audio",
  practice_items = "http://media.gold-msi.org/test_materials/BAT/v1/practice-items",
  next_item.criterion = "bOpt",
  next_item.estimator = "BM",
  next_item.prior_dist = "norm",
  next_item.prior_par = c(0, 1),
  final_ability.estimator = "WL",
  constrain_answers = FALSE,
  fix_first_item = FALSE,
  dict = cabat::cabat_dict
) {
  stopifnot(is.scalar.integerlike(num_items),
            is.scalar.logical(take_training)
            is.scalar.character(label),
            is.scalar.character(item_bank_audio),
            is.scalar.character(practice_items),
            is.scalar.character(next_item.criterion),
            is.scalar.character(next_item.estimator),
            is.scalar.character(next_item.prior_dist),
            is.numeric(next_item.prior_par),
            length(next_item.prior_par) == 2L,
            is.scalar.character(final_ability.estimator))
  item_bank_audio <- gsub("/$", "", item_bank_audio)
  practice_items <- gsub("/$", "", practice_items)
  arg <- as.list(environment())
  psychTestR::new_timeline(
    c(
      if (take_training) intro(practice_items = practice_items, dict = dict),
      main_test(arg, dict = dict),
      feedback
    ), dict = dict
  )
}

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
