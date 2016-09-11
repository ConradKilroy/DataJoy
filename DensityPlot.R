# The data is read from a csv (*comma separated value*) file. The data was collected at Baystate Medical Center, Springfield, Mass during 1986. The relevant columns for this example are `smoke`: smoking status during pregnancy, and `bwt`: birth weight in grams.

data <- read.csv("DensityPlot.csv")
data$smoke <- factor(data$smoke)  # convert numeric column to factor
print(head(data))                 # a glance at the data

# ---

# Colour-filled density plot
# --------------------------

# Now the library `ggplot` is imported to plot the data. The code below also shows how to plot two density functions and manually set the [colours](https://www.getdatajoy.com/learn/Colour_Names:_Complete_List), labels and title

library(ggplot2)

ggplot(data, aes(x=bwt,           # plot cumulative frequency of column "bwt"
  fill=smoke)) +                  # "smoke" column sets filling colour
  geom_density(alpha=.5)+         # transparency 
  ggtitle("Density plot") +       # title
  theme(plot.title = element_text(lineheight=.8, face="bold"))+ # font style
  scale_fill_manual(name="Child weight",                # legend title
    labels=c("smoking parents","non-smoking parents"),  # legend labels
    values=c("forestgreen", "purple1"))          # legend and plot colours

# ---

# Density plots with different line colours
# -----------------------------------------

# The next block of code plots the same data. Now the line width and line [colour](https://www.getdatajoy.com/learn/Colour_Names:_Complete_List) are customized


ggplot(data, aes(x=bwt,     # plot cumulative frequency of column bwt
  colour=smoke)) +          # "smoke" column sets the line colour
  geom_density(size=1.5)+   # line width
  scale_colour_brewer(palette = "Set1") # colour palette
