#Import the data from a data file called "trees.csv" and store it in "trees". This data set provides measurements of the girth, height and volume of timber in 31 felled black cherry trees. Note that girth is the diameter of the tree (in inches) measured at 4 ft 6 in above the ground.
trees <- read.csv('trees.csv')
print(head(trees))

# **Output**:
# ```
#   Girth Height Volume
# 1   8.3     70   10.3
# 2   8.6     65   10.3
# 3   8.8     63   10.2
# 4  10.5     72   16.4
# 5  10.7     81   18.8
# 6  10.8     83   19.7
# ```

# To compute the regression plane we use the `lm()` function and assign the resulting data to `trees.lm`; in this example the dependent variable `Volume` will be modelled by the independent variables `Girth` and `Height`.
trees.lm <- lm(Volume ~ Girth + Height, data = trees) 

# To get the intercept and the coefficients of the regression model we use `coef()`.
trees.coef <- coef(trees.lm)
print(trees.coef)

# ---

# Fitted Values
# -------------


# The `fitted()` function computes the fitted values. In this case we will compute the fitted values for the first 4 entries in the data set
trees.fitted <- fitted(trees.lm)[1:4]
print(trees.fitted)

# **Output**:
# ```
#         1         2         3         4 
#  4.837660  4.553852  4.816981 15.874115
# ```

# ---

# Interpolation
# -------------

# Linear interpolation can be achieved with `predict()` to estimate some points not in the original data: (9.1, 69), (11.6, 74) and (12.5, 87). 
trees.interpolated <- predict(trees.lm, 
                              newdata = data.frame(Girth = c(9.1, 11.6, 12.5),
                                                  Height = c(69, 74, 87)))
print(trees.interpolated)

# **Output**:
# ```
#         1         2         3 
#  8.264937 21.731594 30.379205 
# ```

# ---

# Residuals
# ---------

# The residuals can be computed with `residuals()`.
trees.residuals <- residuals(trees.lm)
print(head(trees.residuals))

# **Output**:
# ```
#          1          2          3          4          5          6 
#  5.4623403  5.7461484  5.3830187  0.5258848 -1.0690084 -1.3183270 
# ```

# ---

# Standard Error
# --------------

# You can print a summary with several statistic measures from the linear regression model with the `summary()` functions. We can get the standard error directly out of the summary:
trees.se <- summary(trees.lm)$sigma
print(paste('Standard Error:', trees.se))

# **Output**:
# ```
# Standard Error: 3.88183203812714
# ```

# ---

# Plotting The Regression Plane
# -----------------------------

# To plot the regression plane the `scatterplot3d()` routine from the `scatterplot3d` library is used. Additionally, the fitted point are computed to draw dashed line segments from the points to the regression plane with the `segments()` function.

library(scatterplot3d)
s3dplot <- with(trees, scatterplot3d(Girth, Height, Volume, pch = 16, 
            highlight.3d = TRUE, angle = 55, 
            main = "Multiple Regression Model"))
s3dplot$plane3d(trees.lm, lty="solid") 
trees.fitted <- s3dplot$xyz.convert(trees$Girth, 
                                    trees$Height, 
                                    trees$Volume)
trees.predicted <- s3dplot$xyz.convert(trees$Girth, 
                                      trees$Height, 
                                      fitted(trees.lm))
segments(trees.fitted$x, 
         trees.fitted$y, 
         trees.predicted$x, 
         trees.predicted$y, 
         lty="dashed")           
