library(ggplot2)
library(RColorBrewer)

##Loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Sourcelassification_Code.rds")

## Subseting the data
Baltimore <- subset(NEI,NEI$fips == "24510")

##Calculating emission trend in Baltimore
total_Baltimore <- aggregate(Emissions~year,Baltimore,sum)
total_Baltimore

##plot the graph
par(mar = c(4,5,2,1))
plot(total_Baltimore$year,total_Baltimore$Emissions,
     xlab = "Year", 
     ylab = expression("Total Baltimore " ~PM[2.5]~"Emissions"),
     main = expression("Total Baltimore " ~PM[2.5]~"Emissions by year"),
     type = "o",col = "red")

##save the graph as plot2.png
png("plot2.png",width = 480,height = 480)
par(mar = c(4,5,2,1))
plot(total_Baltimore$year,total_Baltimore$Emissions,
     xlab = "Year", 
     ylab = expression("Total Baltimore " ~PM[2.5]~"Emissions"),
     main = expression("Total Baltimore " ~PM[2.5]~"Emissions by year"),
     type = "o",col = "red")
dev.off()
