#read in the whole shebang
household_power_consumption <- read.csv("~/Projects/CourseraDataScience/ExploratoryDataAnalysis/working/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

#work with a copy
hpc.orig <- household_power_consumption

#filter to keep only the days we want
targetDates = c("1/2/2007", "2/2/2007")
hpc.targetDates <- filter(hpc.orig, Date %in% targetDates)

#convert to data table
hpctable <- tbl_df(hpc.targetDates)

#merge the date/time
hpctable <- mutate(hpctable, DateTime = paste(Date, Time))

#correct to a real date
hpctable$DateTime <- strptime(hpctable$DateTime, format="%d/%m/%Y %H:%M:%S")

#let's make a plot!
plot(hpctable$DateTime, hpctable$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")


#copy to a png
dev.copy(png, "plot2.png", width=480, height=480)

#cleanup
dev.off()
