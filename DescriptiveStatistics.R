# The next data will be used in all the subsequent examples:

thedata <- c(1, 7, 1, 1,  1,  5,  2,  5,  5,  8,  9,  8,  3,  7,  7,  5,  2,
             8,  6, 10,  4,  1,  5,  4,  1,  8,  6,  2,  2, 10, 10,  7,  4,
             4,  8, 10,  6,  6,  4,  2,  9,  3,  3, 10,  7,  8,  9,  8,  9,
             1,  8,  7,  3,  1,  9,  9,  8,  9,  8,  3,  2,  4,  8,  7,  8,
             2, 10,  1,  7,  3,  6,  5,  3,  4,  9,  5,  2,  1,  6,  8,  6,
             9, 10,  5,  8,  7,  5,  9,  2,  1,  5,  8,  5,  9,  1,  2,  8,
             4,  9,  6)


# Frequencies
# -----------

# The code below will produce a table of frequencies.
print('Frequencies')
thefrec <- table(thedata)
print(thefrec)

# **Output**:
# ```
# "Frecuencies"
#  1  2  3  4  5  6  7  8  9 10 
#  12 10  7  8 11  8  9 16 12  7 
# ```

# ---

# Relative Frequencies
# --------------------

# The relative frequency or empirical probability of an event refers to the absolute frequency normalized by the total number of events.
# The function `prop.table()` produces a relative frequencies table out of the frequency table `thefrec` from the previous example.
print('Relative Frequencies')
therelfrec <- prop.table(thefrec)
print(therelfrec)

# **Output**:
# ```
# "Relative Frequencies"
#  1    2    3    4    5    6    7    8    9   10 
# 0.12 0.10 0.07 0.08 0.11 0.08 0.09 0.16 0.12 0.07 
# ```

# ---

# The Mean
# --------

# The mean is equal to the sum over every possible value weighted by the probability of that value. The `mean()` function computes the mean of a list of numbers in R.
print('The Mean')
themean <- mean(thedata)
print(themean)

# **Output**:
# ```
# "The Mean"
#  5.57
# ```

# ---

# The Trimmed Mean
# ----------------

#  To compute the trimmed mean **R** removes a small percentage of the largest and smallest values before calculating the mean. In this example the upper and lower 10% are removed by the extra parameter `trim=0.10`.
print('The Trimmed Mean')
thetrimmean <- mean(thedata, trim = 0.10)
print(thetrimmean)

# **Output**:
# ```
# "The Trimmed Mean"
#  5.625
# ```

# ---

# The Median
# ----------

# If there is an odd number of data values then the median will be the value in the middle. If there is an even number of data values the median is the mean of the two data values in the middle. To compute the median with R the function `median()` is available.
print('The Median')
themedian <- median(thedata)
print(themedian)

# **Output**
# ```
# "The Median"
#  6
# ```

# ---

# The Quantiles
# -------------

# These are computed dividing ordered data into q essentially equal-sized data subsets, the q-quantiles are the data values marking the boundaries between consecutive subsets. To compute them R has the function `quantile()` which takes two arguments: a list of data and a list of percentages. The example below computes the quantiles corresponding to 25%, 50% and 75% of the data.
print('The Quantiles')
thequantiles <- quantile(thedata, probs=c(0.25,0.5,0.75))
print(thequantiles)

# **Output**:
# ```
# "The Quantiles"
#  25% 50% 75% 
#   3   6   8 
# ```

# ---

# The Variance
# ------------

# The variance measures how far a set of numbers is spread out. The routine `var()` computes the variance of a list of numbers in R.
print('The Variance')
thevariance <- var(thedata)
print(thevariance)

# **Output**:
# ```
# "The Variance"
#  8.49
# ```

# ---

# The Standard Deviation
# ----------------------

# The standard deviation is a measure that is used to quantify the amount of variation or dispersion of a set of data values. It is the variance squared. R can compute the standard deviation of a set of data by means of `sd()`.
print('The Standard Deviation')
thesd <- sd(thedata)
print(thesd)

# **Output**:
# ```
# "The Standard Deviation"
#  2.91376
# ```

# The Interquartile Range
# -----------------------

# The interquartile range (IQR) is a measure of variability, based on dividing a data set into quartiles. You can compute the interquartile range in R with the `IQR()` function. 
print('The Interquartile Range')
theiqr <- IQR(thedata)
print(theiqr)

# **Output**:
# ```
# "The Interquartile Range"
#  5
# ```

# ---

# The Median Absolute Deviation
# -----------------------------

# The median absolute deviation (MAD) is defined as the median of the absolute deviations from the data's median. The function `mad()` computes the MAD of a numeric set of data in R.
print('The Median Absolute Deviation')
themad <- mad(thedata)
print(themad)

# **Output**:
# ```
# "The Median Absolute Deviation"
#  2.9652
# ```

# ---

# The library `e1071` is needed for the next two examples.
library(e1071)

# The Skewness
# ------------

# The skewness is a measure of the asymmetry of the data distribution about its mean. To compute it in R use the function `skewness()`.
print('The Skewness')
theskns <- skewness(thedata)
print(theskns)

# **Output**
# ```
# "The Skewness"
# -0.1628241
# ```

# ---

# The Kurtosis
# ------------

# Kurtosis is a measure of the "peakedness" of graph of the data.
print('The Kurtosis')
thekts <- kurtosis(thedata)
print(thekts)

# **Output**
# ```
# "The Kurtosis"
# -1.312111
# ```

# ---
# To visualize the data, the frequencies are plotted in the next [bar chart](https://www.getdatajoy.com/examples/r-plots/advanced-bar-charts)
library(ggplot2)
table = data.frame(thefrec)
ggplot(data=table, aes(x=thedata, y=Freq)) +
  geom_bar(colour="black", stat="identity") +
  guides(fill=FALSE) +
  ylab("Frequency") +        # x-axis label
  xlab("Data")    
