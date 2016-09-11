# Example problem to solve:
# > A food label on a cookie bag states that there is at most 2 grams of saturated fat in a single cookie. In a sample of 22 cookies, it is found that the mean ammount of saturated fat per cookie is 2.15 grams. The sample standard deviation is 0.25 grams. At 0.5 significance level, can we reject the claim on the food label?

# To compute `t` the formula to use is: t = (sample mean - population mean)/(sample standard deviation / square root of the sample size))

sample.mean <- 2.15
population.mean <- 2
standard.deviation <- 0.25
n <- 22
alpha <- 0.05

t <- (sample.mean - population.mean) / (standard.deviation / sqrt(n)) 
print(paste("t statistic:", t))

# **Output**:
# ```
# t statistic: 2.81424945589406
# ```

# Now to create the corresponding plot we draw a random sample between -4 and 4 and assign the corresponding sequence to `hx`, we also compute the critical value with `qt()`.

minx <- -4
maxx <- 4

x <- seq(minx, maxx, length = 100)
hx <- dt(x, df = n-1)

critical.value = qt(1-alpha, df = n-1)

#Set up the plot, highlighting the critical region in purple 
plot(x, hx, type="n", 
     xlab = "Critical Region", ylab = "",           # axes labels
     main = paste("Student's t Distribution\n",     # title
                  n-1, "degrees of freedom"), 
     axes = FALSE)                                  # switch axes off

lines(x, hx)                # plots the Student's t distribution

i <- x >= critical.value  # points in the rejection zone 
polygon(c(critical.value, x[i], maxx), c(0, hx[i], 0), col = "purple")

axis(1, pos = 0,              # tick marks
     at = c(t, critical.value, minx, 0, maxx), 
     labels = format(c(t, 
                       critical.value, 
                       minx, 0, maxx), digits=2)
     )

# `t` is inside the critical region, hence we reject the null hypothesis.


# ---

# A quicker method to determine if the null hypothesis has to be rejected is to compute the corresponding p-value by means of pt():

pvalue <- pt(t, df = n-1)
print(paste("p-value:", pvalue))

# **Output**:
# ```
# p-value: 0.0.994803985391255
# ```

# Since the p-value is greater than 1-alpha the null hypothesis is rejected.
