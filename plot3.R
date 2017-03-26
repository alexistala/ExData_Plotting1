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



png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE)

par(mfrow = c(1,1))
plot(c(0,2880), c(0,40),type="n", ylab = "Energy sub metering", xlab = "", 
     axes = FALSE, frame.plot = TRUE)
axis(1, at = c(0,1440,2880), labels=c("Thu","Fri","Sat"))
axis(2, at = c(0,10,20,30), labels=c(0,10,20,30))

with(hpc,points(hpc$Sub_metering_1, col="black", type = "l"))
with(hpc,points(hpc$Sub_metering_2, col="red", type = "l"))
with(hpc,points(hpc$Sub_metering_3, col="blue", type = "l"))
legend("topright", 
       c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1), pch = c(NA, NA, NA), merge = TRUE)

dev.off()
