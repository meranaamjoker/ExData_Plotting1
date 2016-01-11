# download the file and unzip
if(!file.exists("household_power_consumption.txt")) {
  temp <- tempfile()
  download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
  file <- unzip(temp)
  unlink(temp)
} else {
  cat("Skipping file download")
}

if(!exists("filtered_power_data")) {
  power_data_for_house_hold_consumption <- read.table(file = "household_power_consumption.txt", header=T, sep=";")
  power_data_for_house_hold_consumption$Date <- as.Date(power_data_for_house_hold_consumption$Date, format="%d/%m/%Y")
  
  filtered_power_data <- power_data_for_house_hold_consumption[(power_data_for_house_hold_consumption$Date=="2007-02-01") | (power_data_for_house_hold_consumption$Date=="2007-02-02"),]
  filtered_power_data$Global_active_power <- as.numeric(as.character(filtered_power_data$Global_active_power))
  filtered_power_data$Global_reactive_power <- as.numeric(as.character(filtered_power_data$Global_reactive_power))
  filtered_power_data$Voltage <- as.numeric(as.character(filtered_power_data$Voltage))
  filtered_power_data <- transform(filtered_power_data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  filtered_power_data$Sub_metering_1 <- as.numeric(as.character(filtered_power_data$Sub_metering_1))
  filtered_power_data$Sub_metering_2 <- as.numeric(as.character(filtered_power_data$Sub_metering_2))
  filtered_power_data$Sub_metering_3 <- as.numeric(as.character(filtered_power_data$Sub_metering_3))
  
  rm ("power_data_for_house_hold_consumption")
} else {
  cat("Skipping readTable and filtering. Assuming data exists in variable 'filtered_power_data'")
}

resetPar <- function() {
  dev.new()
  op <- par(no.readonly = TRUE)
  dev.off()
  op
}