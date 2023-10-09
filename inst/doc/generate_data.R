## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----setup--------------------------------------------------------------------
library(walkboutr)

## ----sample GPS data----------------------------------------------------------
gps_data <- generate_gps_data(start_lat = 40.7128, start_long = 74.0060, start_time = lubridate::ymd_hms('2012-04-07 00:00:30'))

## ----sample GPS data head, echo = FALSE---------------------------------------
knitr::kable(head(gps_data))

## ----seattle walking data-----------------------------------------------------
seattle <- generate_walking_in_seattle_gps_data()

## ----seattle walking data head, echo = FALSE----------------------------------
knitr::kable(head(seattle))

## ----generate smallest walkbout-----------------------------------------------
accelerometry_counts <- make_smallest_bout_without_metadata()

## ----smallest walkbout head, echo=FALSE---------------------------------------
knitr::kable(head(accelerometry_counts))

## ----make full walk bout------------------------------------------------------
walk_bouts <- make_full_walk_bout_df()

## ----full walk bout head, echo=FALSE------------------------------------------
knitr::kable(head(walk_bouts))

