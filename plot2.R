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

## Open the destination device
png(file="plot2.png",width=480,height=480)
##Graphic 2
with(dd, plot(N,Global_active_power,ylab="Global Active Power (kilowatts)",type="n"))
lines(dd$N,dd$Global_active_power)

dev.off()
