# The data is read from a csv file. It contains information about airports all around the world. The columns `lon` and `lat` will be used to plot the points over the map.
airports <- read.csv("airports.dat", header = FALSE)
colnames(airports) <- c("ID", "name", "city", "country", "IATA_FAA", "ICAO",
                        "lat", "lon", "altitude", "timezone", "DST")
print( head(airports[c('city', 'lon', 'lat')]))

# Now the `rworldmap` is imported and a new map in `high` resolution is saved to `newmap`. Other possible resolutions are: `high`, `coarse`, and `li` which stands for *less islands*.
library(rworldmap)
newmap <- getMap(resolution = "low")

# Set the longitude - latitude limits for the map, `asp` is the aspect ratio.
plot(newmap, xlim = c(-20, 59), ylim = c(45, 71), asp = 1)

# Plot the points, setting the colour to `Purple` and the point size to `.4`
points(airports$lon, airports$lat, col = "Purple", cex = .4)
