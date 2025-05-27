################################################################################
#                      EVOLUTION OF THE SEASONAL COMPONENT                     #
################################################################################

## ---- The Seasonal Component -------------------------------------------------
cmpnts_ntnl |>
  select(season_year) |>
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

## ---- The Seasonal Component before 2015 ------------------------------------
cmpnts_ntnl |>
  select(season_year) |>
  filter(year(time) < 2016) |>
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

### ---- The Seasonal Component between 2016 and 2019 --------------------------
cmpnts_ntnl |>
  select(season_year) |>
  filter(year(time) >= 2016 & year(time) < 2020) |>
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

### ---- The Seasonal Component between 2020 and 2022 --------------------------
cmpnts_ntnl |>
  select(season_year) |>
  filter(year(time) >= 2020 & year(time) < 2022) |>
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


### ---- The Seasonal Component as of 2022 -------------------------------------
cmpnts_ntnl |>
  select(season_year) |>
  filter(year(time) >= 2022) |>
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

## ---- By Regions -------------------------------------------------------------

### --------------------------------------------------- North-South Regions ----

#### Whole time series ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "North-South") |>
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

#### Before 2016 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "North-South") |>
  filter(year(time) < 2016) |>
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

#### Between 2016 and 2019 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "North-South") |>
  filter(year(time) >= 2016 & year(time) <= 2019) |>
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

#### Between 2020 and 2021 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "North-South") |>
  filter(year(time) > 2019 & year(time) < 2022) |>
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

#### As of 2022 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "North-South") |>
  filter(year(time) >= 2022) |>
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

### -------------------------------------------------- Central-East Regions ----

#### Whole time series ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "Central-East") |>
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

#### Before 2016 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "Central-East") |>
  filter(year(time) < 2016) |>
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

#### Between 2016 and 2019 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "Central-East") |>
  filter(year(time) >= 2016 & year(time) <= 2019) |>
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

#### Between 2020 and 2021 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "Central-East") |>
  filter(year(time) >= 2020 & year(time) < 2022) |>
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

#### As of 2022 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "Central-East") |>
  filter(year(time) >= 2022) |>
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

### ----------------------------------------------------------- West Region ----

#### Whole time series ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "West") |>
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

#### Before 2015 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "West") |>
  filter(year(time) < 2015) |>
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

#### Between 2016 and 2017 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "West") |>
  filter(year(time) >= 2016 & year(time) < 2018) |>
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

#### Between 2018 and 2019 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "West") |>
  filter(year(time) >= 2018 & year(time) < 2020) |>
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

#### Between 2020 and 2021 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "West") |>
  filter(year(time) >= 2020 & year(time) < 2022) |>
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

#### As of 2021 ----
cmpnts_regional |>
  select(season_year) |>
  filter(regions == "West") |>
  filter(year(time) > 2021) |>
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

############################### End of Workflow ################################
