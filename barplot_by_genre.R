library(tidyverse)
library(forcats)

data = read.csv("/Users/mgillis/Desktop/Projects/books/2022/Goodreads 2022.csv")

base = ggplot(data, aes(x = fct_rev(fct_infreq(Genre))))
by_genre = base + geom_bar(aes(fill = Genre), width = 0.85) + coord_flip() +
  scale_fill_manual(values = c("#061429","#222f43","#3f4c5e","#5e6b7b","#808c98","#a3aeb7","#c9d1d7","#f0f5f8")) +
  geom_text(aes(label = after_stat(count)), stat = "count", color = "#3f4c5e", hjust = -0.3, fontface = "bold", family = "Roboto Condensed") +
  theme(
    aspect.ratio = 9/16,
    plot.margin = margin(1, 1, 1, 1, "cm"),
    text = element_text(family = "Roboto Condensed"),
    panel.grid = element_blank(),
    axis.text.x = element_text(size = 10, vjust = 0.1),
    axis.text.y = element_text(size = 10, angle = 35, hjust = 0.5),
    axis.title.x = element_text(size = 18, face = "bold", vjust = -0.6, color = "#3f4c5e"),
    axis.title.y = element_text(size = 18, face = "bold", vjust = 1, color = "#3f4c5e"),
    legend.position = "none",
    plot.title = element_text(size = 25, face = "bold", color = "#3f4c5e"),
    panel.background = element_rect(fill = "#E3E3E3"),
    plot.background = element_rect(fill = "#F1F1F1")
  ) +
  labs(title = "Books Read in 2022", x = "Genre", y = "Count")

by_genre