################################################################################
#                                DECOMPOSITION                                 #
################################################################################

## ---- Decomposition at the national level ------------------------------------
cmpnts_morbi_ntln <- morbi_ntln |>
  model(
    STL(
      .admissions ~ trend(window = 13) + season(window = 7)
    )
  ) |> 
  components()


## ---- Decomposition at the regional level ------------------------------------
cmpnts_morbi_reg <- morbi_reg |>
  model(
    STL(
      .admissions ~ trend(window = 13) + season(window = 7)
    )
  ) |> 
  components()
