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

png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(x = df$Date, y = df$Sub_metering_1,
     type = "solid",
     ylab = "Energy sub metering",
     xlab = "")

lines(x = df$Date, y = df$Sub_metering_2,
     col = "red")

lines(x = df$Date, y = df$Sub_metering_3,
     col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), pch = "____"
       )

dev.off()