plot4 <- function() {
  par(resetPar())
  
  par(mfrow=c(2,2))
  
  ##PLOT 1
  plot(filtered_power_data$timestamp,filtered_power_data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  ##PLOT 2
  plot(filtered_power_data$timestamp,filtered_power_data$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##PLOT 3
  plot(filtered_power_data$timestamp,filtered_power_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(filtered_power_data$timestamp,filtered_power_data$Sub_metering_2,col="red")
  lines(filtered_power_data$timestamp,filtered_power_data$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
  
  #PLOT 4
  plot(filtered_power_data$timestamp,filtered_power_data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  #OUTPUT
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("plot4.png has been saved in", getwd())
}
plot4()