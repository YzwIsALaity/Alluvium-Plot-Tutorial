# Packages
library(tidyr)
library(dplyr)
library(ggplot2)
library(ggalluvial)
library(knitr)

Dt <- read.csv('Alluvium Plot_1.csv')
kable(head(Dt))

# Set time as a factor
Dt$Time <- factor(Dt$Time, levels = c('Acute', '6-month', '12-month', '24-month'))
# Plot
ggplot(Dt, aes(x = Time, stratum = Specialist, alluvium = PTID, fill = Specialist, label = Specialist)) +
  geom_flow(stat = "alluvium") 

ggplot(Dt, aes(x = Time, stratum = Specialist, alluvium = PTID, fill = Specialist, label = Specialist)) +
  geom_stratum(alpha = 0.7) # "alpha = 0.7" is used to control the transparency of color filled in strata

# Version 1.0
ggplot(Dt, aes(x = Time, 
               stratum = Specialist, 
               alluvium = PTID, 
               fill = Specialist, 
               label = Specialist)) +
  geom_flow(stat = "alluvium") + 
  geom_stratum(alpha = 0.7) + 
  xlab('Visit Timepoint') + ylab('Count') + 
  scale_fill_brewer(type = "div", palette = "Set2") + 
  theme_bw() +                                                      
  theme(panel.border = element_blank(),                             
        panel.background = element_blank(),                    
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line.x = element_line(),                               
        axis.line.y = element_line(),
        axis.text.x = element_text(colour = "black", size = 11, family = "Times"),    
        axis.text.y = element_text(colour = "black", size = 11, family = "Times"),
        axis.ticks.x = element_line(),                              
        axis.ticks.y = element_line(),
        axis.title.x = element_text(colour = "black", face = "bold",size = 11, family = "Times"),                               
        axis.title.y = element_text(colour = "black", face = "bold",size = 11, family = "Times"),
        legend.text = element_text(size = 11, color = 'black',family = "Times"),
        legend.title = element_text(size = 13, face = "bold", color = 'black', family = "Times"),
        plot.title = element_text(face = "bold", family = "Times"))

Dt2 <- read.csv('Alluvium Plot_2.csv')
kable(head(Dt2))

# Set the Time as a factor 
Dt2$Time <- factor(Dt2$Time, levels = c(paste0(2019, '-', c(3,6,9,12)), paste0(2020, '-', c(3,6,9,12))))
# Version 2.0
ggplot(data = Dt2,
       aes(x = Time, 
           y = Count, 
           alluvium = Virus)) +
  geom_alluvium(aes(fill = Virus, colour = Virus),
                alpha = 0.7, decreasing = FALSE) +
  scale_fill_brewer(type = "qual", palette = "Set3") +
  scale_color_brewer(type = "qual", palette = "Set3") +
  theme_bw() +                                                      
  theme(panel.border = element_blank(),                             
        panel.background = element_blank(),                    
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line.x = element_line(),                              
        axis.line.y = element_line(),
        axis.text.x = element_text(colour = "black", size = 11, family = "Times", angle = -45),
        axis.text.y = element_text(colour = "black", size = 11, family = "Times"),
        axis.ticks.x = element_line(),                            
        axis.ticks.y = element_line(),
        axis.title.x = element_text(colour = "black", face = "bold", size = 11, family = "Times", vjust = -2),                               
        axis.title.y = element_text(colour = "black", face = "bold",size = 11, family = "Times"),
        legend.text = element_text(size = 11, color = 'black', family = "Times"),
        legend.title = element_text(size = 13, face = "bold", color = 'black', family = "Times"),
        plot.title = element_text(face = "bold", family = "Times"))













