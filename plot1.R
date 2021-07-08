library(ggplot2)
library(RColorBrewer)

##Loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##NEI data
str(NEI)

##SCC data
str(SCC)

##Question 1
## Calculation overall emission in every year
Emissions_per_year <- aggregate(Emissions~year,NEI,sum)
Emissions_per_year

##Plot the graph
par(mar = c(4,5,2,1))
plot(Emissions_per_year$year,Emissions_per_year$Emissions,
     type = "o",xlab = "Year", 
     ylab = expression("Total US "~PM[2.5] ~ "Emissions"),
     main = expression("Total US"~ PM[2.5] ~"Emissions by year"),
     col = "blue")

##Save the graph as plot1.png
png("plot1.png",width = 480,height = 480)
par(mar = c(4,5,2,1))
plot(Emissions_per_year$year,Emissions_per_year$Emissions,
     type = "o",xlab = "Year", 
     ylab = expression("Total US "~PM[2.5] ~ "Emissions"),
     main = expression("Total US"~ PM[2.5] ~"Emissions by year"),
     col = "blue")
dev.off()