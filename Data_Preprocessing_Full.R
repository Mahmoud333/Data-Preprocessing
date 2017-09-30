# Data Preprocessing

#-- Importing the dataset
dataset = read.csv('Data.csv')
#dataset = dataset[, 2:3] subset of it


#-- Taking care of missing data
{dataset$Age = ifelse(is.na(dataset$Age),      #true if missing, false if not missing
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), #true   ,missing
                     dataset$Age)                                               #false  ,not missing

                    #$Age we taking the column age of dataset
                    #is.na function that tells if the value is missing or not
                    #checking if all the values of the column age are empty will return true
                    #ave average in R, average of column Age
                    #add function "FUN = " which is "mean" and its an existed function in R

                    #if value in column age is not missing then make "$Age = $Age"


dataset$Salary = ifelse(is.na(dataset$Salary), 
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)), 
                        dataset$Salary) 

}

#-- Encoding categorical data
                    #will use factor function 
{
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'), 
                         labels = c(1 , 2 , 3)) #1 for france 2 for spain 3 for germany


dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No', 'Yes'), 
                         labels = c(0 , 1)) #1 for france 2 for spain 3 for germany
}

#-- Splitting the dataset into the Training set and Test set

# install.packages('caTools') comment it just download it once
library(caTools)  #use the library by code or check it from packages tab 
set.seed(123)     #use seed to get same result, like we used random_state in python

split = sample.split( dataset$Purchased, SplitRatio = 0.8) #put only y in python we had to put X and y
                                                  #we hve to be careful in python we put the % of test set but here
                                                  #we have to put it for the train set
                                                  #will return true or false for each observation so each one will have true or false
                                                  #True observation goes to train set and False goes to test set

training_set = subset(dataset, split == TRUE)  #subset of Our dataset, who's values are TRUE
test_set = subset(dataset, split == FALSE)     #subset of Our dataset who's values are FALSE



#-- Feature Scaling                       #scale is already programmed function
{
training_set[, 2:3] = scale(training_set[,2:3])        #country and purschased are not numiric by default so we hve to specify the age and salary to scale them
test_set[, 2:3] = scale(test_set[, 2:3])
}


