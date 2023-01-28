# load packages
library(tidyverse)

# load data
data <- read.csv("/Users/mgillis/Desktop/Projects/year-in-books/2022/Goodreads 2022.csv")

# create a data frame that is a frequency table for the authors
authors <- count(data, Author)

# create another data frame, this time excluding any author with a frequency < 2
authors_exc <- (authors[which(authors$n != 1),])

# create a final data frame reordered, an ascending order
authors_exc_reordered <- authors_exc %>% arrange(n)

## build barplot

# initialize
barplot_author <- ggplot(data = authors_exc, aes(x = Author, y = n)) + 
  # flip the coordinates
  coord_flip() +
  # plot the bars
  geom_col(width = 0.85, fill = "#3f4c5e") +
  #add the data labels
  geom_text(aes(label = n), hjust = -0.3, color = "#3f4c5e", fontface = "bold", family = "Roboto Condensed") +
  # change the limits of the y axis (flipped)
  scale_y_continuous(limits = c(0,20)) +
  # change the x axis (flipped) limits to be displayed in decreasing order
  scale_x_discrete(limits = c(authors_exc_reordered[,1])) +
  # add plot labels
  labs(title = "Books Read by Author (Excluding one-offs)", x = "Author", y = "Count") +
  # add theme elements
  theme(
    aspect.ratio = 9/16,
    plot.margin = margin(1, 1, 1, 1, "cm"),
    text = element_text(family = "Roboto Condensed"),
    axis.text.x = element_text(size = 10, vjust = 0.1),
    axis.text.y = element_text(size = 10, angle = 35, hjust = 0.5),
    axis.title.x = element_text(size = 18, face = "bold", vjust = -0.6, color = "#3f4c5e"),
    axis.title.y = element_text(size = 18, face = "bold", vjust = 1, color = "#3f4c5e"),
    plot.title = element_text(size = 21, face = "bold", color = "#3f4c5e"),
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "#E3E3E3"),
    plot.background = element_rect(fill = "#F1F1F1", color = "#F1F1F1")
  )

# display the plot
barplot_author
