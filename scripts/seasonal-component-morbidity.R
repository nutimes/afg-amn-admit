# ==============================================================================
#                      EVOLUTION OF THE SEASONAL COMPONENT                     
# ==============================================================================

## ---- At the national level --------------------------------------------------

### All types of morbidity ----
seasonal_morbi_ntln <- cmpnts_morbi_ntln |>
  select(season_year) |>
  select(-.model) |> 
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

## ---- North-South ------------------------------------------------------------

### All types of morbidity ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "North-South") |>
  select(-.model) |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### ARI-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "North-South" & morbidity == "ARI") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### AWD-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "North-South" & morbidity == "AWD") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### Malaria-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "North-South" & morbidity == "Malaria") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### Measleas-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "North-South" & morbidity == "Measleas") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### Pneumonia-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "North-South" & morbidity == "Pneumonia") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### ---- Central-East ----------------------------------------------------------

### All types of morbidity ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "Central-East") |>
  select(-.model) |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### ARI-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "Central-East" & morbidity == "ARI") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### AWD-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "Central-East" & morbidity == "AWD") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### Malaria-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "Central-East" & morbidity == "Malaria") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### Measleas-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "Central-East" & morbidity == "Measleas") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### Pneumonia-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "Central-East" & morbidity == "Pneumonia") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )


## ---- West -------------------------------------------------------------------

### All types of morbidity ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "West") |>
  select(-.model) |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### ARI-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "West" & morbidity == "ARI") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### AWD-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "West" & morbidity == "AWD") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### Malaria-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "West" & morbidity == "Malaria") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### Measleas-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "West" & morbidity == "Measleas") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

### Pneumonia-only ----
cmpnts_morbi_reg |>
  select(season_year) |>
  filter(regions == "West" & morbidity == "Pneumonia") |>
  gg_season(y = season_year) +
  labs(
    colour = "Year",
    y = "Seasonal effect",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 5))
  )

# ============================== End of Workflow ===============================