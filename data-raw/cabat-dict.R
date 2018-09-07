input <- read.csv("data-raw/cabat-dict.csv", stringsAsFactors = FALSE)
names(input)[[1]] <- "key"

cabat_dict <- psychTestR::i18n_dict$new(input)
devtools::use_data(cabat_dict, overwrite = TRUE)
