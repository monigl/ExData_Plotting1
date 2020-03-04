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


## gráfico 3

png(file = "plot3.png", width=480, height=480)
plot(newdata2$fecha, newdata2$Sub_metering_1, type = "l",  xlab="", ylab = "Energy sub metering")
lines(newdata2$fecha, newdata2$Sub_metering_2,col="red")
lines(newdata2$fecha, newdata2$Sub_metering_3,col="blue")
legend("topright", lty = c(1,1,1) , col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_3","Sub_metering_3"))
dev.off()
