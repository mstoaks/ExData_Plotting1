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



#let's make a plot
#hist(hpctable$Global_active_power, 12, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
plot(hpctable$DateTime, hpctable$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")


#copy to a png
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()
