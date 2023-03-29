# Computerised Adaptive Beat Alignment Test (CA-BAT) 

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1415353.svg)](https://doi.org/10.5281/zenodo.1415353)
[![R-CMD-check](https://github.com/pmcharrison/cabat/workflows/R-CMD-check/badge.svg)](https://github.com/pmcharrison/cabat/actions)

Try the CA-BAT here! http://shiny.pmcharrison.com/cabat-demo

The CA-BAT is an adaptive test of beat perception ability.
We invite you to try the test [here](http://shiny.pmcharrison.com/cabat-demo), and
to read the paper [here](https://doi.org/10.1038/s41598-018-30318-8).

## Citation

When using the CA-BAT in your own research, you can cite the original CA-BAT research paper:

> Harrison, P. M. C., & Müllensiefen, D. (2018). 
Development and validation of the Computerised Adaptive Beat Alignment Test (CA-BAT). 
Scientific Reports, 8(12395), 1–19. https://doi.org/10.1038/s41598-018-30318-8

and this implementation:

> Harrison, P. M. C., & Müllensiefen, D. (2018). 
Computerised Adaptive Beat Alignment Test (CA-BAT), psychTestR implementation. Zenodo.
https://doi.org/10.5281/zenodo.1415353

We also advise mentioning the software versions you used,
in particular the versions of the `cabat`, `psychTestR`, and `psychTestRCAT` packages.
You can find these version numbers from R by running the following commands:

``` r
library(cabat)
library(psychTestR)
library(psychTestRCAT)
if (!require(devtools)) install.packages("devtools")
x <- devtools::session_info()
x$packages[x$packages$package %in% c("cabat", "psychTestR", "psychTestRCAT"), ]
```

## Acknowledgements

We are grateful to the following individuals for translating the CA-BAT
into new languages:

- Pauline Larrouy-Maestri (French)
- Yina Quique (Spanish)
- Dania Hollemann, Klaus Frieler, Daniel Müllensiefen (German)
- Elina Tsigeman and Maxim Likhanov (Russian)
- Jochum van 't Hooft (Dutch)
- Elvira Brattico (Italian)

## Installation instructions (local use)

1. If you don't have R installed, install it from here: https://cloud.r-project.org/

2. Open R.

3. Install the ‘devtools’ package with the following command:

`install.packages('devtools')`

4. Install the CA-BAT:

`devtools::install_github('pmcharrison/cabat')`

## Usage

### Quick demo 

You can demo the melodic discrimination test at the R console, as follows:

``` r
# Load the cabat package
library(cabat)

# Run a demo test, with feedback as you progress through the test,
# and not saving your data
demo_cabat()

# Run a demo test, skipping the training phase, and only asking 5 questions
demo_cabat(num_items = 5, take_training = FALSE)
```

### Testing a participant

The `standalone_cabat()` function is designed for real data collection.
In particular, the participant doesn't receive feedback during this version.

``` r
# Load the cabat package
library(cabat)

# Run the test as if for a participant, using default settings,
# saving data, and with a custom admin password
standalone_cabat(admin_password = "put-your-password-here")
```

You will need to enter a participant ID for each participant.
This will be stored along with their results.

Each time you test a new participant,
rerun the `standalone_cabat()` function,
and a new participation session will begin.

You can retrieve your data by starting up a participation session,
entering the admin panel using your admin password,
and downloading your data.
For more details on the psychTestR interface, 
see http://psychtestr.com/.

The CA-BAT currently supports English (EN), French (FR), German (DE), Russian (RU),
Spanish (ES), Latvian (LV), and Italian (IT).
If you would like to add a new language to this list, please contact us.
You can select one of these languages by passing a language code as 
an argument to `standalone_cabat()`, e.g. `standalone_cabat(languages = "DE")`,
or alternatively by passing it as a URL parameter to the test browser,
eg. http://127.0.0.1:4412/?language=DE (note that the `p_id` argument must be empty).
Please note that the demo version of the test (`demo_cabat`)
currently only supports English.

### Results

The main output from the CA-BAT is an `ability` score,
corresponding to the ability estimate for the participant.
It is computed from the underlying item response model and ranges approximately from -4 to +4.
A secondary output is an `ability_sem` score, 
corresponding to the standard error of measurement for the ability estimate;
again, it is computed from the underlying IRT model.
For most applications you would only use the `ability` value,
unless using a statistical analysis technique that allows you to specify measurement error explicitly.
For more information about item response theory, see the [Wikipedia](https://en.wikipedia.org/wiki/Item_response_theory) article;
for more information about CA-BAT scores, see
[Harrison & Müllensiefen, 2018](https://doi.org/10.1038/s41598-018-30318-8).

psychTestR provides several ways of retrieving test results (see http://psychtestr.com/).
Most are accessed through the test's admin panel.

* If you are just interested in the participants' final scores,
the easiest solution is usually to download the results in CSV format from the admin panel.
* If you are interested in trial-by-trial results, you can run the command
`compile_trial_by_trial_results()` from the R console
(having loaded the CA-BAT package using `library(cabat)`).
Type `?compile_trial_by_trial_results()` for more details.
* If you want still more detail, you can examine the individual RDS output files using `readRDS()`. 
Detailed results are stored as the 'metadata' attribute for the ability field. 
You can access it something like this: 

``` r
x <- readRDS("output/results/id=1&p_id=german_test&save_id=1&pilot=false&complete=true.rds")
attr(x$BAT$ability, "metadata")
```

## Installation instructions (Shiny Server)

1. Complete the installation instructions described under 'Local use'.
2. If not already installed, install Shiny Server Open Source:
https://www.rstudio.com/products/shiny/download-server/
3. Navigate to the Shiny Server app directory.

`cd /srv/shiny-server`

4. Make a folder to contain your new Shiny app.
The name of this folder will correspond to the URL.

`sudo mkdir cabat`

5. Make a text file in this folder called `app.R`
specifying the R code to run the app.

- To open the text editor: `sudo nano cabat/app.R`
- Write the following in the text file:

``` r
library(cabat)
standalone_cabat(admin_password = "put-your-password-here")
```

- Save the file (CTRL-O).

6. Change the permissions of your app directory so that `psychTestR`
can write its temporary files there.

`sudo chown -R shiny cabat`

where `shiny` is the username for the Shiny process user
(this is the usual default).

7. Navigate to your new shiny app, with a URL that looks like this:
http://my-web-page.org:3838/cabat

## Usage notes

- The CA-BAT runs in your web browser.
- By default, audio files are hosted online on our servers.
The test therefore requires internet connectivity.

## Implementation notes

Versions <= 0.3.0 of this package experimented with weighted likelihood
ability estimation for item selection.
However, current versions of the package revert to Bayes modal
ability estimation for item selection,
for consistency with the original CA-BAT paper.

## Adding new languages

See `data-raw/dict-spanish.csv` for an example of a foreign-language dictionary.
Create a new dictionary for your new language following this format.
Prepare a merge request for submitting your changes, 
perhaps using a fork of the original repository.
Place the file in `data-raw`.
Update `data-raw/cabat-dict.R`, adding a new four-line section for your new language,
following the lines used to add previous languages.
Run the file and commit the changes to Git.
Update the `cabat_languages` function in `languages.R` to include the new language.
Update the languages section in `README.md` to credit the translator.
Rebuild the R package locally and test that you can use the test with
your new translations.
Submit your changes as a merge request.
