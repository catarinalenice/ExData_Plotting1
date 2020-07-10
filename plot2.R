download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              "Electric power consumption")

unzip("Electric power consumption")

library("sqldf")
library("lubridate")

df <- read.csv.sql("household_power_consumption.txt", 
                   sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                   sep = ";"
)

df$Date <- strptime(paste(df$Date,df$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(x = df$Date, y = df$Global_active_power, 
     type = "solid",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

dev.off()