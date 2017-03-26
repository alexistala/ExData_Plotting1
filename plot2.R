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




png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

par(mfrow = c(1,1))

with(hpc, plot(Global_active_power,  type = "l", xlim = c(0,2880), ylim = c(0,8),
               ylab = "Global Active Power (kilowatts)", xlab = "", 
               axes = FALSE, frame.plot = TRUE))
axis(1, at = c(0,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at = c(0,2,4,6), labels=c(0,2,4,6))

dev.off()