#' Takes the raw data and summarizes data across category levels.
#' 
#' @description This simple function takes a data frame object and does a simple 
#'   summarization of a single data column based upon a column used as 
#'   categorical data.
#'   
#' @param x A data frame object.
#' @param dataCol The name of the data column
#' @param groupCol The name of the group column
#' @param fun The function to apply it the data
#' 
#' @return A data.frame object with the values 
#' 

summarize_levels <- function( x, dataCol, groupCol, fun ) {
  
  vals <- by( x[[dataCol]], x[[groupCol]], fun)
  
  ret <- data.frame( names(vals) )
  names( ret )[1] <- groupCol 
  
  ret[[dataCol]] <- as.numeric( vals )
  
  return( ret )
}

