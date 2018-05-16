a <- ggplot(diamonds, aes(price,table))+ 
  geom_point(aes(colour = color))
b <- a+
  geom_smooth(aes(group = color),method="lm",size = 1)

c <- b+theme_minimal()
c$layers

airquality %>% 
  filter( Day >9)-> last

airquality %>% 
  filter( Day <=9)-> first
  
ggplot(first,aes(Month,Wind)) + 
  geom_path(aes(group = Day))+
  geom_text(data= last, aes(label= Day))+
geom_point(aes(colour=Solar.R))+
  xlab("other")-> f
p_build_a <- (ggplot_build(f))
g_table_a <- ggplot_gtable(p_build_a)

ggplot(first,aes(Month,Wind)) + 
  geom_path(aes(group = Day))+
  xlab("other")-> g
p_build_b <- (ggplot_build(g))
g_table_b <- ggplot_gtable(p_build_b)
