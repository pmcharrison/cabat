# Computerised Adaptive Beat Alignment Test (CA-BAT) 

Try the CA-BAT here! http://shiny.pmcharrison.com/cabat-demo --> 

This test is detailed in the following paper: Harrison, P. M. C., & Müllensiefen, D. (2018). 
Development and validation of the Computerised Adaptive Beat Alignment Test (CA-BAT). 
Scientific Reports, 8(12395), 1–19. https://doi.org/10.1038/s41598-018-30318-8

<!-- This implementation can be cited using the following permanent link:
https://doi.org/10.5281/zenodo.1300951 -->

The demo version of the CA-BAT (http://shiny.pmcharrison.com/cabat-demo)
gives you feedback after each question,
but in real experiments this feedback is disabled.
For using the test in your own studies, we recommend local installation (see below).

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
