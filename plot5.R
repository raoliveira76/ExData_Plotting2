# Question #5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore 
# City?

setwd("./R_Language/Course_JohnHUniversity/04_ExploratoryDataAnalysis/Assignments/02")

# Check if the data set exist in the environment. If not, load the data.
if(!exists("NEI")) NEI <- readRDS("summarySCC_PM25.rds")
if(!exists("SCC")) SCC <- readRDS("Source_Classification_Code.rds")

# join the data sets and filter by short name (coal)
if(!exists("all.data")) all.data <- merge(NEI, SCC, "SCC")

# filter the data by "baltimore" and type
vehicle.data <- all.data[all.data$type == "ON-ROAD", ]
vehicle.data.Baltimore <- vehicle.data[vehicle.data$fips == "24510",]

vehicle.years.Baltimore <- aggregate(Emissions ~ year, vehicle.data.Baltimore, sum)

# create a image file and define some parameters
png(filename = "plot5.png")
par(mar = c(4,4,2,2), mfrow = c(1,1))

plot(vehicle.years.Baltimore$year, vehicle.years.Baltimore$Emissions, type = "l", 
     xlab = "Years", ylab = "PM2.5 Emissions (ton)", main = "Baltimore")

dev.off()