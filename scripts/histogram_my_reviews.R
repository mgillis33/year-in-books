# load packages
library(tidyverse)

# load data
data <- read.csv("/Users/mgillis/Desktop/Projects/year-in-books/2022/Goodreads 2022.csv")

## build histogram

# initialize
my_reviews <- ggplot(data, aes(x = My.Rating)) +
  # plot the bars
  geom_histogram(binwidth = 1, fill = "#3f4c5e") +
  #add the data labels
  stat_bin(binwidth = 1, geom = "text", aes(label = after_stat(count)), vjust = -0.3, fontface = "bold", family = "Roboto Condensed", color = "#3f4c5e", size = 5) +
  # add plot labels
  labs(title = "Distribution of My Ratings", x = "Rating (5 Star Scale)", y = "Count") +
  # change the limits of the y-axis
  scale_y_continuous(limits = c(0,20)) +
  # add theme elements
  theme(
    aspect.ratio = 9/16,
    plot.margin = margin(1, 1, 1, 1, "cm"),
    text = element_text(family = "Roboto Condensed"),
    axis.text.x = element_text(size = 10, vjust = 0.1),
    axis.text.y = element_text(size = 10, hjust = 0.5),
    axis.title.x = element_text(size = 18, face = "bold", vjust = -0.6, color = "#3f4c5e"),
    axis.title.y = element_text(size = 18, face = "bold", vjust = 1, color = "#3f4c5e"),
    plot.title = element_text(size = 25, face = "bold", color = "#3f4c5e"),
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "#E3E3E3"),
    plot.background = element_rect(fill = "#F1F1F1", color = "#F1F1F1")
  )

# display the plot
my_reviews
