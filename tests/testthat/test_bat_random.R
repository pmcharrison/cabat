#Automated testing for CABAT
library(psychTestR)
library(testthat)

dir <- system.file("", package = "cabat", mustWork = TRUE)

number_items <- 20 #number of items

app <<- AppTester$new(dir)

# ID
app$expect_ui_text("Please enter your participant ID. Next")
app$set_inputs(p_id = "abcde")
app$click_next()

# Training
app$expect_ui_text("This test assesses your ability to recognise the beat in a piece of music. You will be played some music clips. In each clip you will hear some music together with a beep-track. Your task is to decide whether the beep-track is on or off the beat. Next")
app$click_next()


app$expect_ui_text("Click 'Next' to hear some examples. Next")
app$click_next()

app$expect_ui_text("Example - On the beat In this example the beeps are on the beat of the music. Click here to play Next")
app$click("Next")

app$expect_ui_text("Example - Off the beat In this example the beeps are off the beat of the music. Click here to play Next")
app$click("Next")

app$expect_ui_text("In the test you will be played two versions of the same music clip, one after the other. One version will have beeps on the beat, and the other will have beeps off the beat. Your task is to decide whether the clip with beeps on the beat came first or second. Next")
app$click_next()

app$expect_ui_text("Example question 1/2 Which clip had beeps on the beat? Click here to play First Second")
app$click("2")

app$expect_ui_text("Incorrect. Next")
app$click_next()

app$expect_ui_text("Example question 2/2 Which clip had beeps on the beat? Click here to play First Second")
app$click("2")

app$expect_ui_text("Correct! Next")
app$click_next()

app$expect_ui_text("Press 'Go back' to read the instructions and try the examples again, or press 'Next' to continue to the main test. Go back Next")
app$click("continue")

app$expect_ui_text("You are about to start the main test, where your results will be recorded. You won't receive any feedback for this stage. Good luck! Next")
app$click_next()

q <- 1
for (i in sample(1:2, number_items, replace=TRUE)){
  app$expect_ui_text(paste("Question", q, "out of", number_items, "One of these clips has beeps on the beat, the other off the beat. Which clip had beeps on the beat? If you don't know, give your best guess! Click here to play First Second"))
  app$click(i)
  print(paste("answer id =", i))
  q <- q + 1
}

app$expect_ui_text("You completed the beat perception test! Next")
app$click_next()

# Results
results <- app$get_results() %>% as.list()

BAT_ability_sem <<- results[["BAT"]][["ability_sem"]]
BAT_ability <<- results[["BAT"]][["ability"]]

print(paste("Standard error of measurement of BAT", BAT_ability_sem))
app$stop()

