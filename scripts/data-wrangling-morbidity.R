################################################################################
#                             WRANGLE MORBIDITY DATA                           #
################################################################################

## ---- Prepara the data -------------------------------------------------------
morbidity <- raw_data_morbidity |> 
  rename(
    morbidity = OPD.morbidity,
    location = Province
  ) |> 
  filter(morbidity != "HMIS-MIAR-OPD- New Patients/Clients") |> 
  pivot_longer(
    cols = !c(morbidity, location),
    names_to = "time",
    values_to = ".admissions"
  ) |> 
  mutate(
    time = gsub(pattern = "\\.", replacement = "/", x = time),
    time = ymd(
      as.Date(
        paste0("01/", time), format = "%d/%B/%Y"
      )
    ),
    time = yearmonth(time)
  )

### ------------------------------------------------------- Recode diseases ----
morbidity <- morbidity |> 
  mutate(
    morbidity = case_when(
      morbidity == "HMIS-MIAR-OPD- New Acute Watery Diarrhea" ~ "AWD",
      morbidity == "HMIS-MIAR-OPD- New Cough and Cold (ARI)" ~ "ARI",
      morbidity == "HMIS-MIAR-OPD- New Malaria" ~ "Malaria",
      morbidity == "HMIS-MIAR-OPD- New Measles" ~ "Measleas",
      .default = "Pneumonia"
    )
  ) |> 
  relocate(
    location, .before = morbidity
  )

## ---- Summarise admissions ---------------------------------------------------

### ------------------------------------------------- At the National level ----
morbi_ntln <- summarise_admissions_morb(
  .ts = morbidity,
  .group = FALSE
)


### ------------------------------------------------ At the Province level -----
morbi_reg <- morbidity|>
  mutate(
    regions = case_when(
      location %in% c(
        "Takhar", "Kunduz", "Badakhshan", "Baghlan", "Samangan", "Sar-e-Pul",
        "Faryab", "Jawzjan", "Balkh", "Badghis", "Hirat", "Ghor"
      ) ~ "north", 
      location %in% c(
        "Helmand", "Kandahar", "Zabul", "Ghazni", "Paktika",
        "Paktia", "Khost", "Logar"
      ) ~ "south", 
      location %in% c(
        "Farah", "Nimroz"
      ) ~ "west", 
      location %in% c(
        "Urozgan", "Daikundi", "Bamyan", "Wardak", "Parwan", "Kabul", "Kapisa",
        "Panjshir"
      ) ~ "central", 
      .default = "east"
    )
  ) |> 
  mutate(
    regions = case_when(
      regions %in% c("central", "east") ~ "central-east",
      regions %in% c("north", "south") ~ "north-south",
      .default = "west"
    )
  ) |> 
  summarise_admissions_morb(
    .group = TRUE,
    location = regions
  )
