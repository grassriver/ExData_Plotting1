data<-read.table("household_power_consumption.txt",sep=";", header=TRUE)
filtered <- data[as.Date(data$Date, "%d/%m/%Y") %in% as.Date(c('2007-02-01', '2007-02-02')),]
global<-as.character(filtered$Global_active_power)
global<-as.numeric(global)
hist(global,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
library(datasets)
dev.copy(png, file = "plot1.png")
dev.off()
