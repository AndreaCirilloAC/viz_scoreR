score <- 0
# Download data from the web
URL = "http://datasets.flowingdata.com/"
data = "crimeRatesByState2005.tsv"
crime <- read.csv(paste0(URL, data), header=TRUE, sep="\t")
# Change column for legend text
names(crime)[names(crime) == "population"] <- "Population"
# Create bubble chart using geom_point
ggplot(crime, aes(murder, burglary, size=Population/1000, label=state)) +
  geom_smooth(fill="plum2", color="steelblue1", size = 0.75, alpha = 0.25, show_guide = FALSE) +
  geom_point(color="green3", alpha = 0.75) +
  scale_size(range=c(6,40)) +
  geom_text(size=4, hjust=-.15, vjust=.2) +
  labs(title = expression(atop(bold("Crimes By State"),
                               atop(italic("Loess Model Fit and C.I."), ""))),
       x = "Murders per 100,000 Population",
       y = "Burglaries per 100,000 Population") +
  theme(plot.title = element_text(size = 20),
        axis.title.y = element_text(size = 14, vjust = .25, face = "bold"),
        axis.text.y = element_text(size = 12, color= "grey15"),
        axis.title.x = element_text(size = 14, vjust = -0.25, face= "bold"),
        axis.text.x = element_text(size = 12, color = "grey15"), legend.key = element_rect(fill = "white", colour = "white"),
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 12),
        panel.border = element_rect(fill = NA, colour = "plum4"))-> the_beast
