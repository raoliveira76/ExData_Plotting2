# Question #2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering 
# this question.

setwd("./R_Language/Course_JohnHUniversity/04_ExploratoryDataAnalysis/Assignments/02")

# Check if the data set exist in the environment. If not, load the data.
if(!exists("NEI")) NEI <- readRDS("summarySCC_PM25.rds")

# separate and summarise the data to plot
NEI.Baltimore <- NEI[NEI$fips == "24510",]
baltimore.years <- aggregate(Emissions ~ year, NEI.Baltimore, sum)

# create a image file and define some parameters
png(filename = "plot2.png")
par(mar = c(4,4,2,2), mfrow = c(1,1))

plot(baltimore.years$year, baltimore.years$Emissions, type = "l", xlab = "Years", 
     ylab = "PM2.5 Emissions (ton)", main = "Emissions in the Baltimore (1999 - 2008)")

dev.off()