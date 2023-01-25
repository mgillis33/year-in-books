library(tidyverse)
library(cowplot)
library(forcats)
library(magick)

data = read.csv("/Users/mgillis/Desktop/Projects/books/books2022/Goodreads 2022.csv")

base1 = ggplot(data = data, mapping = aes(x = Month.Finished))
by_month = base1 + geom_bar(aes(fill = Genre), width = 0.85) +
  scale_fill_manual(values = c("#061429","#222f43","#3f4c5e","#5e6b7b","#808c98","#a3aeb7","#c9d1d7","#f0f5f8")) +
  theme(
    aspect.ratio = 9/16,
    text = element_text(family = "Roboto Condensed"),
    panel.grid = element_blank(),
    axis.text.x = element_text(size = 10, angle = 30, vjust = 0.6),
    axis.text.y = element_text(size = 15),
    axis.title.x = element_text(size = 18, face = "bold", color = "#3f4c5e", vjust = -2),
    axis.title.y = element_text(size = 18, face = "bold", color = "#3f4c5e", vjust = 5),
    plot.margin = margin(1, 1, 1, 1, "cm"),
    plot.title = element_text(size = 25, face = "bold", color = "#3f4c5e"),
    legend.title = element_text(size = 15, face = "bold", color = "#3f4c5e"),
    legend.key.size = unit(0.8, "cm"),
    legend.background = element_rect(fill = "#E3E3E3"),
    panel.background = element_rect(fill = "#E3E3E3"),
    plot.background = element_rect(fill = "#F1F1F1", color = "#F1F1F1"),
    panel.border = element_rect(colour = "#F1F1F1", fill = NA, linewidth = 2)
  ) +
  scale_x_discrete(limits = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")) +
  labs(title = "Books Read By Month", x = "Month Finished", y = "Count")

base2 = ggplot(data, aes(x = fct_rev(fct_infreq(Genre))))
by_genre = base2 + geom_bar(aes(fill = Genre), width = 0.85) + coord_flip() +
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
    plot.background = element_rect(fill = "#F1F1F1", color = "#F1F1F1")
  ) +
  labs(title = "Books Read By Genre", x = "Genre", y = "Count")


g = plot_grid(by_month,by_genre)
ggdraw(g) +
  draw_image(
    "/Users/mgillis/Desktop/Projects/books/books2022/1454549160-1454549160_goodreads_misc (1).png", scale = 0.2, x = 0.4, y = 0.35) +
  theme(
    plot.background = element_rect(fill = "#F1F1F1"),
    panel.border = element_rect(colour = "#3f4c5e", fill = NA, linewidth = 5),
    axis.title = element_text(family = "Roboto Condensed", face = "bold")
  ) +
  draw_plot_label(label = "Books Read in 2022", hjust = -0.07, vjust = 2, size = 85, family = "Roboto Condensed", fontface = "bold", color = "#3f4c5e")
