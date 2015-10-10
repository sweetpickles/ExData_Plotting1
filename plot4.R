d<-read.csv('Downloads/household_power_consumption.txt',sep=';',na.strings="?",stringsAsFactors = FALSE)

d2<-subset(d,Date == '1/2/2007' | Date == '2/2/2007')
d2$datetime <-as.POSIXct(strptime(paste(d2$Date,d2$Time),"%d/%m/%Y %H:%M:%S"))

sm <- 8:9
co <- c('red','blue')

par(mfrow=c(2,2))
plot(d2$Global_active_power ~ d2$datetime, type = 'l', ylab='Global Active Power',xlab=NA)
plot(d2$Voltage ~ d2$datetime, type = 'l', ylab='Voltage',xlab='datetime')
plot(d2[[7]] ~ d2$datetime,type = 'l',ylab = "Energy sub metering",xlab=NA)
for (i in 1:2) {
  lines(d2[[sm[i]]] ~ d2$datetime, col = co[i], type = 'l')
}
legend('topright',colnames(d2)[7:9],col=c('black',co),lty = 1, bty = 'n')
plot(d2$Global_reactive_power ~ d2$datetime, type = 'l',ylab='Global_reactive_power',xlab='datetime')

dev.copy(png,height=480,width=480,file='plot4.png')
dev.off()