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

## ----run walkbout functions, message=FALSE,warning=FALSE----------------------
walk_bouts <- identify_walk_bouts_in_gps_and_accelerometry_data(gps_data, accelerometry_counts)
summary_walk_bouts <- summarize_walk_bouts(walk_bouts)

## ----head walkbouts, echo = FALSE---------------------------------------------
knitr::kable(head(walk_bouts))

## ----head summary, echo = FALSE-----------------------------------------------
knitr::kable(head(summary_walk_bouts))

## ---- message=FALSE, warning=FALSE--------------------------------------------
accelerometry_counts <- make_smallest_bout_without_metadata()
gps_data <- generate_walking_in_seattle_gps_data()
generate_bout_plot(accelerometry_counts, gps_data, 1)

