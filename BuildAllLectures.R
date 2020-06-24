rm( list=ls() )
library(tidyverse)

clean <- TRUE
if( clean ) {
  # clean out all html files
  system("rm -rf docs/*")
  system("find lectures -iname '*.html' -delete")
  system("find lectures -name 'libs' -type d -exec rm -rv {} + ")
  system("find lectures -name 'slides_files' -type d -exec rm -rv {} + ")
}


# Build all the folders in the lecture tree
for( folder in list.dirs("lectures",full.names = TRUE,recursive = FALSE) ) {
  print( paste("Building",folder) )
  blogdown::build_dir( folder )
}
rmarkdown::render("lectures/index.Rmd")

# Move over the contents of the lecture 
system("cp -R lectures/ docs/")
system("find docs -iname '*.Rmd' -delete" )
system("find docs -name 'data' -type d -exec rm -rv {} + ")
