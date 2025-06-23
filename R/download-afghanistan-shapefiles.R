#'
#' Download zipfile of Afghanistan shapefiles from Humanitarian Data Exchange
#'
#' @param url Download URL for Somalia shapefiles from Humanitarian Data
#'   Exchange. This is set to https://github.com/wmgeolab/geoBoundaries/raw/9469f09/releaseData/gbOpen/AFG/ADM2/geoBoundaries-AFG-ADM2-all.zip
#'   by default.
#' @param destfile Download path for Somalia shapefiles zipfile. This is set to
#'   "data-raw/Somalia_shp.zip" by default.
#' @param overwrite Logical. Should `destfile` be overwritten if present?
#'   Default is FALSE.
#'
#' @returns A downloaded zipfile as specified in `destfile`.
#'
#'

download_afgh_shp <- function(
  url = character(),
  destfile = character(),
  overwrite = TRUE
) {

  ## Check whether destfile exists and download accordingly ----

  if (file.exists(destfile)) {
    if (overwrite) {
      message(
        paste0("`", destfile, "exists and `overwrite = TRUE` . ) "),
        paste0("Downloading  `", destfile, "` .")
      ) 
      download.file(url = url, destfile = destfile, mode = "wb")
    } else {
      message(
        paste0("`", destfile, "` exists and `overwrite = FALSE`. )"), 
        paste0("`", destfile, " , will not be downloaded")
      )
    }
  } else {
    download.file(url = url, destfile = destfile, mode = "wb")
  }
}
