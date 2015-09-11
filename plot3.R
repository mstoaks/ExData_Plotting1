#read in the whole shebang
household_power_consumption <- read.csv("~/Projects/CourseraDataScience/ExploratoryDataAnalysis/working/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

hpc.orig <- household_power_consumption

targetDates = c("1/2/2007", "2/2/2007")
hpc.targetDates <- filter(hpc.orig, Date %in% targetDates)

#convert to data table
hpctable <- tbl_df(hpc.targetDates)

#Merge the date/time
hpctable <- mutate(hpctable, DateTime = paste(Date, Time))

hpctable$DateTime <- strptime(hpctable$DateTime, format="%d/%m/%Y %H:%M:%S")



#let's make a plot - this time I could not simply use dev.copy() because then the legend got shifted 
#out of place when things were reduced. instead, am using the png device directly.

png("plot3.png")
plot(hpctable$DateTime, hpctable$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpctable$DateTime, hpctable$Sub_metering_2, type="l", col="red")
lines(hpctable$DateTime, hpctable$Sub_metering_3, type="l", col="blue")
legend("topright", xjust=-1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1))

dev.off()
