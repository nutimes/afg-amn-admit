afg |> 
  mutate(
    regions = case_when(
      shapeName %in% c(
        "Takhar", "Kunduz", "Badakhshan", "Baghlan", "Samangan", "Sar-e-Pul",
        "Faryab", "Jawzjan", "Balkh", "Badghis", "Hirat", "Ghor"
      ) ~ "north", 
      shapeName %in% c(
        "Helmand", "Kandahar", "Zabul", "Ghazni", "Paktika",
        "Paktia", "Khost", "Logar"
      ) ~ "south", 
      shapeName %in% c(
        "Farah", "Nimruz"
      ) ~ "West", 
      shapeName %in% c(
        "Urozgan", "Daikundi", "Bamyan", "Wardak", "Parwan", "Kabul", "Kapisa",
        "Panjshir"
      ) ~ "central", 
      .default = "east"
    )
  ) |> 
  mutate(
    regions2 = case_when(
      regions %in% c("central", "east") ~ "Central-East",
      regions %in% c("north", "south") ~ "North-South",
      .default = "West"
    )
  ) |> 
  ggplot() +
  geom_sf(
    aes(fill = factor(regions2)), 
    show.legend = TRUE
  ) +
  geom_sf_text(
    aes(label = shapeName),
    na.rm = TRUE,
    size = 3
  )
