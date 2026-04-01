# 1. DATA LOADING AND CLEANING
# Assumes the file is in your working directory. Use na.strings to handle '?'
full_df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                      na.strings = "?", stringsAsFactors = FALSE)

# Subset for the two specific days: Feb 1st and 2nd, 2007
df <- full_df[full_df$Date %in% c("1/2/2007","2/2/2007"), ]

# Create a unified DateTime object (crucial for time-series axes)
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

# --- PLOT 3: Energy Sub Metering ---
png("plot3.png", width=480, height=480)
plot(df$DateTime, df$Sub_metering_1, type="l", col="black", xlab="", 
     ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

