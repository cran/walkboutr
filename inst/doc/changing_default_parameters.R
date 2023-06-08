## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(walkboutr)

## ----generate sample data-----------------------------------------------------
gps_data <- generate_walking_in_seattle_gps_data()
accelerometry_counts <- make_full_day_bout_without_metadata()

## ----run walkbout functions, message = FALSE, warning = FALSE, results = 'hide'----
walk_bouts <- identify_walk_bouts_in_gps_and_accelerometry_data(gps_data, accelerometry_counts, epoch_length = 15)
summary_walk_bouts <- summarize_walk_bouts(walk_bouts)

