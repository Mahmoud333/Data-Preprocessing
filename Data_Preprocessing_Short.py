"""
Created on Mon Sep 25 00:32:40 2017
@author: mahmoud
"""


import numpy as np  #mathematical tools"""
import matplotlib.pyplot as plt  #sub library of matplotlib, help us plot nice charts"""
import pandas as pd 

#-- Importing the dataset

dataset = pd.read_csv('Data.csv')

                                            # Country Age Salary
X = dataset.iloc[:, :-1].values             # [ Lines , Columns ] of data set ':' means all , ':-1' means all columns except last one

                                            # Purchased
y = dataset.iloc[:, 3].values               # 3 is the number of the column with Country being no. 0


#-- Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split

                                             #test size is 20% of X and y
                                             #random_state we will have random results if we dont put it

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

"""                    
#-- Feature Scaling
                    #we are scaling the age and salary becase they are not in the same level
                    #and sometimes we will need to do it for decreasing the run time like in decission tress it will run for a long time if we didn't do it
                    #we don't need to apply feature scaling to y for now bec. they are only 0 and 1

from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()                  #sc for scale, object of the class
X_train = sc_X.fit_transform(X_train)    #when applying scalling to your training set you have to fit the scalling set and then transform it
X_test = sc_X.transform(X_test)          #dont need to fit it bec. its alreay fit in train set
                        #All the Varibales will be from -1 to +1
"""





