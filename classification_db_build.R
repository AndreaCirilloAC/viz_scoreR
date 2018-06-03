## file sourcing
scripts <- (paste("R/",list.files("R"),sep =""))
for ( i in 1: length(scripts)){
  source(scripts[i],local = TRUE)
}

### Test charts

# source :
# install.packages("ggplot2")
# load package and data
options(scipen=999)  # turn-off scientific notation like 1e+48
library(ggplot2)
#theme_set(theme_bw())  # pre-set the bw theme.
data("midwest", package = "ggplot2")
# midwest <- read.csv("http://goo.gl/G1K41K")  # bkup data source

# Scatterplot
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) + 
  geom_smooth(method="loess", se=F) + 
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) + 
  labs(subtitle="Area Vs Population", 
       y="Population", 
       x="Area", 
       title="Scatterplot", 
       caption = "Source: midwest")

## circled scatterplot
options(scipen = 999)
library(ggplot2)
library(ggalt)
midwest_select <- midwest[midwest$poptotal > 350000 & 
                            midwest$poptotal <= 500000 & 
                            midwest$area > 0.01 & 
                            midwest$area < 0.1, ]

# Plot
encircled <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) +   # draw points
  geom_smooth(method="loess", se=F) + 
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) +   # draw smoothing line
  geom_encircle(aes(x=area, y=poptotal), 
                data=midwest_select, 
                color="red", 
                size=2, 
                expand=0.08) +   # encircle
  labs(subtitle="Area Vs Population", 
       y="Population", 
       x="Area", 
       title="Scatterplot + Encircle", 
       caption="Source: midwest")


library(ggplot2)
data(mpg, package="ggplot2") # alternate source: "http://goo.gl/uEeRGu")




# regression
regression <- 
  ggplot(mpg, aes(cty, hwy))+
 geom_point() + 
  geom_smooth(method="lm", se=F) +
  labs(subtitle="mpg: city vs highway mileage", 
       y="hwy", 
       x="cty", 
       title="Scatterplot with overlapping points", 
       caption="Source: midwest")

jittered_plot <-  ggplot(mpg, aes(cty, hwy))+
 geom_jitter(width = .5, size=1) +
  labs(subtitle="mpg: city vs highway mileage", 
       y="hwy", 
       x="cty", 
       title="Jittered Points")


count_plot <-  ggplot(mpg, aes(cty, hwy))+
geom_count(col="tomato3", show.legend=F) +
  labs(subtitle="mpg: city vs highway mileage", 
       y="hwy", 
       x="cty", 
       title="Counts Plot")


# bubbleplot
mpg_select <- mpg[mpg$manufacturer %in% c("audi", "ford", "honda", "hyundai"), ]

bubble_plot <- ggplot(mpg_select, aes(displ, cty)) + 
  labs(subtitle="mpg: Displacement vs City Mileage",
       title="Bubble chart")+
geom_jitter(aes(col=manufacturer, size=hwy)) + 
  geom_smooth(aes(col=manufacturer), method="lm", se=F)

#dotplot

library(ggplot2)
library(scales)


cty_mpg <- aggregate(mpg$cty, by=list(mpg$manufacturer), FUN=mean)  # aggregate
colnames(cty_mpg) <- c("make", "mileage")  # change column names
cty_mpg <- cty_mpg[order(cty_mpg$mileage), ]  # sort
cty_mpg$make <- factor(cty_mpg$make, levels = cty_mpg$make)  # to retain the order in plot.



# dotPlot
dot_plot <- ggplot(cty_mpg, aes(x=make, y=mileage)) + 
  geom_point(col="tomato2", size=3) +   # Draw points
  geom_segment(aes(x=make, 
                   xend=make, 
                   y=min(mileage), 
                   yend=max(mileage)), 
               linetype="dashed", 
               size=0.1) +   # Draw dashed lines
  labs(title="Dot Plot", 
       subtitle="Make Vs Avg. Mileage", 
       caption="source: mpg") +  
  coord_flip()

## horizontal barplot

data("mtcars")  # load data
mtcars$car_name <- rownames(mtcars)  # create new column for car names
mtcars$mpg_z <- round((mtcars$mpg - mean(mtcars$mpg))/sd(mtcars$mpg), 2)  # compute normalized mpg
mtcars$mpg_type <- ifelse(mtcars$mpg_z < 0, "below", "above")  # above / below avg flag
mtcars <- mtcars[order(mtcars$mpg_z), ]  # sort
mtcars$car_name <- factor(mtcars$car_name, levels = mtcars$car_name)  # convert to factor to retain sorted order in plot.

# Diverging Barcharts
 horizontal_Bar <- ggplot(mtcars, aes(x=car_name, y=mpg_z, label=mpg_z)) + 
  geom_bar(stat='identity', aes(fill=mpg_type), width=.5)  +
  scale_fill_manual(name="Mileage", 
                    labels = c("Above Average", "Below Average"), 
                    values = c("above"="#00ba38", "below"="#f8766d")) + 
  labs(subtitle="Normalised mileage from 'mtcars'", 
       title= "Diverging Bars") + 
  coord_flip()
 
 # lollipop
 
 lollipop <- ggplot(mtcars, aes(x=car_name, y=mpg_z, label=mpg_z)) + 
   geom_point(stat='identity', fill="black", size=6)  +
   geom_segment(aes(y = 0, 
                    x = car_name, 
                    yend = mpg_z, 
                    xend = car_name), 
                color = "black") +
   geom_text(color="white", size=2) +
   labs(title="Diverging Lollipop Chart", 
        subtitle="Normalized mileage from 'mtcars': Lollipop") + 
   ylim(-2.5, 2.5) +
   coord_flip()
 
vertical_bar <- ggplot(cty_mpg, aes(x=make, y=mileage)) + 
  geom_bar(stat="identity", width=.5, fill="tomato3") + 
  labs(title="Ordered Bar Chart", 
       subtitle="Make Vs Avg. Mileage", 
       caption="source: mpg") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))

### BAD PLOTS####
dataframe = data.frame(
  val  = c( 8 ,  6 ,  9 ,  4 ,  2 , 3.5),
  labs = c("a", "b", "c", "d", "e", "f") )
ggplot(dataframe, aes(y = val, x = labs)) + geom_bar(stat = "identity")->bar_chart

ggplot(dataframe, aes(1, val, fill=labs, width=0.2)) + geom_bar(stat="identity")->stacked
  
data = data.frame(student = c("Tina", "Trish", "Kevin", "Rebecca", "Sarah"),
                  percentile = c(25, 95, 54, 70, 99)  ) #percentile of d levels

useless_pointrange <- ggplot(data, aes(x = student, y = percentile))+ 
  geom_pointrange(aes(ymin = 0, ymax = 100)) + coord_flip()

## filled boxplot

filled_boxplot <- ggplot(data, aes(dataset, val))+ 
  geom_boxplot(fill = "steelblue", color = "grey") + labs(title = "Box Plots")

## dataspaghetti

library(reshape2)
line_data <- data.frame(x_val = 1:50)

for (letter in letters){
  slope = rnorm(1)
  line_data[,letter] <- sin(line_data$x_val + rnorm(1))*slope + rnorm(50)
}

#melt the big dataframe to a tidy one.
tidy_lines = melt(line_data, id = c("x_val"))

#plot with different lines for different letters.
#       data                               color code by letter    draw lines                     add a title
data_spaghetti <- ggplot(tidy_lines, aes(x = x_val, y = value, color = variable)) + 
  geom_line() + 
  labs(title = "Delicious data spagetti")

## more plots


ggplot(airquality, aes(x = Month, Wind))+
  geom_bar(stat = 'identity')+
  coord_cartesian()+
  coord_polar("y")+
  labs(title = "titolo")-> pie_chart

ggplot(airquality, aes(x = Month, Wind,size= Day))+
  geom_line()+
  labs(title = "titolo")-> bubble_chart

ggplot(airquality, aes(Wind))+
  geom_histogram(data=subset(airquality,Wind >10))->histogram

ggplot(airquality, aes(Day,Wind, fill = Month))+
  geom_bar(stat = 'identity') -> barplot

data.frame(x = rnorm(4000), y= rnorm(2000)) %>% 
  ggplot(aes(x ,y))+
  geom_point()-> overplotted

ggplot(diamonds, aes(price,table))+ 
  geom_point(aes(colour = color))-> scatter_plot

ggplot(airquality, aes(Day,Wind, fill = Month))+
  geom_bar(stat = 'identity')+
  theme(panel.background = element_rect(fill = rgb(1,1,1),
                                        colour = "lightblue",
                                        size = 0.5, linetype = "solid") ) -> ugly_barplot

ggplot(airquality, aes(Day,Wind))+
  geom_bar(stat = 'identity') -> full_barplot

barplot+
  theme(panel.background = element_rect(fill = rgb(1,1,1),
                                        colour = "lightblue",
                                        size = 0.5, linetype = "solid") )+
  labs(title = "my$value",x = "find_it", y = ":) smile")-> bad_labels

ggplot(airquality, aes(Day,Wind, label= Month))+
  geom_point()-> no_text_plot

no_text_plot + 
  geom_text()->text_plot

no_text_plot+
  geom_smooth()->smoothed_chart

## create a data frame to run the classification algo


