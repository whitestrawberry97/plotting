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

png("plot3.png", width = 480, height = 480)
plot(data_new$Time, data_new$Sub_metering_1, type = 'l', xlab = "\n", ylab = 'Energy sub metering')
lines(data_new$Time, data_new$Sub_metering_2, type = 'l', col = 'red')
lines(data_new$Time, data_new$Sub_metering_3, type = 'l', col = 'blue')
legend('topright', inset = 0.00, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)
dev.off()
