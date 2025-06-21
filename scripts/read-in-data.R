# ==============================================================================
#                                  READ DATA                                   #
# ==============================================================================

## ---- Decrypt and read admissions data ---------------------------------------

raw_data <- decrypt(
  expr = read.csv(file = "data/raw/cmam-admissions.csv"),
  key = secret_key
)

## ---- Decrypt and read admissions data ---------------------------------------

raw_data_morbidity <- decrypt(
  expr = read.csv(file = "data/raw/childhood-morbidity-admissions.csv"), 
  key = secret_key
)


## ---- Download shapefiles -----------
download_afgh_shp(
  url = "https://github.com/wmgeolab/geoBoundaries/raw/9469f09/releaseData/gbOpen/AFG/ADM1/geoBoundaries-AFG-ADM1-all.zip",
  destfile = "data/afghanistan-shp.zip",
  overwrite = TRUE
)

## ---- Unzipe file -------
read_afghanistan_shp(
  path_to_zip = "data/afghanistan-shp.zip",
  exdir = "data/afg-shp",
  overwrite = TRUE
)

afg <- sf::st_read(
  dsn = "data/afg-shp",
  layer = "geoBoundaries-AFG-ADM1"
)

# ============================== End of Workflow ===============================