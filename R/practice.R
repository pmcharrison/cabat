practice <- function(media_dir) {
  unlist(lapply(
    list(list(id = "Prac_Trial_Lvl1",
              answer = "Match"),
         list(id = "Prac_Trial_Lvl2",
              answer = "No match"),
         list(id = "Prac_Trial_Lvl3",
              answer = "Match")
    ),
    function(x) {
      list(
        psychTestR::video_NAFC_page(
          label = "practice_question",
          prompt = "Did the final tone match the note you were imagining?",
          url = file.path(media_dir, paste0(x$id, ".mp4")),
          choices = c("Match", "No match")
        ),
        psychTestR::reactive_page(function(answer, ...) {
          psychTestR::one_button_page(
            if (answer == x$answer) "You answered correctly!" else
              "You answered incorrectly."
          )}))}))
}

repeatable_practice <- function(media_dir) {
  c(
    psychTestR::code_block(function(state, ...) {
      psychTestR::set_local("do_practice", TRUE, state)
    }),
    psychTestR::loop_while(
      test = function(state, ...) psychTestR::get_local("do_practice", state),
      logic = c(
        practice(media_dir),
        psychTestR::NAFC_page(
          label = "check_repeat",
          prompt = "Would you like to try the practice examples again?",
          choices = c("Yes", "No"),
          save_answer = FALSE,
          arrange_vertically = FALSE,
          on_complete = function(state, answer, ...) {
            psychTestR::set_local("do_practice", identical(answer, "No"), state)
          }
        )
      )))}
