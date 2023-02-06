# Pull SDSC_ISG-TrendModel from repo

forecast_date <- lubridate::floor_date(lubridate::today(),
                               unit = "week",
                               week_start = 7)

filename <- paste0(forecast_date, "-SDSC_ISG-TrendModel.csv")

url <- paste0("https://raw.githubusercontent.com/TaoSunVoyage/covid19-forecast-hub-europe/main/data-processed/SDSC_ISG-TrendModel/", filename)

dir <- here::here("models", "SDSC_ISG-TrendModel", "data-processed")

dir.create(dir)

download.file(url = url, destfile = paste0(dir, "/", filename))
