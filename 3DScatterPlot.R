# 3d scatter plot with R
# ----------------------

# This command imports the `scatterplot3d` library.
library("scatterplot3d")

# The data is read from a csv (*comma separated values*) file. The columns in the data frame are labelled *first*, *second*, *third* and *fourth* 
data <- read.csv("scatterdata.csv",
                  comment.char = "#",
                  sep = "\t",
                  col.names = c("first", "second", "third", "fourth"),
                  )

# The command `head()` prints the first 6 entries from the data frame
print(head(data))

# Simple usage of `scatterplot3d`:
scatterplot3d(data[1:3],                # data, plot the columns 1 to 3
              main = "3D Scatter Plot", # title
              pch=20,                   # draws solid circles
              highlight.3d = TRUE,      # enables "depth colouring"
              type = "h",               # p:points l:lines h:hight lines
              angle = 45,               # angle of the camera
              )

# ---
# The next example shows how to plot two additional dimensions. You can set different marks and different colours for the points by means of the parameters `pch` (plotting character) and `colour`, respectively.

splot <- scatterplot3d(data$first, data$second, data$third, # data
              main = "3D Scatter Plot", # title
              xlab = "First",           # x label
              ylab = "Second",          # y label   
              zlab = "Third",           # z label
              pch = data$fourth,        # the "fourth" column for the marks
              color = data$fourth,      # the "fourth" column for the colours
              angle = 45,               # angle of the camera
)

# Now, the command `legend` adds a small box on the top-left corner
legend(splot$xyz.convert(-2, 0, 16),  # convert the coordinates
      pch = 1:3,                     # select the marks to print
      yjust = -3.5,                  # set vertical alignment
legend = c("dogs", "hogs", "frogs"))  # labels
