#' This function is an example function that creates a transparent theme for 
#'   ggplot that can be used on slides with dark backgrounds.
#'   

theme_dyer_dark <- function() {
  library( ggplot2 )
  p <- theme_minimal()
  p <- p + theme(
      panel.background = element_rect(fill = "transparent", colour = NA), 
      plot.background = element_rect(fill = "transparent", colour = NA),
      legend.background = element_rect(fill = "transparent", colour = NA),
      legend.key = element_rect(fill = "transparent", colour = NA),
      text = element_text(colour = "white"),
      axis.text = element_text(colour = "white")
    )
  
  return( p )
}