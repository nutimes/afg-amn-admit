# ==============================================================================
#                                DATA WRANGLING                                
# ==============================================================================

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

### Exclude 2012 and 2025's data ----
admissions <- admissions |>
  filter(
    time >= yearmonth("2013 Jan") & time <= yearmonth("2024 Dec")
  )

## ----Summarise admissions ----------------------------------------------------

### At the National level ----
na <- admissions |>
  summarise_admissions(
    .group = FALSE,
    time = "M"
  )

#### Apply Box-Cox transformation to stabilize variance ----
lbd_na <- na |> 
  features(
    .var = .admissions,
    features = guerrero
  ) |> 
  pull(lambda_guerrero)

#### Transform the data ----
nabx <- na |> 
  mutate(
    .admissions = do.call(
      what = box_cox,
      args = list(x = .admissions, lambda = lbd_na)
    )
  )

### At the Province level -----
reg <- admissions |>
  mutate(
    regions = case_when(
      province %in% c(
        "Takhar", "Kunduz", "Badakhshan", "Baghlan", "Samangan", "Sar-e-Pul",
        "Faryab", "Jawzjan", "Balkh", "Badghis", "Hirat", "Ghor"
      ) ~ "north", 
      province %in% c(
        "Helmand", "Kandahar", "Zabul", "Ghazni", "Paktika",
        "Paktia", "Khost", "Logar"
      ) ~ "south", 
      province %in% c(
        "Farah", "Nimroz"
      ) ~ "West", 
      province %in% c(
        "Urozgan", "Daikundi", "Bamyan", "Wardak", "Parwan", "Kabul", "Kapisa",
        "Panjshir"
      ) ~ "central", 
      .default = "east"
    )
  ) |> 
  mutate(
    regions = case_when(
      regions %in% c("central", "east") ~ "Central-East",
      regions %in% c("north", "south") ~ "North-South",
      .default = "West"
    )
  ) |> 
  summarise_admissions(
    .group = TRUE,
    time = "M"
  )

### Apply Box-Cox transformation ----
#### Get lambdas ----
lambda_regions <- reg |> 
  features(
    .var = .admissions,
    features = guerrero
  ) |> 
  pull(lambda_guerrero)


#### Apply Box-Cox transformation ----
reg_bxcx <- reg |> 
  mutate(
    .admissions = do.call(
      what = row_wise_box_cox,
      args = list(
        admissions = .admissions,
        regions = regions,
        lambdas = lambda_regions
      )
    )
  )

# ============================== End of Workflow ===============================