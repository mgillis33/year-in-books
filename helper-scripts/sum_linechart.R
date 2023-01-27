# load packages
library(tidyverse)

# load data
data <- read.csv("/Users/mgillis/Desktop/Projects/year-in-books/2022/Goodreads 2022.csv")

#get a row vector of the months.
months <- c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")

# get page sums by month into a row vector
page_sums <- c(sum(data[which(data$Month.Finished == "January"), 5]),
               sum(data[which(data$Month.Finished == "February"), 5]),
               sum(data[which(data$Month.Finished == "March"), 5]),
               sum(data[which(data$Month.Finished == "April"), 5]),
               sum(data[which(data$Month.Finished == "May"), 5]),
               sum(data[which(data$Month.Finished == "June"), 5]),
               sum(data[which(data$Month.Finished == "July"), 5]),
               sum(data[which(data$Month.Finished == "August"), 5]),
               sum(data[which(data$Month.Finished == "September"), 5]),
               sum(data[which(data$Month.Finished == "October"), 5]),
               sum(data[which(data$Month.Finished == "November"), 5]),
               sum(data[which(data$Month.Finished == "December"), 5]))

# create a row vector that contains a cumulative sum for each month
cum_pages <- cumsum(page_sums)

#turn those two columns into a data frame
table <- data.frame(months,page_sums)

# build line chart
base <- ggplot(table, aes(x = months, y = cum_pages, group = 1))
sum_linechart <- base + geom_line(stat = "identity", color = "#808c98", linewidth = 1.25) +
  geom_point(stat = "identity", color = "#3f4c5e", size = 2.5) +
  # use gradient colors to fill the bars based on different genres
  theme(
    aspect.ratio = 9/16,
    plot.margin = margin(1, 1, 1, 1, "cm"),
    text = element_text(family = "Roboto Condensed"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_line(color = "#F1F1F1"),
    axis.text.x = element_text(size = 10, angle = 30, vjust = 0.55),
    axis.text.y = element_text(size = 10, hjust = 0.5),
    axis.title.x = element_text(size = 18, face = "bold", vjust = -0.6, color = "#3f4c5e"),
    axis.title.y = element_text(size = 18, face = "bold", vjust = 1, color = "#3f4c5e"),
    legend.position = "none",
    plot.title = element_text(size = 25, face = "bold", color = "#3f4c5e"),
    panel.background = element_rect(fill = "#E3E3E3"),
    plot.background = element_rect(fill = "#F1F1F1", color = "#F1F1F1")
  ) +
  scale_x_discrete(limits = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")) +
  labs(title = "Cumulative Pages Read by Month", x = "Month", y = "Pages")

sum_linechart