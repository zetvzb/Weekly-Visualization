#Rain Cloud Visualization, a ggplot2 extension
#https://cran.r-project.org/web/packages/gghalves/index.html

library(ggplot2)
library(gghalves)
#Create Dataset with noise. 
MilesTraveled_1 = data.frame(rnorm(n = 2500,mean = 800, sd = 139))
MilesTraveled_2 = data.frame(rnorm(n = 2500,mean = 1155, sd = 248))
MilesTraveled_3 = data.frame(rnorm(n = 2500,mean = 355, sd = 50))
MilesTraveled_4 = data.frame(rnorm(n = 2500,mean = 610, sd = 213))
colnames(MilesTraveled_1) <- "MilesTraveled"
colnames(MilesTraveled_2) <- "MilesTraveled"
colnames(MilesTraveled_3) <- "MilesTraveled"
colnames(MilesTraveled_4) <- "MilesTraveled"
MilesTraveled_1$AirlineName = 'Southwest'
MilesTraveled_2$AirlineName = 'Delta'
MilesTraveled_3$AirlineName = 'American'
MilesTraveled_4$AirlineName = 'United'
Airline = rbind(MilesTraveled_1, MilesTraveled_2, MilesTraveled_3, MilesTraveled_4)

#Create Rain Cloud Viz
ggplot(Airline, aes(y = MilesTraveled, x =  AirlineName, color = AirlineName))+ 
  geom_half_point(side = "l", size = 0.3) +
  geom_half_boxplot(side = "l", width = 0.5, alpha = 0.3, nudge = 0.1) +
  geom_half_violin(aes(fill =  MilesTraveled),side = "r") + guides(fill = FALSE, color = FALSE) +
  ggtitle("Airline Rainclouds")+ 
  labs(x = "Airline Name", y = "Miles Traveled")+ 
 coord_flip()
       

