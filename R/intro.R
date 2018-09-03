intro <- function(media_dir) {
  shiny::withTags(c(
    psychTestR::one_button_page("The Pitch Imagery Arrow Task has been designed to teach you to successfully imagine musical tones from a visual prompt."),
    psychTestR::one_button_page("Each trial starts with the word “Begin” on the screen, and you will hear an ascending major scale, which provides the key or context for that trial. You will then see a dot on the screen and hear a start note. Press 'Next' for an example of this."),
    psychTestR::video_NAFC_page(
      label = "example_context",
      prompt = "Here is an example context:",
      choices = "Next",
      url = file.path(media_dir, "Scale_C_ton.mp4"),
      save_answer = FALSE
    ),
    psychTestR::one_button_page("A variable number of up and/or down arrows will then appear in a sequence, with a corresponding tone, that is stepping up or down the scale. Press 'Next' for an example of these arrows appearing after the ascending scale and start note."),
    psychTestR::video_NAFC_page(
      label = "example_arrows",
      prompt = "Here is an example of arrows appearing after the ascending scale and start note:",
      choices = "Next",
      url = file.path(media_dir, "Example_Trial_sounded_arr.mp4"),
      save_answer = FALSE
    ),
    psychTestR::one_button_page(
      "At some point in the trial, an arrow is shown with no tone heard. Your job is to imagine that exact missing tone. The number of tones to be imagined in each trial will vary from 1 to 5 tones. The word “hold” will appear with the last silent arrow of the sequence. Hold in your mind the sound of this last tone as you prepare to hear a test tone. Press 'Next' for an example of a single silent arrow added to our trial example."
    ),
    psychTestR::video_NAFC_page(
      label = "example_silent_arrow",
      prompt = "Here is an example:",
      choices = "Next",
      url = file.path(media_dir, "Example_Trial_all_arr.mp4"),
      save_answer = FALSE
    ),
    psychTestR::one_button_page(
      "To test the accuracy of your imagery, a test tone will be sounded and a white fixation cross will display. The tone will either match the note you are imagining or it won't match. Your task will be to determine which is the case. Press 'Next' for the full example trial and try to respond correctly."
    ),
    psychTestR::video_NAFC_page(
      label = "example_complete_trial",
      prompt = "Here is an example complete trial:",
      choices = c("Match", "No match"),
      url = file.path(media_dir, "Example_Trial_complete.mp4")
    ),
    psychTestR::one_button_page("We encourage you to just use your imagery to play the missing notes in your head, and don’t hum or move as you imagine. From earlier tests we know that using only your imagery gives the best results on the test."),
    psychTestR::one_button_page("There are 3 practice trials in which you will receive feedback. You are free to attempt these as many times as you wish to familiarise yourself with the task.")
  ))
}
