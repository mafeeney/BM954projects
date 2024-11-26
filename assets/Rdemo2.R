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
data <- read_csv("Rdemo2.csv")

#we can inspect the data using head() or even View() (if the dataset is small enough)
#we can also use the glimpse() function from package dplyr
head(data)

View(data)

glimpse(data)

#now let's try plotting the data with ggplot2

# Scatter plot
ggplot(data, aes(x = Host, y = HypotheticalProteins)) +
  geom_jitter(width = 0.2, size = 3, color = "blue") + # Add jitter to spread points
  labs(
    title = "Scatter Plot of Hypothetical Proteins by Host",
    x = "Host",
    y = "Number of Hypothetical Proteins"
  ) +
  theme_minimal()

# Boxplot
ggplot(data, aes(x = Host, y = HypotheticalProteins)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(
    title = "Distribution of Hypothetical Proteins by Host",
    x = "Host",
    y = "Number of Hypothetical Proteins"
  ) +
  theme_minimal()

# Violin plot with scatterplot
ggplot(data, aes(x = Host, y = HypotheticalProteins)) +
  geom_violin(fill = "lightblue", alpha = 0.5) + # Violin plot with semi-transparency
  geom_jitter(width = 0.2, size = 3, color = "darkblue") + # Scatterplot with jitter
  labs(
    x = "Host",
    y = "Number of Hypothetical Proteins"
  ) +
  theme_minimal()