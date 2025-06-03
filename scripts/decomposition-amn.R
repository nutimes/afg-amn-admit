# ==============================================================================
#                                DECOMPOSITION                                 
# ==============================================================================

## ---- Decomposition at the national level ------------------------------------

### Decompose and get components ----
cmpnts_ntnl <- nabx |>
  model(
    STL(
      .admissions ~ trend(window = 13) + season(window = 7)
    )
  ) |>
  components() |>
  mutate(
    .admissions = do.call(
      what = inv_box_cox,
      args = list(x = .admissions, lambda = lbd_na)
    ),
    trend = do.call(
      what = inv_box_cox,
      args = list(x = trend, lambda = lbd_na)
    ),
    season_year = do.call(
      what = inv_box_cox,
      args = list(x = season_year, lambda = lbd_na)
    ),
    remainder = do.call(
      what = inv_box_cox,
      args = list(x = remainder, lambda = lbd_na)
    )
  )

### Visualise components ----
cmpnts_ntnl |>
  autoplot() +
  labs(
    title = "The Components of the Acute Malnutrition Admission at the National Level",
    subtitle = "The amplitude of the peak flattned as of 2015"
  ) +
  theme(
    plot.subtitle = element_text(colour = "#706E6D"),
    axis.title.y = element_text(size = 10, margin = margin(r = 5)),
    axis.title.x = element_text(size = 10, margin = margin(r = 5))
  )

## ---- Decomposition at the regional level ------------------------------------

### Decompose and get components ----
cmpnts_regional <- reg_bxcx |>
  model(
    STL(
      .admissions ~ trend(window = 13) + season(window = 7)
    )
  ) |>
  components() |>
  mutate(
    .admissions = do.call(
      what = rowwise_inv_box_cox,
      args = list(
        what = .admissions,
        regions = regions,
        lambdas = lambda_regions
      )
    ),
    trend = do.call(
      what = rowwise_inv_box_cox,
      args = list(
        what = trend,
        regions = regions,
        lambdas = lambda_regions
      )
    ),
    season_year = do.call(
      what = rowwise_inv_box_cox,
      args = list(
        what = season_year,
        regions = regions,
        lambdas = lambda_regions
      )
    ),
    remainder = do.call(
      what = rowwise_inv_box_cox,
      args = list(
        what = remainder,
        regions = regions,
        lambdas = lambda_regions
      )
    )
  )

# ============================== End of Workflow ===============================