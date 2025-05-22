################################################################################
#                             WRANGLE MORBIDITY DATA                           #
################################################################################

## ---- Prepara the data -------------------------------------------------------
morbidity <- raw_data_morbidity |> 
  rename(
    morbidity = OPD.morbidity,
    province = Province
  ) |> 
  filter(morbidity != "HMIS-MIAR-OPD- New Patients/Clients") |> 
  pivot_longer(
    cols = !c(morbidity, province),
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
    province, .before = morbidity
  )
