download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              "Electric power consumption")

unzip("Electric power consumption")

library("sqldf")

df <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                    sep = ";"
                  )

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hist(df$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"
     )

dev.off()
