# Example problem to solve: 
# > A manufacturer claims that the mean lifetime of a light bulb is more than 10,000 hours. In a sample of 29 light bulbs, it was found that they only last 9,940 hours on average. Assuming that the standard deviation of the sample is 120 hours. At 0.05 significance level,  can we accept the claim by the manufacturer?

# To compute `t` the formula to use is: t = (sample mean - population mean)/(sample standard deviation / square root of the sample size))

sample.mean <- 9940        
population.mean <- 10000
standard.deviation <- 120
n <- 29
alpha <- 0.05

t <- (sample.mean - population.mean) / (standard.deviation / sqrt(n)) 
print(paste("t statistic:", t))

# **Output**:
# ```
# t statistic: -2.69258240356725
# ```

# Now to create the corresponding plot we draw a random sample between -4 and 4 and assign the corresponding sequence to `hx`, we also compute the critical value with `qt()`.

minx <- -4
maxx <- 4

x <- seq(minx, maxx, length = 100)
hx <- dt(x, df = n-1)

critical.value = -qt(1-alpha, df = n-1)

#Set up the plot, highlighting the critical region in purple 
plot(x, hx, type="n", 
     xlab = "Critical Region", ylab = "",           # axes labels
     main = paste("Student's t Distribution\n",     # title
                  n-1, "degrees of freedom"), 
     axes = FALSE)                                  # switch axes off

lines(x, hx)                # plots the Student's t distribution

j <- x <= critical.value    # points in the rejection zone
polygon(c(minx, x[j], critical.value), c(0, hx[j], 0), col = "purple") 

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
# p-value: 0.00591747187590265
# ```

# Since the p-value is less than alpha the null hypothesis is rejected.
