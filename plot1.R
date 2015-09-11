#read in the whole shebang
household_power_consumption <- read.csv("~/Projects/CourseraDataScience/ExploratoryDataAnalysis/working/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)


targetDates = c("1/2/2007", "2/2/2007")
hpc.targetDates <- filter(hpc.orig, Date %in% targetDates)

#convert to data table
hpctable <- tbl_df(hpc.targetDates)

#convert the Data variable to a date
hpctable$Date <- as.Date(hpc.targetDates$Date, format="%d/%m/%Y")

#convert the Time variable to a time

#hpc.short.dates <- strptime(hpc.short, format="%d/%m/%Y")
#the above adds a year to the time....
#maybe i should combine the year and time into another column and then convert it using as.Date or some such....

#convert the data to numerics

hpctable$Global_active_power = as.numeric(hpctable$Global_active_power)
hpctable$Global_reactive_power = as.numeric(hpctable$Global_reactive_power)
hpctable$Voltage = as.numeric(hpctable$Voltage)
hpctable$Global_intensity = as.numeric(hpctable$Global_intensity)
hpctable$Sub_metering_1 = as.numeric(hpctable$Sub_metering_1)
hpctable$Sub_metering_2 = as.numeric(hpctable$Sub_metering_2)

#let's make a histogram!
hist(hpctable$Global_active_power, 12, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

#copy to a png
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
