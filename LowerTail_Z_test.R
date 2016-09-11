# Example to solve: 
# > A manufacturer claims that the mean lifetime of a light bulb is more than 10,000  hours. In a sample of 30 light bulbs, it was found that they only last 9,940 hours on average. Assuming that the standard deviation is 120 hours. At 0.05 significance level,  can we accept the claim by the manufacturer?

# To compute z is straightforward, we use the formula z = (sample mean - population mean)/(standard deviation / square root of the sample size)

sample.mean <- 9940          
population.mean <- 10000         
standard.deviation <- 120        
n <- 30
alpha <- 0.05

z <- (sample.mean - population.mean) / (standard.deviation / sqrt(n)) 
print(paste("z statistic:", z))

# **Output**:
# ```
# z statistic: -2.73861278752583
# ```

# Now to create the corresponding plot we draw a normal random sample between -4 and 4 and assign the corresponding sequence to hx, we also compute the critical value with `qnorm()`.
minx = -4
maxx = 4

x <- seq(minx,maxx,length=100)
hx <- dnorm(x)

critical.value = -qnorm(1-alpha) 

# Set up the plot, highlighting the critical region in purple.
plot(x, hx, type="n", 
     xlab="Critical Region", ylab="",                       # axes labels
     main="Normal Distribution",                            # title
     axes=FALSE)                                            # switch axes off


lines(x, hx)                    # plots the standard distribution

i <- x <= critical.value        # points in the rejection region
polygon(c(minx, x[i], critical.value), c(0, hx[i], 0), col="purple")

axis(1, pos=0,                  # tick marks
     at = c(z, critical.value, minx, 0, maxx), 
     labels = format(c(z, critical.value, minx, 0, maxx), digits=2))

# z is in the critical region, hence we reject the null hypothesis.


# ---

# A quicker method to determine if the null hypothesis has to be rejected is to compute the corresponding *p-value* by means of `pnorm()`:

pvalue <- pnorm(z)
print(paste("p-value:", pvalue))

# **Output**:
# ```
# p-value: 0.00308494966027208
# ```

# Since the p-value is less than alpha the null hypothesis is rejected.
