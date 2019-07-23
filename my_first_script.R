library(tidyverse)
library(dslabs)
data(murders)

murders %>% ggplot(aes(population/10^6, total, label=abb, color = region)) +
  scale_x_log10() +
  scale_y_log10() +
  geom_point() +
  geom_label_repel() +
  xlab("Population in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("United States Gun Murders")

