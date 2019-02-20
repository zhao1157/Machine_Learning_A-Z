#This is a template for data preprocessing

#========= Importing the dataset ========
dataset <-  read.csv('Data.csv', header = TRUE, sep = ',')
print (dataset)

#======= Taking care of the missing data =======
dataset$Age = ifelse(is.na(dataset$Age), ave(dataset$Age, 
                FUN = function(x) mean(x, na.rm=TRUE)), dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary), ave(dataset$Salary, 
                FUN = function(x) mean(x, na.rm=TRUE)), dataset$Salary)
print (dataset)

#=========== Taking care of the categorical data ======
dataset$Country = factor(dataset$Country, levels = c('France',
                    'Germany', 'Spain'), labels =c(1, 2, 3))

dataset$Purchased = factor(dataset$Purchased, levels = c('Yes', 'No'), 
                           labels =c(1, 0))
print (dataset)

#=========== Splitting the data into training and testing sets
library(caTools)
set.seed(123)
split <-  sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set <-  subset(dataset, split == TRUE)
test_set <-  subset(dataset, split == FALSE)

#========= Feature scaling =========
training_set[, 2:3] <- scale(training_set[, 2:3]) #factors are
                                #not numerical type
test_set[, 2:3] <- scale(test_set[, 2:3])
print('Training_set: ')
print(training_set)
print('Test_set: ')
print(test_set)
