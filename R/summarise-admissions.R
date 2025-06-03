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
        select(regions, time, .admissions) |>
        group_by(regions, time) |>
        summarise(
          .admissions = sum(.admissions, na.rm = TRUE),
          .groups = "drop"
        ) |>
        as_tsibble(
          index = time,
          key = regions
        )
    }
    if (time == "Q") {
      .ts <- .ts |>
        select(regions, time, .admissions) |>
        group_by(regions, time) |>
        summarise(
          .admissions = sum(.admissions, na.rm = TRUE),
          .groups = "drop"
        ) |>
        as_tsibble(
          key = regions,
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

#'
#'
#'
#' Summarise morbidity admission data
#'
#' @param .ts A time series object of class `tsibble`.
#'
#' @param .group Logical. Whether the `tsibble` should be grouped or not, as
#'    it would be required in subsequent analysis.
#'
#' @param location The geographical area in which the admissions should be
#'    summarised at.
#'

summarise_admissions_morb <- function(.ts, .group = TRUE, location = NULL) {
  ## Grouped time series ----
  if (.group) {
    .ts <- .ts |>
      group_by({{ location }}, morbidity, time) |>
      summarise(
        .admissions = sum(.admissions, na.rm = TRUE),
        .groups = "drop"
      ) |>
      as_tsibble(
        index = time,
        key = c({{ location }}, morbidity)
      )
  } else {
    .ts <- .ts |>
      group_by(morbidity, time) |>
      summarise(
        .admissions = sum(.admissions, na.rm = TRUE),
        .groups = "drop"
      ) |>
      as_tsibble(
        index = time
      )
  }
  .ts
}
