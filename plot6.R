# Question 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from 
# motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen
# greater changes over time in motor vehicle emissions?

setwd("./R_Language/Course_JohnHUniversity/04_ExploratoryDataAnalysis/Assignments/02");
library(quantmod);

# Check if the data set exist in the environment. If not, load the data.
if(!exists("NEI")) NEI <- readRDS("summarySCC_PM25.rds")
if(!exists("SCC")) SCC <- readRDS("Source_Classification_Code.rds")

# join the data sets and filter by short name (coal)
if(!exists("all.data")) all.data <- merge(NEI, SCC, "SCC")

# filter the data by "baltimore", "los angeles" and type
vehicle.data <- all.data[all.data$type == "ON-ROAD", ]
vehicle.data.Baltimore <- vehicle.data[vehicle.data$fips == "24510",]
vehicle.data.LosAngeles <- vehicle.data[vehicle.data$fips == "06037",]

vehicle.years.Baltimore <- aggregate(Emissions ~ year, vehicle.data.Baltimore, sum)
vehicle.years.LosAngeles <- aggregate(Emissions ~ year, vehicle.data.LosAngeles, sum)
vehicle.years.joined <- merge(vehicle.years.Baltimore, vehicle.years.LosAngeles, "year")

# range of the results
rng <- range(c(vehicle.years.joined$Emissions.x, vehicle.years.joined$Emissions.y))

# create a image file and define some parameters
png(filename = "plot6.png")
par(mar = c(4,4,2,2), mfrow = c(1,2))

plot(vehicle.years.joined$year, vehicle.years.joined$Emissions.x, type = "l", 
     xlab = "Years", ylab = "PM2.5 Emissions (ton)", ylim = rng, main = "Baltimore")

plot(vehicle.years.joined$year, vehicle.years.joined$Emissions.y, type = "l", 
     xlab = "Years", ylab = "PM2.5 Emissions (ton)", ylim = rng, main = "Los Angeles")

dev.off()