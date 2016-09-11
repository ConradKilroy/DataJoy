# Basic ggplot2 Bar Graph
# -----------------------

# The first step is to import the **ggplot2** library
library(ggplot2)

# The data is read from a csv file (*comma separated values*). The data is stored in four columns: Id, values, frequency, group.
data <- read.csv("AdvancedBarCharts.csv",
                 row.names = 1  # read the row names from the first column
                 )

# The next code adds a column of boolean values: `TRUE` if `values` is positive, `FALSE` if `values` is negative. Then the first 6 entries in `data` are printed.
data$pos <- data$values >= 0    
print(head(data))                                                      

# Basic usage of `ggplot`, a general purpose plotting command. The important part here is the parameter `geom_bar` which configures the *aesthetics* of the plot. 
ggplot(data, aes(x = id, y = frequency)) + 
        geom_bar(stat = "identity", 
                 fill = "darkorchid",     # bar colour
                 colour = "black",        # colour of the bar contour
                 size = 0.5               # width of the contour line
                 ) +
        xlab("Id's") +                    # x axis label
        ylab("Frecuencies") +             # y axis label
        ggtitle("Bar Chart\nbasic usage") # title

# ---        

# Bar Graph with negative values
# ------------------------------

# This example shows how to plot a bar graph with positive and negative values to create an easier to interpret output. Now the columns `id` and `values` will be plotted using the boolean `pos` to set the colours.
ggplot(data, aes(x = id, y = values, fill = pos)) +
    geom_bar(stat = 'identity', 
             position = 'identity', 
             colour = 'black',        # contour around each bar
             size = 0.7               # width of the contour line
             ) +
    scale_fill_manual(
             values = c("forestgreen", "darkorchid"), # bar colours 
             guide = FALSE                       # disables legend
             ) +
             ggtitle("Bar Chart\n negative values") + # title
             theme(plot.title = element_text(lineheight=.8, face="bold"))

# ---             

# Bar Graph wtih several variables
# --------------------------------

# This example shows how to plot several variables in a bar chart. The bars will have different colours depending on the variable. Only the first 8 rows from the previous examples will be used here, they are stored in the `data2` data frame:

data2 = data[1:8,]              # save a smaller sample
Group <- factor(data2$group)    # discrete list from numeric column "group"


# the plot is created by `ggplot` using `fill` and `scale_fill_manual` to set the colours of the bars.
ggplot(data2, aes(x=id, y=frequency, fill=Group)) + 
        geom_bar(position="dodge",      # prevents overlapping
                 stat = "identity",
                 colour="black",
                 size=0.5
                 ) +
        scale_fill_manual(values=c("chartreuse4", "firebrick3", "darkorchid1"))+
        geom_text(aes(label=frequency),  # bar labels from "frequency" column
                  vjust=1.5,             # smaller = higher, negatives allowed
                  colour="white",        # font colour
                  size=5                 # font size
                  )+
        xlab("Id's") +                   # x axis label 
        ylab("Frecuencies")              # y axis label
