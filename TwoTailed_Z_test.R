# This is the problem to solve:

# > In an experiment two years ago the weights of the weasels in certain area were measured. The weights are normally distributed with an average (mean) of 400 grams and a standard deviation of 100 grams.
# >
# > This year a sample of 50 individuals was taken from the same place, the average weight was 520 grams.
# >
# > With a significance level of 0.05. Has the weight of the weasels changed?

# To compute z is straightforward, we use the formula z = (sample mean - population mean) / (standard deviation / square root of the sample size):
population.mean <- 400
sample.mean <- 418
sd <- 100
alpha <- 0.05    
n <- 50

xmin <- -4
xmax <- 4

z = (sample.mean - population.mean) /  (sd / sqrt(n)) 
print(paste("z statistic:", z))

# **Output**:
# ```
# z statistic: 1.27279220613579
# ```

# Now to create the corresponding plot, we draw a normal random sample between -4 and 4 and assign the corresponding sequence to `hx`
x <- seq(xmin, xmax, length=100)
hx <- dnorm(x)

# Set up the plot. The critical regions are drawn as polygons.
plot(x, hx, type="n", xlab="Weight", ylab="",
     main="Normal Distribution", axes=FALSE)

lines(x, hx)                            # plots the distribution

crtclvalue.left <- -qnorm(1-alpha/2)    # left critical value
crtclvalue.right <- qnorm(1-alpha/2)    # right critical value

i <- x >= crtclvalue.right              # right rejection region
polygon(c(crtclvalue.right, x[i], xmax),
        c(0, hx[i], 0), 
        col="purple")

j <- x <= crtclvalue.left               # left rejection region
polygon(c(xmin, x[j], crtclvalue.left), 
        c(0, hx[j], 0), 
        col="purple")

axis(1, pos=0,                          # tick marks
     at = c(z, crtclvalue.left, crtclvalue.right, 
                  xmin, 0, xmax), 
     labels = format(c(z, 
                crtclvalue.left, 
                crtclvalue.right, 
                xmin, 0, xmax), digits=2))

# Since z is not in the rejection zone the null hypothesis is accepted. The weight of the weasels hasn't changed significantly.

# ---

# A quicker method to determine if the null hypothesis has to be rejected is to compute the corresponding *p-value* by means of `pnorm()`:

pvalue <- pnorm(z)
print(paste("p value:", pvalue))

# **Output**:
# ```
# p value: 0.898454106211416
# ```

# Since the p-value is in the acceptance zone, in the interval (-alpha/2, alpha/2), we accept the null hypothesis.
