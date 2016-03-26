# Question #1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

setwd("./R_Language/Course_JohnHUniversity/04_ExploratoryDataAnalysis/Assignments/02")

# Check if the data set exist in the environment. If not, load the data.
if(!exists("NEI")) NEI <- readRDS("summarySCC_PM25.rds")

# separate and summarise the data to plot
all.years <- aggregate(Emissions ~ year, NEI, sum)

# create a image file and define some parameters
png(filename = "plot1.png")
par(mar = c(4,4,2,2), mfrow = c(1,1))

plot(all.years$year, all.years$Emissions, type = "l", xlab = "Years", ylab = "Total PM2.5 (ton)",
     main = "Emissions in the USA (1999 - 2008)")

dev.off()