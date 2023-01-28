# load packages
library(tidyverse)

# load data
data <- read.csv("/Users/mgillis/Desktop/Projects/year-in-books/2022/Goodreads 2022.csv")

## build barplot

# initialize
by_month <- ggplot(data, aes(x = Month.Finished)) +
  # plot the bars
  geom_bar(aes(fill = Genre), width = 0.85) +
  # use gradient colors to fill the bars based on different genres
  scale_fill_manual(values = c("#061429","#222f43","#3f4c5e","#5e6b7b","#808c98","#a3aeb7","#c9d1d7","#f0f5f8")) +
  # specify order of the bins on the x-axis
  scale_x_discrete(limits = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")) +
  # add plot labels
  labs(title = "Books Read by Month", x = "Month Finished", y = "Count") +
  # add theme elements
  theme(
    aspect.ratio = 9/16,
    plot.margin = margin(1.5, 1.5, 1.5, 1.5, "cm"),
    text = element_text(family = "Roboto Condensed"),
    axis.text.x = element_text(size = 10, angle = 30, vjust = 0.6),
    axis.text.y = element_text(size = 15),
    axis.title.x = element_text(size = 18, face = "bold", color = "#3f4c5e", vjust = -2),
    axis.title.y = element_text(size = 18, face = "bold", color = "#3f4c5e", vjust = 5),
    plot.title = element_text(size = 25, face = "bold", color = "#3f4c5e"),
    legend.title = element_text(size = 15, face = "bold", color = "#3f4c5e"),
    legend.key.size = unit(0.8, "cm"),
    legend.background = element_rect(fill = "#E3E3E3"),
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "#E3E3E3"),
    plot.background = element_rect(fill = "#F1F1F1", color = "#F1F1F1")
  )

# display the plot
by_month
