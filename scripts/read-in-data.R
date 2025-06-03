# ==============================================================================
#                                  READ DATA                                   #
# ==============================================================================

## ---- Decrypt and read admissions data ---------------------------------------

raw_data <- decrypt(
  expr = read.csv(file = "data-raw/cmam-admissions.csv"),
  key = secret_key
)

## ---- Decrypt and read admissions data ---------------------------------------

raw_data_morbidity <- decrypt(
  expr = read.csv(file = "data-raw/childhood-morbidity-admissions.csv"), 
  key = secret_key
)

# ============================== End of Workflow ===============================