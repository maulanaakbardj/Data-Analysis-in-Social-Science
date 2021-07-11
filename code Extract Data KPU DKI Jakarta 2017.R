# Install Libraries/packages

#install.packages("dplyr")
#install.packages("tidyverse")
#install.packages("ggplot2")
#install.packages("jsonlite")

# Import library

library(dplyr)
library(tidyverse)
library(ggplot2)
library(jsonlite)

#cek dir
getwd()

#change dir
setwd("D:/Data/Riset/R for Data Analysis in Social Science (Extract Data KPU & Twitter Petinggi Negara)")

#json execution
kpu_result <- fromJSON("https://pilkada2017.kpu.go.id/api/1/hasil.json") #data hasil pilkada 2017 dari kpu.go.id
kpu_result

#only show DKI Jakarta
DKI_Jakarta <- subset(kpu_result, subset = namaPropinsi == "DKI JAKARTA")

#total vote
total_vote_DKI <- sum(DKI_Jakarta["jumlahSuara"])
total_vote_DKI

#Plot for governor votings
votings <- ggplot(data = DKI_Jakarta,
                  mapping = aes(x = namaKd,
                                y = jumlahSuara,
                                color = namaKd)) +
  geom_line(size=4)+geom_bar(stat="identity",fill="white", width=0.5) + 
  geom_text(aes(label=jumlahSuara), vjust=1.6, color="black",
            position = position_dodge(0.9), size=3.5) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 12, color="darkred"))

print(votings)  
