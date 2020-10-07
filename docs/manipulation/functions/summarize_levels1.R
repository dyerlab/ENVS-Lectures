summarize_levels <- function( x, dataCol, groupCol, fun ) {
 
  vals <- by( x[[dataCol]], x[[groupCol]], fun)
  ret <- data.frame( names( vals ) )
  
  names( ret )[1] <- groupCol 
  
  ret[[dataCol]] <- as.numeric( vals )
  
  return( ret )
  
}


