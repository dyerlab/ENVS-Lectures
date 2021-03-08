rm( list=ls() )
library(tidyverse)



#
#  Open the "Terminal"
# 
#  git add -A
#  git commit -m 'put a message in here to explain what you are doing'
#  git push





options(htmltools.preserve.raw = FALSE)

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

