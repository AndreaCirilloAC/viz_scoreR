score <- 1

df <- mtcars[, c(1,3,4,5,6,7)]
# 1. Compute correlation
cormat <- round(cor(df),2)
# 2. Reorder the correlation matrix by 
# Hierarchical clustering
hc <- hclust(as.dist(1-cormat)/2)
cormat.ord <- cormat[hc$order, hc$order]
# 3. Get the upper triangle
cormat.ord[lower.tri(cormat.ord)]<- NA
# 4. Melt the correlation matrix
require(reshape2)
melted_cormat <- melt(cormat.ord, na.rm = TRUE)
# Create the heatmap
ggplot(melted_cormat, aes(Var2, Var1, fill = value))+
  geom_tile(color = "white")+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab",
                       name="Pearson\nCorrelation") + # Change gradient color
  theme_minimal()+ # minimal theme
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1))+
  coord_fixed()->correlation_plot
