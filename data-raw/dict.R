input <- read.csv("data-raw/dict.csv", stringsAsFactors = FALSE)
names(input)[[1]] <- "key"

dict <- psychTestR::i18n_dict$new(input)
devtools::use_data(dict, overwrite = TRUE)
