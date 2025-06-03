#' 
#' 
#' Row-wise Box-Cox Transformation 
#' 
#' @param admissions Vector of class `numeric` for the number of cases admitted.
#' 
#' @param regions Vector of class `character` for the regions in the dataset.
#' 
#' @param lambdas Vector of class `numeric` for the lambda values of each region.
#' 
#' @returns A vector of class `double` with `lsystem` specific box-cox values.
#' 


row_wise_box_cox <- function(admissions, regions, lambdas) {

  regions_levels <- levels(factor(regions))
  lambdas <- lambdas
  
  # Initialize output vector with same length as admissions ----
  .admissions <- numeric(length(admissions))
  
  for (i in seq_along(regions_levels)) {
    reg <- regions_levels[i]
    lambda <- lambdas[i]
    
    # Apply Box-Cox to subset of admissions by lsystems category ----
    idx <- regions == reg
    .admissions[idx] <- box_cox(admissions[idx], lambda = lambda)
  }
  
  .admissions
}

#' 
#' 
#' 
#' Inverse Row-wise Box-Cox Transformation 
#' 
#' 

rowwise_inv_box_cox <- function(what, regions, lambdas) {
  
  regions_levels <- levels(factor(regions))
  lambdas <- lambdas

  # Initialise an empty vector of the same lenght as admissions ----
  .admissions <- numeric(length(what))

  for (i in seq_along(regions_levels)) {
    reg <- regions_levels[i]
    lambda <- lambdas[i]

    ## Invert Box-Cox transformed admission data by region ----
    idx <- regions == reg
    .admissions[idx] <- inv_box_cox(
      x = what[idx], lambda = lambda
    )
  }
  .admissions
}
