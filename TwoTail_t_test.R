# Example problem to solve: 
# > The mean weight of King Penguins found in an Antarctic colony last year was 15.4 kg. In a sample of 25 penguins the same time this year in the same colony, the mean penguin weight is 14.9 kg. The sample standard deviation is 2.5 kg. At 0.05 significance level, can we accept or reject the null hypothesis that the mean penguin weight does not differ from last year

# To compute `t` the formula to use is: t = (sample mean - population mean)/(sample standard deviation / square root of the sample size))

sample.mean <- 14.9        
population.mean <- 15.4
standard.deviation <- 2.5
n <- 25
alpha <- 0.05

t <- (sample.mean - population.mean) / (standard.deviation / sqrt(n)) 
print(paste("t statistic:", t))

# **Output**:
# ```
# t statistic: -1
# ```

# Now to create the corresponding plot we draw a random sample between -4 and 4 and assign the corresponding sequence to `hx`, we also compute the critical value with `qt()`.

minx <- -4
maxx <- 4

x <- seq(minx, maxx, length = 100)
hx <- dt(x, df = n-1)

crtclvalue.right = qt(1-alpha/2, df = n-1)
crtclvalue.left = -crtclvalue.right

#Set up the plot, highlighting the critical region in purple 
plot(x, hx, type="n", 
     xlab = "Critical Region", ylab = "",           # axes labels
     main = paste("Student's t Distribution\n",     # title
                  n-1, "degrees of freedom"), 
     axes = FALSE)                                  # switch axes off

lines(x, hx)                # plots the Student's t distribution

i <- x >= crtclvalue.right  # points in the right rejection zone 
polygon(c(crtclvalue.right, x[i], maxx), c(0, hx[i], 0), col = "purple")

j <- x <= crtclvalue.left   # points in the left rejection zone
polygon(c(minx, x[j], crtclvalue.left), c(0, hx[j], 0), col = "purple") 

axis(1, pos = 0,              # tick marks
     at = c(t, crtclvalue.left, crtclvalue.right, minx, 0, maxx), 
     labels = format(c(t, 
                       crtclvalue.left, 
                       crtclvalue.right, 
                       minx, 0, maxx), digits=2)
     )

# `t` is outside the critical region, hence we accept the null hypothesis.


# ---

# A quicker method to determine if the null hypothesis has to be rejected is to compute the corresponding p-value by means of pt():

pvalue <- pt(t, df = n-1)
print(paste("p-value:", pvalue))

# **Output**:
# ```
# p-value: 0.1636434
# ```

# Since the p-value is in the acceptance zone, the interval (-alpha/2, alpha/2) the null hypothesis is accepted.
