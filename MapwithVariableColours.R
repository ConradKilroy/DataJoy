# The code below imports the `maps` library which contains the information to render many maps: `state` (states in the US), `county` (counties of the US), `france`, `italy`, `nz`, `usa`, `world` and `world2`.

# The routine `map_data()` from the `ggplot2` library loads the data to be plotted later.

library(maps) 
library(ggplot2)
states_map <- map_data("state")
print(head(states_map))

# The next lines read the data about crimes in the US from a csv file, the first column (US state names) is used to label the rows.
USArrests <- read.csv('usarrests.dat', row.names = 1)
print(head(USArrests))

# Now we add a column with the lowercase version of the row names to match the names in the map, which are lowecase too.

crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
print(head(crimes))

# Now the map is plotted by `ggplot`, use the column `Murder` to fill the map, the states in purple have lower murder rates, the states in red have higher murder rates. The map projection used is set to *polyconic* by `coord_map()`, but there are [many others listed in the mapproj documentation](http://cran.r-project.org/web/packages/mapproj/mapproj.pdf).
# 
# The routine `theme()` at the bottom deletes the background grid, axes labels, tick marks, etc for a clean output.

ggplot(crimes, aes(map_id = state, fill=Murder)) +
geom_map(map = states_map, colour="black") +     # state border colour
scale_fill_gradient2(                            # create a gradient scale
                     low="#9A47FF",  
                     mid="grey90",   
                     high="#FF6047", 
                     midpoint=median(crimes$Murder)) + # median as midpoint
expand_limits(x = states_map$long, y = states_map$lat) +
coord_map("polyconic") +                               # projection
theme(
  panel.border = element_blank(), 
  panel.grid.major = element_blank(), 
  panel.grid.minor = element_blank(), 
  axis.line = element_blank(),
  axis.ticks = element_blank(), 
  axis.text.y = element_blank(),
  axis.text.x = element_blank(),
  axis.title.x=element_blank(),
  axis.title.y=element_blank(),
  panel.background = element_rect(fill = 'white', colour = 'white')
)
