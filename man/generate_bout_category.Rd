% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/process_bouts_and_gps_epochs_into_walkbouts.R
\name{generate_bout_category}
\alias{generate_bout_category}
\title{Generate bout categories}
\usage{
generate_bout_category(
  walk_bouts,
  bout_radii,
  gps_completeness,
  max_dwellbout_radii_ft,
  max_walking_cpe,
  min_walking_speed_km_h,
  max_walking_speed_km_h
)
}
\arguments{
\item{walk_bouts}{a data frame that contains bout information for walking bouts.}

\item{bout_radii}{a data frame that contains bout radii information.}

\item{gps_completeness}{a data frame that contains GPS data completeness information.}

\item{max_dwellbout_radii_ft}{a numeric scalar that specifies the maximum radius, in feet, of a bounding circle that would be considered a dwell bout.}

\item{max_walking_cpe}{a numeric scalar that specifies the maximum activity counts per epoch value before the accelerometer is considered to be picking up on an activity other than walking.}

\item{min_walking_speed_km_h}{a numeric scalar that specifies the minimum speed considered walking.}

\item{max_walking_speed_km_h}{a numeric scalar that specifies the maximum speed considered walking.}
}
\value{
a data frame with the following columns: bout, dwell_bout (T/F), non_walk_too_vigorous (T/F), non_walk_slow (T/F), non_walk_fast (T/F), non_walk_incomplete_gps (T/F)
}
\description{
Given accelerometer bout data, this function generates bout categories, which includes dwell bouts, non-walk bouts that are either too slow, too fast, or too vigorous, and bouts with an unknown lack of GPS data.
}
\details{
The function uses the bout information for walking bouts, bout radii information, and GPS data completeness information to generate the bout categories.

The function first generates dwell bouts by joining the bout radii information and GPS data completeness information on the bout column, and then filters out the rows that have bout values that are missing using the filter function. Then, it calculates the dwell bout values as TRUE if the complete_gps column is TRUE and the bout_radius column is less than max_dwellbout_radii_ft. The resulting data frame only contains the bout and dwell_bout columns.
The function then joins the resulting data frame with the walking bout data frame using the bout column. Then, for the non-walk bouts, the function calculates whether they are too vigorous, too slow, or too fast. For the non-walk bouts that are too vigorous, the function calculates the mean activity_counts for each bout, and then sets the non_walk_too_vigorous value as TRUE if the mean activity_counts value is greater than max_walking_cpe. For the non-walk bouts that are too slow or too fast, the function calculates the median speed for each bout, and then sets the non_walk_slow or non_walk_fast value as TRUE if the median speed value is less than min_walking_speed_km_h or greater than max_walking_speed_km_h, respectively. Finally, the function generates a non_walk_incomplete_gps value as TRUE if the complete_gps value is FALSE for the bout.
The resulting data frame contains the following columns: bout, dwell_bout (T/F), non_walk_too_vigorous (T/F), non_walk_slow (T/F), non_walk_fast (T/F), non_walk_incomplete_gps (T/F).
}
