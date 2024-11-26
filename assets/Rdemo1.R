#demo for BM432 project students, 2024 - how to import data into R, view it, and begin plotting

#first let's check our working directory, as we need to be in the correct working directory to import our files
getwd()

#let's also go ahead and install and load any libraries that we think we might need
#install.packages("readr")
library(readr)

#install.packages("dplyr")
library(dplyr)

#install.packages("ggplot2")
library(ggplot2)

#now let's import our data into R
#we will use the read_csv() function for this (which is from the readr package)
data <- read_csv("Rdemo1.csv")

#we can inspect the data using head() or even View() (if the dataset is small enough)
#we can also use the glimpse() function from package dplyr
head(data)

View(data)

glimpse(data)

#now let's try plotting the data with ggplot2

ggplot(data, aes(x = size, y = CDS)) +
  geom_point(size = 3) +
  labs(
    title = "Relationship Between Genome Size and Number of CDS",
    x = "Size",
    y = "Number of CDS"
  ) +
  theme_minimal()


#add a trendline - we could see how well a linear trendline fits the data
ggplot(data, aes(x = size, y = CDS)) +
  geom_point(size = 3, color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(
    title = "Relationship Between Genome Size and Number of CDS",
    x = "Size",
    y = "Number of CDS"
  ) +
  theme_minimal()

#how well does this fit our data? let's calculate the R squared value
# Fit a linear model
linear_model <- lm(CDS ~ size, data = data)

# Display the R-squared value
summary(linear_model)$r.squared


