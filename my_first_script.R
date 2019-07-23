library(tidyverse)
library(dslabs)
library(ggrepel)
data(murders)

murders %>% ggplot(aes(population/10^6, total, label=abb, color = region)) +
  scale_x_log10() +
  scale_y_log10() +
  geom_point() +
  geom_text_repel() +
  xlab("Population in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("United States Gun Murders")

