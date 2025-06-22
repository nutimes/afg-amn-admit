# ==============================================================================
#                                DECOMPOSITION                                 
# ==============================================================================

## ---- Decomposition at the national level ------------------------------------

### Decomponse and get the components ----
cmpnts_morbi_ntln <- morbi_ntln |>
  model(
    STL(
      .admissions ~ trend(window = 13) + season(window = 7)
    )
  ) |> 
  components()


### Visualise components ----
cmpnts_morbi_ntnl_plot <- cmpnts_morbi_ntln |>
  autoplot() +
  labs(
    title = "The components of the time series of morbidites",
    subtitle = "",
    x = "Time[1M]"
  ) +
scale_color_manual(
    values = c(
      "ARI/STL(.admissions ~ trend(window = 13) + season(window = 7))" = "red",
      "AWD/STL(.admissions ~ trend(window = 13) + season(window = 7))" = "green",
      "Malaria/STL(.admissions ~ trend(window = 13) + season(window = 7))" = "blue",
      "Measles/STL(.admissions ~ trend(window = 13) + season(window = 7))" = "orange",
      "Pneumonia/STL(.admissions ~ trend(window = 13) + season(window = 7))" = "purple"
    ),
    labels = c(
      "ARI/STL(.admissions ~ trend(window = 13) + season(window = 7))" = "ARI",
      "AWD/STL(.admissions ~ trend(window = 13) + season(window = 7))" = "AWD",
      "Malaria/STL(.admissions ~ trend(window = 13) + season(window = 7))" = "Malaria",
      "Measles/STL(.admissions ~ trend(window = 13) + season(window = 7))" = "Measles",
      "Pneumonia/STL(.admissions ~ trend(window = 13) + season(window = 7))" = "Pneumonia"
    ),
    name = "morbidity"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(r = 5))
  )

## ---- Decomposition at the regional level ------------------------------------

### Decomponse and get the components ----
cmpnts_morbi_reg <- morbi_reg |>
  model(
    STL(
      .admissions ~ trend(window = 13) + season(window = 7)
    )
  ) |> 
  components()

# ============================== End of Workflow ===============================