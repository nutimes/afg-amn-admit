

read_afghanistan_shp <- function(
  path_to_zip, 
  exdir = "data-raw/afg.shp",
  overwrite = FALSE, 
  layer = NULL
) {

  unzip(
    zipfile = path_to_zip, 
    exdir = exdir, 
    overwrite = overwrite
  )
}
