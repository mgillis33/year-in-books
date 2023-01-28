# load packages
library(tidyverse)

# load data
data <- read.csv("/Users/mgillis/Desktop/Projects/year-in-books/2022/Goodreads 2022.csv")

## build barplot

# initialize
by_genre <- ggplot(data, aes(x = fct_rev(fct_infreq(Genre)))) +
  # flip the coordinates
  coord_flip() +
  # plot the bars
  geom_bar(aes(fill = Genre), width = 0.85) +
  # add the data labels
  geom_text(aes(label = after_stat(count)), stat = "count", color = "#3f4c5e", hjust = -0.3, fontface = "bold", family = "Roboto Condensed") +
  # use gradient colors to fill the bars based on different genres
  scale_fill_manual(values = c("#061429","#222f43","#3f4c5e","#5e6b7b","#808c98","#a3aeb7","#c9d1d7","#f0f5f8")) +
  # change the limits of the y axis (flipped)
  scale_y_continuous(limits = c(0,30)) +
  # add the plot labels
  labs(title = "Books Read by Genre", x = "Genre", y = "Count") +
  # add theme elements
  theme(
    aspect.ratio = 9/16,
    plot.margin = margin(1, 1, 1, 1, "cm"),
    text = element_text(family = "Roboto Condensed"),
    axis.text.x = element_text(size = 10, vjust = 0.1),
    axis.text.y = element_text(size = 10, angle = 35, hjust = 0.5),
    axis.title.x = element_text(size = 18, face = "bold", vjust = -0.6, color = "#3f4c5e"),
    axis.title.y = element_text(size = 18, face = "bold", vjust = 1, color = "#3f4c5e"),
    legend.position = "none",
    plot.title = element_text(size = 25, face = "bold", color = "#3f4c5e"),
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "#E3E3E3"),
    plot.background = element_rect(fill = "#F1F1F1", color = "#F1F1F1")
  )

#display the plot
by_genre
