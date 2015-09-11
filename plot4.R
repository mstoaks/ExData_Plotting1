#read in the whole shebang
household_power_consumption <- read.csv("~/Projects/CourseraDataScience/ExploratoryDataAnalysis/working/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

#work with a copy
hpc.orig <- household_power_consumption

#filter the rows we want for Feb 1 and Feb 2
targetDates = c("1/2/2007", "2/2/2007")
hpc.targetDates <- filter(hpc.orig, Date %in% targetDates)

#convert to data table
hpctable <- tbl_df(hpc.targetDates)

#merge the date/time strings
hpctable <- mutate(hpctable, DateTime = paste(Date, Time))

#convert the new column into a real date
hpctable$DateTime <- strptime(hpctable$DateTime, format="%d/%m/%Y %H:%M:%S")

#open a png device and plot everything
png("plot4.png")
old.par <- par(mfrow=c(2, 2))

#this makes graph (1,1)
plot(hpctable$DateTime, hpctable$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

#this makes graph (1,2)
plot(hpctable$DateTime, hpctable$Voltage, type="l", xlab="datetime", ylab="Voltage")

#this makes graph (2,1)
plot(hpctable$DateTime, hpctable$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpctable$DateTime, hpctable$Sub_metering_2, type="l", col="red")
lines(hpctable$DateTime, hpctable$Sub_metering_3, type="l", col="blue")
legend("topright", xjust=-1, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))

#this makes graph(2,2)
plot(hpctable$DateTime, hpctable$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


#cleanup
dev.off()
