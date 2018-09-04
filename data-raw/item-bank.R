item_bank <- read.csv("data-raw/item-bank.csv", stringsAsFactors = FALSE)

for (col in c("difficulty_with_track_effect",
              "track_random_intercept",
              "track_random_slope")) {
  item_bank[[col]] <- NULL
}

names(item_bank) <- plyr::revalue(names(item_bank),
                                  c(difficulty_without_track_effect = "difficulty"))

devtools::use_data(item_bank)
