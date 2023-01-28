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

# turn those two columns into a data frame
table2 <- data.frame(months,cum_pages)

## build linechart

# initialize
sum_linechart <- ggplot(table, aes(x = months, y = cum_pages, group = 1)) +
  # plot the line
  geom_line(stat = "identity", color = "#808c98", linewidth = 1.25) +
  # plot the points
  geom_point(stat = "identity", color = "#3f4c5e", size = 2.5) +
  # specify order of the bins on the x-axis
  scale_x_discrete(limits = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")) +
  # add plot labels
  labs(title = "Cumulative Pages Read by Month", x = "Month", y = "Pages") +
  # add theme elements
  theme(
    plot.margin = margin(1, 1, 1, 1, "cm"),
    text = element_text(family = "Roboto Condensed"),
    axis.text.x = element_text(size = 10, angle = 30, vjust = 0.55),
    axis.text.y = element_text(size = 15, hjust = 0.5),
    axis.title.x = element_text(size = 18, face = "bold", vjust = -0.6, color = "#3f4c5e"),
    axis.title.y = element_text(size = 18, face = "bold", vjust = 1, color = "#3f4c5e"),
    plot.title = element_text(size = 25, face = "bold", color = "#3f4c5e"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_line(color = "#F1F1F1"),
    panel.background = element_rect(fill = "#E3E3E3"),
    plot.background = element_rect(fill = "#F1F1F1", color = "#F1F1F1")
  )

# display the plot
sum_linechart