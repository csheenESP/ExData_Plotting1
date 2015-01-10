setwd("c:/carlos/cursosjh/explordata/ejercicios/")

##Read the data
fich<-"household_power_consumption.txt"
con<-file(fich)
datos<-read.csv2(con)

## Select the dates to analyze and get them in a smaller object
b<-c("1/2/2007","2/2/2007")
dd<-datos[datos$Date %in% b,]

dd$Date<-as.character(dd$Date)

## Add a new column N with timestamp information
dd$Time<-as.character(dd$Time)
dd$N <-paste(dd$Date,dd$Time)
dd$N <- strptime(dd$N, "%d/%m/%Y %H:%M:%S")
## Convert the date to Date type
dd$Date<-as.Date(dd$Date,format="%d/%m/%Y")

## Convert the rest of the columns to numeric type 
dd$Global_active_power <- as.numeric(dd$Global_active_power)
dd$Global_reactive_power <- as.numeric(dd$Global_reactive_power)
dd$Voltage <- as.numeric(dd$Voltage)
dd$Global_intensity <- as.numeric(dd$Global_intensity)
setwd("c:/carlos/cursosjh/explordata/ejercicios/")

##Read the data
fich<-"household_power_consumption.txt"
con<-file(fich)
datos<-read.csv2(con)

## Select the dates to analyze and get them in a smaller object
b<-c("1/2/2007","2/2/2007")
dd<-datos[datos$Date %in% b,]


dd$Date<-as.character(dd$Date)

## Add a new column N with timestamp information
dd$Time<-as.character(dd$Time)
dd$N <-paste(dd$Date,dd$Time)
dd$N <- strptime(dd$N, "%d/%m/%Y %H:%M:%S")
## Convert the date to Date type
dd$Date<-as.Date(dd$Date,format="%d/%m/%Y")

## Convert the needed columns to numeric type 
dd$Global_active_power <- as.character(dd$Global_active_power)
dd$Global_active_power <- as.numeric(dd$Global_active_power)
dd$Sub_metering_1 <- as.character(dd$Sub_metering_1)
dd$Sub_metering_2 <- as.character(dd$Sub_metering_2)
dd$Sub_metering_3 <- as.character(dd$Sub_metering_3)
dd$Sub_metering_1 <- as.numeric(dd$Sub_metering_1)
dd$Sub_metering_2 <- as.numeric(dd$Sub_metering_2)
dd$Sub_metering_3 <- as.numeric(dd$Sub_metering_3)

## Open the destination device
png(file="plot2.png",width=480,height=480)
##Graphic 2
with(dd, plot(N,Global_active_power,ylab="Global Active Power (kilowatts)",type="n"))
lines(dd$N,dd$Global_active_power)

dev.off()

dd$Sub_metering_1 <- as.numeric(dd$Sub_metering_1)
dd$Sub_metering_2 <- as.numeric(dd$Sub_metering_2)
dd$Sub_metering_3 <- as.numeric(dd$Sub_metering_3)

## Open the destination device
png(file="plot3.png",width=480,height=480)
## Graphic 3
with(dd, plot(N,Sub_metering_1,ylab="Energy sub metering",type="n"))
lines(dd$N,dd$Sub_metering_1,col="black")
lines(dd$N,dd$Sub_metering_2,col="red")
lines(dd$N,dd$Sub_metering_3,col="blue")
legend("topright", pch = "-", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

## Generate the png file

dev.off()
