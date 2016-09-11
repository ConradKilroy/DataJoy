
# The first step is to import the **ggplot2** library and read the data from a csv (*comma separated values*) file. The data has 4 columns: `sex, ageYear, heightIn, weightLb`.
library(ggplot2)

data <- read.csv("ScatterPlot.csv")
print(head(data))

# ---

# Scatter Plot, customized point size and colour 
# ----------------------------------------------

# In this example the colour and size of the markers are used as additional dimensions, they are determined by the columns `sex` and `weightLb`.
ggplot(
      data, aes(x = ageYear, y = heightIn, # data to plot
      size = weightLb,            # size determined by "weightLb"
      colour = sex)               # colour determined by "sex" 
      ) +            
geom_point(alpha = .7) +           # data points translucent
scale_size_area() +                # area proportional to numeric value
scale_colour_brewer(palette = "Dark2")  # colour palette

# ---
 
# Scatter Plot, customized marker shape and colour
# ------------------------------------------------

# In this example the marker shape is used as additional dimension. Regression lines for both categories in the `sex` column are added with the `stat_smooth` command. The last command removes the background grid from the plot
ggplot(
      data, aes(x = ageYear, y = heightIn, 
      shape = sex,        # marker shape determined by "sex" 
      colour = sex)       # colour colour determined by "sex"
      ) +    
geom_point(size = 1.2) +                # marker size
scale_shape_manual(values = c(1,2)) +   # shape of the markers
scale_colour_brewer(palette = "Set1") + # set the colour palette
stat_smooth(
            method=lm,                # add regression line
            level=0.99,               # confidence level
            fill="darkolivegreen"     # colour for the confidence intervals
            ) +
theme(# remove the background grid and change the background colour to "white"
      panel.border = element_blank(), 
      panel.grid.major = element_blank(), 
      panel.grid.minor = element_blank(), 
      axis.line = element_line(colour = "black"),
      panel.background = element_rect(fill = 'white', colour = 'white')
      )
