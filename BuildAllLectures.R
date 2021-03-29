rm( list=ls() )
library(tidyverse)

#
#  Open the "Terminal"
# 
#  git add -A
#  git commit -m 'put a message in here to explain what you are doing'
#  git push




# Fix to break in rmarkdown and HTMLWidgets
options(htmltools.preserve.raw = FALSE)



# look to make sure all the libraries are installed
allRmd <- list.files("lectures",pattern = ".Rmd",recursive = TRUE,full.names = TRUE)
all_libs <- c("tidyverse","readtext", "stringr")
df.files <- readtext::readtext(allRmd, verbosity = 0)
pull_libraries <- function( file ) { 
  lines <- strsplit(file, split="\n")[[1]]
  idx <- grep( pattern = "^library\\(", x=lines)
  libs <- lines[idx]
  libs <- stringr::str_remove_all(libs,"library\\(")
  libs <- stringr::str_remove_all(libs, "\\)")
  libs <- stringr::str_remove_all(libs, " ")
  all_libs <- c( all_libs, libs )
  return( unique( all_libs ) ) 
}

for( line in df.files$text) { 
  
  }





if( FALSE ) {
  # clean out all html files
  system("rm -rf docs/*")
  system("find lectures -iname '*.html' -delete")
  system("find lectures -name 'libs' -type d -exec rm -rv {} + ")
  system("find lectures -name 'slides_files' -type d -exec rm -rv {} + ")
  system("find lectures -iname '*2.css' -delete")
  system("find lectures -iname '*2.js' -delete")
  system("find lectures -iname '*2.map' -delete")
  system("find lectures -iname '*2.svg' -delete")
  system("find lectures -iname '*2.html' -delete")
  system("find lectures -iname '*3.css' -delete")
  system("find lectures -iname '*3.js' -delete")
  system("find lectures -iname '*3.map' -delete")
  system("find lectures -name .DS_Store -delete")
}


# Build all the folders in the lecture tree
for( folder in list.dirs("lectures",full.names = TRUE,recursive = FALSE) ) {
  print( paste("Building",folder) )
  blogdown::build_dir( folder, force=FALSE )
}
rmarkdown::render("lectures/index.Rmd")

# Move over the contents of the lecture 
#system("cp -R lectures/ docs/")
system("rsync -raz --progress  lectures/ docs/")
system("find docs -iname '*.Rmd' -delete" )
system("find docs -iname '*.zip' -delete" )

# clean up the lecture folder
#system("find lectures -iname '*.html' -delete")

