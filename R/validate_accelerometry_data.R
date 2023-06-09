#' Validate accelerometry input data
#'
#' The input schema for the accelerometry data is `time` and `activity_counts`.
#' - `time` should be a column in date-time format, in the UTC time zone, with no null values.
#' - `activity_counts` should be a positive numeric column with no null values.
#'
#' This function checks the schema of the accelerometry input data
#' and raises an error if any schema constraints are violated.
#'
#' @param accelerometry_counts Raw accelerometry data with the expected schema.
#'
#' @returns This function does not return anything. It throws an error if the accelerometry data fails any of the validation checks.
#'
#' @details The following schema validations are performed on the input data:
#'   - The input data must contain two columns, named `time` and `activity_counts`.
#'   - The `time` column must be in date-time format, in the UTC time zone, with no null values.
#'   - The `activity_counts` column must be a positive numeric column with no null values.
#'
#' @examples
#' # Example usage:
#' data <- data.frame(
#'   time = seq(
#'     as.POSIXct("2021-01-01 00:00:00", tz = "UTC"),
#'     as.POSIXct("2021-01-01 23:59:59", tz = "UTC"),
#'     by = "5 mins"
#'   )) %>%
#'   dplyr::mutate(activity_counts = sample(0:100, length(time), replace = TRUE))
#' validate_accelerometry_data(data)
#'
#' @export
validate_accelerometry_data <- function(accelerometry_counts){

  # Validate Schema
    diff <- setdiff(names(accelerometry_counts), c("time", "activity_counts"))
    missing <- setdiff(c("time", "activity_counts"), names(accelerometry_counts))
    if(length(missing)>0){
      stop(paste0("Error: data provided are missing `", missing, "` columns."))
    }
    if(length(diff)>0){
      diff <- paste0(diff, collapse = ', ')
      stop(paste0("Error: data provided have the following extra columns: ", diff))
    }

  # Validate time variable
    if(!lubridate::is.timepoint(accelerometry_counts$time)){
      stop(paste0("Error: time is not provided in date-time format. class of time variable should be: `POSIXct` `POSIXt`"))
    }
    if(any(is.na(accelerometry_counts$time))){
      stop(paste0("Error: activity counts contain NAs"))
    }
    if(!(lubridate::tz(accelerometry_counts$time) == "UTC")){
      stop(paste0("Error: time zone provided is not UTC."))
    }
    if((length(unique(accelerometry_counts$time))) != nrow(accelerometry_counts)){
      stop(paste0("Error: times are not unique."))
    }
    if(length(unique(diff(accelerometry_counts$time)))!=1){
      stop(paste0("Error: Unequal time intervals."))
    }

  # Validate activity_counts variable
    if(!(class(accelerometry_counts$activity_counts) %in% c("integer", "numeric"))){
      stop(paste0("Error: activity counts are not class integer or numeric."))
    }
    if(any(is.na(accelerometry_counts$activity_counts))){
      stop(paste0("Error: activity counts contain NAs"))
    }
    if(!all(accelerometry_counts$activity_counts >= 0)){
      stop(paste0("Error: negative activity counts in data."))
    }
}
