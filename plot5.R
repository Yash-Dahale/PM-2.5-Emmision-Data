##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(ggplot2)
library(RColorBrewer)

##Loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Sourcelassification_Code.rds")

## Subseting the data
BaltimoreMotor <- subset(NEI,NEI$fips == "24510" & NEI$type == "ON-ROAD")
Bagg <- aggregate(Emissions~year,BaltimoreMotor,sum)

##plot the graph
par(mar = c(4,4,2,1))
ggplot(Bagg, aes(year, Emissions)) +
  ggtitle(expression("Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  geom_line(col = "red") +
  geom_point(col = "red") +
  ylab(expression(~PM[2.5]~ "Motor Vehicle Emissions"))+
  xlab("Year") 
  
##save as png
png("plot5.png",width = 480,height = 480)
par(mar = c(4,4,2,1))
ggplot(Bagg, aes(year, Emissions)) +
  ggtitle(expression("Baltimore " ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) +
  geom_line(col = "red") +
  geom_point(col = "red") +
  ylab(expression(~PM[2.5]~ "Motor Vehicle Emissions"))+
  xlab("Year") 
dev.off()