# The data whose regression line we are about to compute and plot:
# ```
# speed  4  4  7  7  8  9 10 10 10 11 11 12 12 12 12 13 13 13 13 14 14 14 14 15 15 15 16 16 17 17 17 18 18 18 18 19 19 19 20 20 20 20 20 22 23 24 24 24 24 25
# dist  2  10   4  22  16  10  18  26  34  17  28  14  20  24  28  26  34  34  46 26  36  60  80  20  26  54  32  40  32  40  50  42  56  76  84  36  46  68 32  48  52  56  64  66  54  70  92  93 120  85
# ```

# Import the data from the data file *CarsData.csv* and store it in `cars`. The data give the speed of cars and the distances taken to stop. Note that the data were recorded in the 1920s.

cars <- read.csv("LinearRegressionModelCars.csv")
head(cars)

# To compute the linear regression we use the function `lm()` and store the resulting data in `cars.lr`. In this case `dist`, the dependent variable, is modelled by the independent variable `speed`.
cars.lr <- lm(dist ~ speed, data = cars)

# We can extract the intercept and slope of the regression line from `cars.lr` with `coef()`.
cars_coef <- coef(cars.lr)
print(cars_coef)

# **Output**:
# ```
# (Intercept)       speed 
#  -17.579095    3.932409
# ```

# Plotting the Regression Line
# ----------------------------

# The code below will create the scatter plot and add the regression line. We have to import the `ggplot2` library first.
library(ggplot2)
ggplot(cars, aes(x = speed, y = dist)) +        # data
  geom_point(shape=19, colour="darkorchid") +   # marker shape and colour
  geom_smooth(method = lm, se = FALSE) +        # add regression line
  ggtitle("Linear Regresion") +                 # title
  xlab("Speed") +                               # x-axis label
  ylab("Distance") +                            # y-axis label
  theme(                                        # background colour to "white"
    panel.border = element_blank(), 
    panel.background = element_rect(fill = 'white', colour = 'gray80')
    )

# ---

# Fitted Values
# -------------

# The function `fitted()` computes the fitted values.
cars_fitted <- fitted(cars.lr)[1:4]
print(cars_fitted)                       # print the firs 6 entries

# **Output**:
# ```
#         1         2         3         4         5         6 
# -1.849460 -1.849460  9.947766  9.947766 13.880175 17.812584 
# ```

# ---

# Interpolation
# -------------

#Linear interpolation for some points not in the original data (6, 8 and 21) can be computed with `predict()`:
cars_interpolated <- predict(cars.lr, newdata = data.frame(speed = c(6, 8, 21)))
print(cars_interpolated)

# **Output**:
# ```
#         1         2         3 
#  6.015358 13.880175 65.001489
# ```

# ---

# Residuals
# ---------

# The residuals can be computed with `residuals()`
cars_residuals <- residuals(cars.lr)
print(head(cars_residuals))

# **Output**:
# ```
#         1         2         3         4         5         6 
#  3.849460 11.849460 -5.947766 12.052234  2.119825 -7.812584
# ```

# ---

# Summary
# -------

# You can print a summary with several statistic measures from the linear regression with the `summary` function.
print(summary(cars.lr))

# ---

# Confidence Intervals
# --------------------

# It is possible to add the confidence intervals to the previous scatter plot using the extra parameters `level` and `fill` in the `geom_smooth()` function
ggplot(cars, aes(x = speed, y = dist)) + 
  geom_point(shape=19, colour="darkorchid") +
  geom_smooth(method = lm,
              level=0.95,               # confidence level
              fill="gray30"             # colour for the confidence interval
              ) +
  ggtitle("Linear Regresion") +
  xlab("Speed") +
  ylab("Distance") +
  theme(# background colour to "white"
    panel.border = element_blank(), 
    panel.background = element_rect(fill = 'white', colour = 'gray80')
    )

# ---

# Prediction Intervals
# --------------------

# If we want to plot the prediction intervals, this can be accomplished with the `ci.plot` function from the `HH` library.
library(HH) 
ci.plot(cars.lr)
