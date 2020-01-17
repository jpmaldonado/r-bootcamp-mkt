#############################
# Ggplot
#############################
library(tidyverse)
head(mpg)

# gg = Grammar of graphics

# Normal, base R graphics
plot(mpg$displ, mpg$hwy, col='red'
     , xlab ='Engine displ'
     , ylab = 'Fuel perf'
     , main = 'Perf as function of displ')

# The gg approach:
# - Plot: coordinate system / canvas
# - Layer: different representations of the data
# Within each layer, we need
# - Data
# - Geometry (points, lines, bars)
# - Aesthetics (visual attributes, like color)

ggplot(data=mpg)+
  geom_point(aes(x=displ, y=hwy, color=class, shape=drv))+
  labs(x="Engine displ", y="Fuel perf", title="Perf vs disp")+
  facet_wrap(~ class, nrow=3)+
  theme_light()

#ggsave('my_chart.png')
ggplot(data = mpg) +
  geom_violin(aes(x=class, y=hwy, fill=drv))

ggplot(data = mpg)+
  geom_smooth(aes(x=displ, y=hwy))


ggplot(data=mpg)+
  geom_point(aes(x=displ, y=hwy, color=class, shape=drv))+
  geom_smooth(aes(x=displ, y=hwy))+
  labs(x="Engine displ", y="Fuel perf", title="Perf vs disp")+
  facet_wrap(~ class, nrow=3)+
  theme_light()

library(ggthemes)
ggplot(data = mpg) +
  geom_violin(aes(x=class, y=hwy, fill=drv))+
  scale_fill_manual(values=c("#d0d3c5", "#56b1bf", "#08708a"))+
  theme_wsj()


#############
# EXERCISE
##############
head(diamonds)

ggplot(data=diamonds)+
  geom_jitter(aes(x=color, y=price, color="red"))+
  geom_boxplot(aes(x=color, y=price, fill=color, alpha=0.2))+
  theme_bw()



head(diamonds)

# Combine ggplot with dplyr smoothly
diamonds %>% 
  filter(cut %in% c("Ideal", "Premium")) %>%
  select(carat, cut, price) %>%
  ggplot()+
  geom_point(aes(x=carat, y=price, color=cut))






