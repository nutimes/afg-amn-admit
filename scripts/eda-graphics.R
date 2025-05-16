################################################################################
#                           EXPLORATORY DATA ANALYIS
################################################################################


## ---- National level ---------------------------------------------------------

### ------------------------------------------------------------- Time plot ----
tsplot <- na |>
  filter(time < yearmonth("2019 Aug")) |> 
  autoplot(.vars = .admissions) +
  xlab("Time [1M]") +
  ylab("Number of cases") +
  theme(
    plot.subtitle = element_text(colour = "#706E6D", size = 9.5),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(t = 7)),
    plot.title = element_text(size = 12)
  )

### --------------------------------------------------------- Seasonal Plot ----
na |> 
  gg_season(
    y = .admissions,
    labels = "right"
  ) +
  labs(
    y = "Number of cases",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(r = 5)),
    plot.title = element_text(size = 12)
  )

### ------------------------------------------------ Admissions before 2022 ----
  na |> 
    filter(year(time) < 2022) |> 
    gg_season(
      y = .admissions,
      labels = "right"
    ) +
    labs(
      y = "Number of cases",
      x = "Time [1M]"
    ) +
    theme(
      plot.subtitle = element_text(colour = "#706E6D"),
      plot.caption = element_text(colour = "#706E6D"),
      axis.title.y = element_text(size = 10, margin = margin(r = 5)),
      axis.title.x = element_text(size = 10, margin = margin(r = 5)),
      plot.title = element_text(size = 12)
    )

### ------------------------------------------------- Admissions as of 2022 ----
na |> 
  filter(year(time) >= 2022) |> 
  gg_season(
    y = .admissions,
    labels = "right"
  ) +
  labs(
    y = "Number of cases",
    x = "Time [1M]"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    plot.caption = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(r = 5)),
    plot.title = element_text(size = 12)
  )

################################ End of Workflow ###############################