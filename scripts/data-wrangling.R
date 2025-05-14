################################################################################
#                                DATA WRANGLING                                #
################################################################################

## ---- Prepara the data -------------------------------------------------------

admissions <- raw_data |> 
  select(
    province = Province,
    year = Year,
    quarter = Quarter,
    month = Month,
    sam_cases = samAdmittedTotal,
    mam_cases = mamU5
  ) |> 
  mutate(
    year = as.numeric(year),
    month = as.numeric(month),
    day = as.numeric(month)
  ) |> 
  mutate(
    time = do.call(
      what = make_date,
      args = list(
        year = year,
        month = month, 
        day = day
      )
    ) |> 
      yearmonth(time),
    .admissions = sam_cases + mam_cases
) |> 
  select(
    -c(year, quarter, month, sam_cases, mam_cases, day)
  )

### ------------------------------------------ Exclude 2012 and 2025's data ----
admissions <- admissions |> 
  filter(
    time >= yearmonth("2013 Jan") & time <= yearmonth("2024 Dec")
  )

### -------------------------------------------------- Summarise admissions ----

### ------------------------------------------------- At the National level ----
na <- admissions |> 
  summarise_admissions(
    .group = FALSE, 
    time = "M"
  )

### ------------------------------------------------ At the Province level -----
prov <- admissions |> 
  summarise_admissions(
    .group = TRUE, 
    time = "M"
  )

############################### End of Workflow ################################