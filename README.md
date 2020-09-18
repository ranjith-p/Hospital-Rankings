# R-Programming

The data for this project come from the Hospital Compare web site (http://hospitalcompare.hhs.gov) run by the U.S. Department of Health and Human Services. The purpose of the web site is to provide data and information about the quality of care at over 4,000 Medicare-certified hospitals in the U.S. This dataset essentially covers all major U.S. hospitals. This dataset is used for a variety of purposes, including determining whether hospitals should be fined for not providing high quality care to patients (see http://goo.gl/jAXFX
for some background on this particular topic)

The Hospital Compare web site contains a lot of data and we will only look at a small subset for this project. The project contains three files:
• outcome-of-care-measures.csv: Contains information about 30-day mortality and readmission rates
for heart attacks, heart failure, and pneumonia for over 4,000 hospitals.
• hospital-data.csv: Contains information about each hospital.
• Hospital_Revised_Flatfiles.pdf: Descriptions of the variables in each file (i.e the code book).

A description of the variables in each of the files is in the included PDF file named Hospital_Revised_Flatfiles.pdf.We will focus on the variables for Number 19 (“Outcome of Care Measures.csv”) and Number 11 (“Hospital Data.csv”)

### Function 1:  Finding the best hospital in a state
This function is called "best" that take two arguments: the 2-character abbreviated name of a state and an outcome name. The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day mortality for the specified outcome in that state. The hospital name is the name provided in the Hospital.Name variable. The outcomes can be one of “heart attack”, “heart failure”, or “pneumonia”. Hospitals that do not have data on a particular outcome will be excluded from the set of hospitals when deciding the rankings.

### Here is some sample output from the function.
 best("TX", "heart attack")
 
[1] "CYPRESS FAIRBANKS MEDICAL CENTER"

 best("TX", "heart failure")
 
[1] "FORT DUNCAN MEDICAL CENTER"

best("MD", "heart attack")

[1] "JOHNS HOPKINS HOSPITAL"

### Function 2: Ranking hospitals by outcome in a state
This function takes three arguments: the 2-character abbreviated name of a state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num). The function reads the outcome-of-care-measures.csv file and returns a character vector with the name of the hospital that has the ranking specified by the num argument. For example, the call rankhospital("MD", "heart failure", 5) would return a character vector containing the name of the hospital with the 5th lowest 30-day death rate for heart failure. The num argument can take values “best”, “worst”, or an integer indicating the ranking (smaller numbers are better). If the number given by num is larger than the number of hospitals in that state, then the function returns NA. 

### Here is some sample output from the function.
rankhospital("TX", "heart failure", 4)

[1] "DETAR HOSPITAL NAVARRO"

rankhospital("MD", "heart attack", "worst")

[1] "HARFORD MEMORIAL HOSPITAL"

rankhospital("MN", "heart attack", 5000)

[1] NA

### Function 3: Ranking hospitals in all states
This function that takes two arguments: an outcome name (outcome) and a hospital ranking (num). The function reads the outcome-of-care-measures.csv file and returns a 2-column data frame containing the hospital in each state that has the ranking specified in num. For example the function call rankall("heart attack", "best") would return a data frame containing the names of the hospitals that are the best in their respective states for 30-day heart attack death rates. The function should return a value for every state (some may be NA). The first column in the data frame is named hospital, which contains the hospital name, and the second column is named state, which contains the 2-character abbreviation for the state name.

#### Here is some sample output from the function.
> head(rankall("heart attack", 20), 10)

     hospital                          state
    <NA>                                  AK

    D W MCMILLAN MEMORIAL HOSPITAL        AL

    ARKANSAS METHODIST MEDICAL CENTER     AR

    JOHN C LINCOLN DEER VALLEY HOSPITAL   AZ

    SHERMAN OAKS HOSPITAL                 CA

    SKY RIDGE MEDICAL CENTER              CO

    MIDSTATE MEDICAL CENTER               CT

    <NA>                                   DC

    <NA>                                   DE

    SOUTH FLORIDA BAPTIST HOSPITAL         FL

