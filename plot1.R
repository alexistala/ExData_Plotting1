dirpath <- "E:/Users/User/Moje dokumenty/Coursera/Exploratory Data Analysis"
setwd(dirpath)
filepath <- paste0(dirpath,"/household_power_consumption.txt")

library(readr)
library(dplyr)
library(tidyr)

hpc <- read_delim(filepath, ";", escape_double = FALSE, 
                  locale = locale(time_format = ""), 
                  na = "?", trim_ws = TRUE) %>%
  mutate(Date = format(as.Date(Date, "%d/%m/%Y"),"%Y-%m-%d"),
         Time = format(strptime(Time, "%H:%M:%S"),"%H:%M:%S")) %>% 
  filter(Date>="2007-02-01", Date<="2007-02-02")



png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

par(mfrow = c(1,1))

with(hpc,hist(Global_active_power, main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)", ylim=c(0,1200), col ="red"))

dev.off()
