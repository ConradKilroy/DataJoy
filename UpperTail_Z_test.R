# Example to solve: 
# > A food label on a cookie bag states that there is at most 2 grams of saturated fat in a single cookie. In a sample of 35 cookies, it is found that the mean amount of saturated fat per cookie is 2.11 grams. The population standard deviation is 0.25 grams. At 0.5 significance level, can we reject the claim on the food label?

sample.mean <- 2.11          
population.mean <- 2         
standard.deviation <- 0.25        
n <- 35
alpha <- 0.05

z <- (sample.mean - population.mean) / (standard.deviation / sqrt(n)) 
print(paste("z statistic:", z))

# **Output**:
# ```
# z statistic: 2.60307510456383
# ```

# Now to create the corresponding plot we draw a normal random sample between -4 and 4 and assign the corresponding sequence to `hx`, we also compute the critical value with `qnorm()`.
minx = -4
maxx = 4

x <- seq(minx,maxx,length=100)
hx <- dnorm(x)

critical.value = qnorm(1-alpha) 

# Set up the plot, highlighting the critical region in purple.
plot(x, hx, type="n", 
     xlab="Critical Region", ylab="",                       # axes labels
     main="Normal Distribution",                            # title
     axes=FALSE)                                            # switch axes off


lines(x, hx)                    # plots the standard distribution

i <- x >= critical.value        # points in the rejection region
polygon(c(critical.value, x[i], maxx), c(0, hx[i], 0), col="purple") 

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
# p-value: 0.99538041442819
# ```

# Since the p-value is greater than alpha the null hypothesis is rejected.
