
install.packages("lubridate")
library(lubridate)

start_date <- dmy_hms("01/12/2015 15:40:32")
end_date <- dmy_hms("01/10/2016 16:01:10")
end_date - start_date


my_interval <- interval(start_date,end_date)
wday(start_date,label = TRUE,abbr = FALSE)

grep("Buenos_Aires", OlsonNames(), value=TRUE)

with_tz(end_date, grep("Buenos_Aires", OlsonNames(), value=TRUE)[1])

force_tz(end_date, grep("New_York", OlsonNames(), value=TRUE))



#Create a sequence of periods, from zero to 10, by 2 weeks
weeks(2) * c(0:10)
##  [1] "0S"            "14d 0H 0M 0S"  "28d 0H 0M 0S"  "42d 0H 0M 0S" 
##  [5] "56d 0H 0M 0S"  "70d 0H 0M 0S"  "84d 0H 0M 0S"  "98d 0H 0M 0S" 
##  [9] "112d 0H 0M 0S" "126d 0H 0M 0S" "140d 0H 0M 0S"

#Calculating Thanksgiving Day in 2016:
#  Thanksgiving is celebrated on the fourth Thursday of November.
#So we will execute the following steps:
#  1. Create a date/time object (date1 variable) representing Novevember 1st, 2016
nov1st = ymd("2016-11-1")
#2. Check which day of the week November 1st is.
wday(nov1st,label = TRUE, abbr = FALSE)
#3. Add the needed days to reach the upcoming Thursday (date2 variable)
days(2)

thursday_aft_nov1st = thxgiving + days(2)
#4. Make sure your calculation is correct (e.g. you reached the upcoming Thursday)
weeks(3)
#5. Add 3 weeks 
thxgiving = thursday_aft_nov1st + weeks(3)
thxgiving
wday(thxgiving, label=TRUE, abbr =FALSE)
