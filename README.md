
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Forecast Hub Autosubmission Framework

<!-- badges: start -->

[![R-CMD-check](https://github.com/epiforecasts/covid19-forecast-hub-europe-submissions/workflows/R-CMD-check/badge.svg)](https://github.com/epiforecasts/covid19-forecast-hub-europe-submissions/actions)
<!-- badges: end -->

This repo contains the necessary infrastructure to handle automatic
submissions to a Forecast Hub (in this specific case, the [European
Covid-19 Forecast
Hub](https://github.com/epiforecasts/covid19-forecast-hub-europe).

Each model is stored as a git submodule (after a security scan) under
the `models/` folder and code is run automatically on a schedule via
GitHub Actions. The generated forecasts are then submitted to the hub
repository as a pull request.

## Guidelines for submitting your model

To submit your model for auto-submission, you need to open an issue
providing:

-   The URL to a public git repository (e.g., hosted on GitHub)
    containing:
    -   a file `main.R` or `main.py` **at its root**. This `main` file
        needs to create the forecasts with the expected folder structure
        in a folder named `data-processed`.
    -   a dependency management file. The exact name and syntax depend
        on the programming language you are using. Some examples are
        `requirements.txt` for python (with pip) or `renv.lock` for R
        (with renv). **All dependencies need to have an exact version
        pinned to minimise risk of breakage with future dependency
        updates.**
-   the week day and time at which the workflow should run (as UTC)
