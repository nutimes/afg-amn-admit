#'
#'
#' Summarise time series data
#'
#' @param .ts A time series object of class `tsibble`.
#'
#' @param .group Logical. Whether the `tsibble` should be grouped or not, as
#'    it would be required in subsequent analysis.
#'
#' @param time A choice of the time series interval of occurrence.
#' `"M"` for monthly and `"Q"` for quarterly.
#'
#'
#' 

summarise_admissions <- function(.ts, .group = TRUE, time = c("M", "Q")) {
  ## Enforce options in `time` ----
  time <- match.arg(time)

  ## Grouped time series ----
  if (.group) {
    if (time == "M") {
      .ts <- .ts |>
        select(province, time, .admissions) |>
        group_by(province, time) |>
        summarise(
          .admissions = sum(.admissions, na.rm = TRUE),
          .groups = "drop"
        ) |>
        as_tsibble(
          index = time,
          key = province
        )
    }
    if (time == "Q") {
      .ts <- .ts |>
        select(province, time, .admissions) |>
        group_by(province, time) |>
        summarise(
          .admissions = sum(.admissions, na.rm = TRUE),
          .groups = "drop"
        ) |>
        as_tsibble(
          key = province,
          index = time
        )
    }
  } else {
    if (time == "M") {
      .ts <- .ts |>
        select(time, .admissions) |>
        group_by(time) |>
        summarise(
          .admissions = sum(.admissions, na.rm = TRUE),
          .groups = "drop"
        ) |>
        as_tsibble(
          index = time
        )
    }

    if (time == "Q") {
      .ts <- .ts |>
        select(time, .admissions) |>
        group_by(time) |>
        summarise(
          .admissions = sum(.admissions, na.rm = TRUE),
          .groups = "drop"
        ) |>
        as_tsibble(
          index = time
        )
    }
  }
  ## Return ----
  .ts
}
