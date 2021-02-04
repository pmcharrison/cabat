input <- read.csv("data-raw/cabat-dict.csv", stringsAsFactors = FALSE)
names(input)[[1]] <- "key"

russian <- read.csv("data-raw/dict-russian.csv", stringsAsFactors = FALSE)
names(russian)[[1]] <- "key"
stopifnot(!anyDuplicated(input$key),
          all(input$key == russian$key))
input$RU <- russian$RU

spanish <- read.csv("data-raw/dict-spanish.csv", stringsAsFactors = FALSE)
names(spanish)[[1]] <- "key"
stopifnot(all(input$key == spanish$key))
input$ES <- spanish$ES

dutch <- read.csv("data-raw/dict-dutch.csv", stringsAsFactors = FALSE)
names(dutch)[[1]] <- "key"
stopifnot(all(input$key == dutch$key))
input$NL <- dutch$NL

cabat_dict <- psychTestR::i18n_dict$new(input)
usethis::use_data(cabat_dict, overwrite = TRUE)
