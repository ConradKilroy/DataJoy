# The data is read from a csv file, grouped in columns: Cultivar, Date, Weight, sd, n, se

cabbage_exp <- read.csv('cabbage.csv')
print(head(cabbage_exp))

# ---

# Stacked Bar Graph
# -----------------

# The routine `ddply` does a group-wise `transform`, splitting the data frame by `Date` to compute the hight of the labels, at the middle of each sub-bar. This will create a new data frame with an extra column: `label_hight`.

library(plyr)
cabbage_exp <- ddply(cabbage_exp, "Date", transform,
            label_hight=cumsum(Weight)-0.5*Weight)
print(head(cabbage_exp))

# Create the plot using `Date` on the x axis, `Weight` on the Y axis and the column `Cultivar` to determine the right colour

library(ggplot2)
ggplot(cabbage_exp, aes(x=Date, y=Weight, fill=Cultivar)) +
  geom_bar(stat="identity", colour='purple1') +     # contour colour
  guides(fill=guide_legend(reverse=TRUE)) +         # reverse legend
  geom_text(aes(y=label_hight, label=Weight),       # add labels
            colour="white") +                       # label colour
  scale_fill_brewer(palette="Paired")               # colour palette

# ---

# Stacked Bar Graph with proportional bars
# -----------------------------------------

# The routine `ddply` does a group-wise `transform`, splitting the data frame by `Date` to compute the percentages, the hight of the labels and the labels themselves. This will create a new data frame with three extra columns: `percent_weight`, `label_hight` and `labels`.

cabbage_exp <- ddply(cabbage_exp, "Date", transform,
            percent_weight = Weight / sum(Weight) * 100)

cabbage_exp <- ddply(cabbage_exp, "Date", transform,
                     label_hight=cumsum(percent_weight)-0.5*percent_weight)

cabbage_exp <- ddply(cabbage_exp, "Date", transform,
                     labels=paste(round(percent_weight, digits=2), '%'))

print(head(cabbage_exp))

# Create the plot using `Date` on the x axis, `percent_weight` on the Y axis and the column `Cultivar` to determine the right colour
ggplot(cabbage_exp, aes(x=Date, y=percent_weight, fill=Cultivar)) +
  geom_bar(stat="identity", colour='black') +       # contour colour
  guides(fill=guide_legend(reverse=TRUE)) +         # reverse legend
  geom_text(aes(y=label_hight, label=labels),       # add the labels
            colour="white") +                       # label colour
  scale_fill_brewer(palette="Set1")+                # colour palette
  xlab("Date")+                                     # x-axis label
  ylab("Weight %")+                                 # y-axis label
  ggtitle("Cabbage Exports")                        # plot title
