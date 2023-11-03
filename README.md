
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Forecast Hub Autosubmission Framework

<!-- badges: start -->

![epiforecasts-timeseries
status](https://github.com/european-modelling-hubs/covid19-forecast-hub-europe-submissions/workflows/epiforecasts-timeseries/badge.svg)
![epinow2
status](https://github.com/european-modelling-hubs/covid19-forecast-hub-europe-submissions/workflows/epinow2/badge.svg)
![EuroCOVIDhub-baseline
status](https://github.com/european-modelling-hubs/covid19-forecast-hub-europe-submissions/workflows/EuroCOVIDhub-baseline/badge.svg)
![ULZF
status](https://github.com/european-modelling-hubs/covid19-forecast-hub-europe-submissions/workflows/ULZF/badge.svg)
![UpgUmibUsi
status](https://github.com/european-modelling-hubs/covid19-forecast-hub-europe-submissions/workflows/UpgUmibUsi/badge.svg)
![weekly-growth
status](https://github.com/european-modelling-hubs/covid19-forecast-hub-europe-submissions/workflows/weekly-growth/badge.svg)

<!-- badges: end -->

This repo contains the necessary infrastructure to handle automatic
submissions to a Forecast Hub (in this specific case, the [European
Covid-19 Forecast
Hub](https://github.com/epiforecasts/covid19-forecast-hub-europe)).

Each model is stored as a git submodule (after a security scan) under
the `models/` folder and code is run automatically on a schedule via
GitHub Actions. The generated forecasts are then submitted to the hub
repository as a pull request.

As of 2023-11-03, 478 automated submissions have successfully been
merged.

## Guidelines for submitting your model

To submit your model for auto-submission, you need to [open an
issue](https://github.com/epiforecasts/covid19-forecast-hub-europe-submissions/issues/new?template=new-model.md)
providing:

- The URL to a public git repository (e.g., hosted on GitHub)
  containing:
  - a file `main.sh`, `main.R` or `main.py` **at its root**. This `main`
    file needs to create the forecasts with the expected folder
    structure in a folder named `data-processed`.
  - a dependency management file. The exact name and syntax depend on
    the programming language you are using. Some examples are
    `requirements.txt` for python (with pip) or `renv.lock` for R (with
    renv). **All dependencies must have an exact version pinned to
    minimise risk of breakage with future dependency updates.**
- the week day and time at which the workflow should run (as UTC).
- the name of the GitHub user who should be tagged on pull request to
  review automated submissions.

Please note that although encouraged, it is not strictly mandatory to
submit the code generating your forecasts. You can submit a script
fetching already existing forecasts from another location such as an
API, another GitHub repository, a data repository, a dropbox folder,
etc.

------------------------------------------------------------------------

### Developer guidelines

Update submodules with

    git submodule foreach git pull

Add a new submodule with

    git submodule add <repo_url> models/repo_name

Remove a submodule with

\`\`\` git submodule deinit models/repo_name git rm models/repo_name
