scc_pm25 <- readRDS("summarySCC_PM25.rds")
sourceCC <- readRDS("Source_Classification_Code.rds")

head(scc_pm25)
str(scc_pm25)

head(sourceCC)
str(sourceCC)

yearSum <- aggregate(scc_pm25$Emissions, by = list(scc_pm25$year), FUN = sum)
yearSum

names(yearSum)[1] <- "year"
names(yearSum)[2] <- "total_emissions"
yearSum


plot(yearSum$year, yearSum$total_emissions, xlab = "Year", ylab = "Total Emissions", 
     col = "blue", type = "l")

dev.copy(png, file = "plot1.png", width = 480, height = 480)

dev.off()