library(ggplot2)
library(RColorBrewer)

# Mt.Fuji function
# this is a modification of "Draw Mt. Fuji in R" posted on "SIGUNIANG'S BLOG".
# see http://siguniang.wordpress.com/2010/12/19/rdraw-mt-fuji-in-r/
f <- function(x) ifelse (abs(x)<=1, x^4-x^2+6, 12/(abs(x)+1))
g <- function(x) ifelse (abs(x)<=2, 0.5*cos(2*x*pi)+7/2, 12/(abs(x)+1))

# overlap layers
ggplot(data.frame(x=c(-8,8)), aes(x)) +
  
  # background gradation
  geom_tile(aes(x, y, fill=y*3), data.frame(expand.grid(x=c(-4,4), y=seq(0.05, 6.95, 0.1)))) +
  
  # Mt. Fuji
  stat_function(fun = f, geom='area', fill='white', colour=NA, n=1000) +
  stat_function(fun = g, geom='area', fill='black', colour=NA, n=1000) +
  
  # The light of sun
  geom_tile(aes(x, y, fill=z),
            transform(data.frame(expand.grid(x=seq(-7.95, 7.95, 0.1), y=seq(0.05, 6.95, 0.1))), z=-sqrt((5-x)^2+(5.5-y)^2)),
            alpha=0.25) +
  
  # The sun
  geom_point(aes(x, y), data.frame(x=5, y=5.5), size=30, colour="yellow") +
  
  # The forests
  stat_function(fun = function(x)sin(x*3)/2+2, geom="area", fill="darkgreen", colour=NA) +
  
  # use YlOrRd colormap from RColorBrewer
  scale_fill_gradientn(colour=rev(brewer.pal(7,"YlOrRd"))) +
  
  # hide labels and legend
  opts(legend.position = "none",
       axis.text.x = theme_blank(),
       axis.text.y = theme_blank(),
       axis.title.x = theme_blank(),
       axis.title.y = theme_blank())
