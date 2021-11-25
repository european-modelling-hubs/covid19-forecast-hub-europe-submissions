#!/bin/bash

TODAY=$(date +'%Y-%m-%d')
wget -P data-submissions/epinow2 https://raw.githubusercontent.com/epiforecasts/europe-covid-forecast/master/submissions/rt-forecasts/$TODAY/$TODAY-epiforecasts-EpiNow2.csv
