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



## gráfico 2

png(file = "plot2.png", width=480, height=480)
plot(newdata2$fecha, newdata2$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")
dev.off()
