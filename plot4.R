# Question #4. Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?

setwd("./R_Language/Course_JohnHUniversity/04_ExploratoryDataAnalysis/Assignments/02")

# Check if the data set exist in the environment. If not, load the data.
if(!exists("NEI")) NEI <- readRDS("summarySCC_PM25.rds")
if(!exists("SCC")) SCC <- readRDS("Source_Classification_Code.rds")

# join the data sets and filter by short name (coal)
if(!exists("all.data")) all.data <- merge(NEI, SCC, "SCC")

coal.data <- all.data[grep("coal", all.data$Short.Name, ignore.case = TRUE), ]
coal.years <- aggregate(Emissions ~ year, coal.data, sum)

# create a image file and define some parameters
png(filename = "plot4.png")
par(mar = c(4,4,2,2), mfrow = c(1,1))

plot(coal.years$year, coal.years$Emissions, type = "l", xlab = "Years", 
     ylab = "PM2.5 Emissions (ton)", main = "Coal Combustion-related in the USA (1999 - 2008)")

dev.off()