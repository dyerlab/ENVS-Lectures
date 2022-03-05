rm( list=ls() )
library(tidyverse)
library( knitr )
library( stringr )

#
#  Open the "Terminal"
# 
#  git add -A
#  git commit -m 'put a message in here to explain what you are doing'
#  git push

# Fix to break in rmarkdown and HTMLWidgets
options(htmltools.preserve.raw = FALSE)

# if this is the first time making this repository change the following to TRUE
#  and it will go through and figure out which libraries you need to install.
firstRun <- FALSE


detachAllPackages <- function() {
  basic.packages <- c("package:stats","package:graphics","package:grDevices","package:utils","package:datasets","package:methods","package:base")
  package.list <- search()[ifelse(unlist(gregexpr("package:",search()))==1,TRUE,FALSE)]
  package.list <- setdiff(package.list,basic.packages)
  if (length(package.list)>0)  for (package in package.list) detach(package, character.only=TRUE)
}


if ( firstRun ) {
  
  libs <- c("library(tidyverse)",
            "library(knitr)",
            "library(stringr)",
            "library(rmarkdown)",
            "library(blogdown)",
            "library(devtools)",
            "library(Hmisc)" ) 
  
  allRmd <- list.files("lectures",pattern = ".Rmd",recursive = TRUE,full.names = TRUE)

  for( file in allRmd) {
    lines <- readLines(file,warn = FALSE)
    if( any( grepl("^library", lines ) )) { 
      libs <- c(libs, lines[ grepl("^library", lines ) ])
    }
  }

  libs %>% 
    str_remove_all("library\\(") %>%
    str_remove_all( "\\)") %>%
    str_remove_all( "\"") %>%
    str_trim() %>%
    sort() %>%
    unique() -> to_install
  
  curr_packages <- installed.packages()
  curr_packages <- names( is.na(curr_packages[,4]))
  
  needed <- setdiff( to_install, curr_packages)
  install.packages( needed, ask=FALSE)
  
  devtools::install_github("hadley/emo")
  devtools::install_github("clauswilke/ggisoband")
  devtools::install_github("dyerlab/popgraph")
  devtools::install_github("dyerlab/gstudio")
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
# system("find lectures -iname '*.html' -delete")
system( "find lectures -name '*nb *.html' -delete")
system( "find lectures -iname '.DS_Store' -delete")
system( "find docs -iname '.DS_Store' -delete")
system("find docs -iname '*.rda' -delete")


