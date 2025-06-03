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