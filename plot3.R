# Question #3. Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 
# for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 
# plotting system to make a plot answer this question.

setwd("./R_Language/Course_JohnHUniversity/04_ExploratoryDataAnalysis/Assignments/02")
library(ggplot2);

# Check if the data set exist in the environment. If not, load the data.
if(!exists("NEI")) NEI <- readRDS("summarySCC_PM25.rds")

# separate and summarise the data to plot
NEI.Baltimore <- NEI[NEI$fips == "24510",]
baltimore.types <- aggregate(Emissions ~ type + year, NEI.Baltimore, sum)

# create a image file and define some parameters
png(filename = "plot3.png")
par(mar = c(4,4,2,2), mfrow = c(1,1))

qplot(x = year, y = Emissions, data = baltimore.types, geom = "line", color = type, xlab = "Years",
      ylab = "PM2.5 Emissions (ton)", main = "Emissions in the Baltimore (1999 - 2008)")

dev.off()