source("load.R")
plot2 <- function() {
  par(resetPar())
  
  plot(filtered_power_data$timestamp,filtered_power_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("plot2.png has been saved in", getwd())
}
plot2()