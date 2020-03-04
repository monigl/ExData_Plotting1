rm(list = ls())

setwd("C:/Users/Mónica García/Desktop/first_project/Project_1")

library(readr)
data <- read_delim("C:/Users/Mónica García/Desktop/first_project/Project_1/household_power_consumption.txt", ";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
View(data)

apply(is.na(data), 2, sum) ## Cantidad de NA por columna

newdata <- na.omit( subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02"))
newdata2 <- transform(newdata,fecha=as.POSIXct(paste(newdata$Date, newdata$Time)))
View(newdata2)


## gráfico 4

png(file = "plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(newdata2, {
  plot(fecha, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")
  plot(fecha, Voltage, type = "l",xlab = "datatime", ylab = "Voltage")
  plot(fecha, Sub_metering_1, type = "l",  xlab="", ylab = "Energy sub metering")
  lines(fecha, Sub_metering_2,col="red")
  lines(fecha, Sub_metering_3,col="blue")
  legend("topright", lty = c(1,1,1) , col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_3","Sub_metering_3"))
  plot(fecha, Global_reactive_power,type = "l",xlab = "datatime", ylab = "Global_reactive_power")
})
dev.off()
