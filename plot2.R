d<-read.csv('Downloads/household_power_consumption.txt',sep=';',na.strings="?",stringsAsFactors = FALSE)

d2<-subset(d,Date == '1/2/2007' | Date == '2/2/2007')
d2$datetime <-as.POSIXct(strptime(paste(d2$Date,d2$Time),"%d/%m/%Y %H:%M:%S"))

plot(d2$Global_active_power ~ d2$datetime,type = 'l',ylab = "Global Active Power (kilowatts)",xlab=NA)

dev.copy(png,height=480,width=480,file='plot2.png')
dev.off()

