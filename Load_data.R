# Leer el dataset
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, sep=";", na.strings="?", 
                   stringsAsFactors=FALSE)

# Convertir la columna Date a formato de fecha
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filtrar solo las fechas requeridas
subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Crear columna DateTime combinando Date y Time
subset$DateTime <- strptime(paste(subset$Date, subset$Time), "%Y-%m-%d %H:%M:%S")
