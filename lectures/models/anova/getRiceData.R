####################################################
#
#  This gives me the Rice center Data from the Pier
#   ~ 8199 lines of stuff
#
####################################################

getRiceData <- function() {
  
  suppressMessages( require(tidyverse) )
  suppressMessages( require(lubridate) )
  
  long_link <- c( "https://docs.google.com/spreadsheets/d",
                  "/1Mk1YGH9LqjF7drJE-td1G_JkdADOU0eMlrP01WFBT8s",
                  "/pub?gid=0&single=true&output=csv"
  )
  link <- paste(long_link, collapse="")
  rice_data <- read_csv( link )
  
  # Format the DataTime Object
  format <- "%m/%d/%Y %I:%M:%S %p"
  rice_data$Date <- parse_date_time( rice_data$DateTime, 
                                     orders=format, 
                                     tz="EST" )
  rice_data$DateTime <- NULL
  
  rice_data$AirTemp <- 5/9 * (rice_data$AirTempF - 32) 
  rice_data$AirTempF <- NULL
  
  rice_data$Rain <- rice_data$Rain_in * 2.54 
  rice_data$Rain_in <- NULL
  rice_data$WindSpeed <- rice_data$WindSpeed_mph * 1.60934 
  rice_data$WindSpeed_mph <- NULL
  rice_data$PH_mv <- NULL
  rice_data$BGAPC_rfu <- NULL
  rice_data$Depth_ft <- NULL 
  rice_data$SurfaceWaterElev_m_levelNad83m <- NULL
  
  
  rice_data$Weekday <- factor( weekdays(rice_data$Date), 
                               ordered=TRUE, 
                               levels=c("Monday","Tuesday", "Wednesday", 
                                        "Thursday", "Friday", "Saturday", "Sunday"))
  
  return( rice_data %>%
            select( Date, Weekday, AirTemp, Rain, WindSpeed, everything() ) ) 
  
}


