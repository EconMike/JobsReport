
#load packages

library(tidyverse)
library(readxl)
library(ggplot2)
library(forcats)
setwd("G:/YOUR DIRECTORY/Jobs REport")

df<-read_excel("CES.xlsx", sheet = "aprdata")
class(df)
head(df)

df2<- df%>%mutate(net=Dif*1000)
df3<-df2%>%mutate(rounded = round(net, 0))%>%arrange((net))


df3

df3%>%ggplot( aes(x=reorder(Industry, rounded), y=rounded,fill = rounded>0))+
  geom_bar(stat="identity",show.legend = FALSE) +coord_flip()+
  geom_text(aes(label = rounded),size =3, vjust = 1,hjust=1,family = "sans",fontface ="bold")+
  scale_y_continuous(limits = c(-150000,300000), expand = c(0, 0))+labs(title = "March jobs one-month net change",subtitle="Seasonally Adjusted",
                             caption = "Source:Bureau of Labor Statistics")+theme_bw()+
  theme(axis.text.x = element_blank(),axis.title.x = element_blank(),
        axis.title.y = element_blank(),plot.caption = element_text(hjust = 0),plot.title = element_text(size = 15,face = "bold"),
        axis.ticks.x=element_blank())+
  scale_fill_manual(values = c("Red", "#0072B2"))
  

  
ggsave("AprilCES.png")



