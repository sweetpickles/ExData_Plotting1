d<-read.csv('Downloads/household_power_consumption.txt',sep=';',na.strings="?",stringsAsFactors = FALSE)

d2<-subset(d,Date == '1/2/2007' | Date == '2/2/2007')

hist(d2$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.copy(png,height=480,width=480,file='plot1.png')
dev.off()

