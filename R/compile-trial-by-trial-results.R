#' Compile trial-by-trial results
#'
#' Compiles a data frame of trial-by-trial results for each participant.
#' This function is intended to be called once data have been collected
#' for several participants; it allows the researcher to inspect
#' CA-BAT results on a trial-by-trial level.
#' @param in_dir Results directory to process.
#' @param label Label that the CA-BAT's results were saved under (typically "BAT").
#' @param combine Whether to combine results into one big data frame,
#' or instead to return a list of data frames, one for each participant.
#' @return A data frame, or list of data frames, of trial-by-trial results.
#' @export
compile_trial_by_trial_results <- function(in_dir = "output/results",
                                           label = "BAT",
                                           combine = TRUE) {
  psychTestRCAT::compile_trial_by_trial_results(
    in_dir = in_dir,
    label = label,
    combine = combine
  )
}
