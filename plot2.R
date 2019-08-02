#set my working directory

setwd("C:/Data Science/jhudatascience")

#read full data file

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#create separate vector containing only date range we are interested in

data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

#format date

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")


# merge date and time into one column

datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Generate Plot 2
with(data1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})


## PNG output file
dev.copy(png, file="plot2.png", height=650, width=650)

## close graphics device
dev.off()




