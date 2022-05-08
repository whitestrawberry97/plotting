library(data.table)
library(tidyverse)
library(lubridate)
Sys.setlocale("LC_ALL","English")
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?") %>%
    filter(Date %in% c('1/2/2007', '2/2/2007'))


data_new <- data %>%
    as.data.frame() %>%
    mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
    mutate(Time = paste(Date, Time)) 

data_new$Time <-  (strptime(data_new$Time, "%Y-%m-%d %H:%M:%S"))

png("plot1.png", width = 480, height = 480)
hist(data_new$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()
