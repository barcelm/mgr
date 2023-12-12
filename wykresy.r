####biblioteki####
setwd("C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/R")
library(dplyr)
library(lubridate)
library(remotes)
#install.packages("ggplot2")
library(ggplot2)
library(openxlsx)
library(tidyr)
#install.packages("tidyr")
library(scales)
library(ggplot2)
library(patchwork)
library(hrbrthemes)
#install.packages("patchwork") 
#install.packages("hrbrthemes")
#install.packages("scales")

#####
sciezka = "C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane"

# sciezka_hydro = "/DANE HYDRO/przekształcone/"
# sciezka_meteo = "/DANE METEO/przekształcone/" 

setwd("C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE HYDRO/przekształcone")
#nazwy_stacji_hydro = dir()
#saveRDS(nazwy_stacji_hydro,"stacje_hydro.rds")
# nazwy_stacji_hydro <- readRDS(file = "stacje_hydro.rds")
# 
# setwd("C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE METEO/przekształcone")
# #nazwy_stacji_meteo = dir()
# #saveRDS(nazwy_stacji_meteo,"stacje_meteo.rds")
# nazwy_stacji_meteo <- readRDS(file = "stacje_meteo.rds")

setwd("C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/R")
nazwy_stacji_meteo
stacjeHydro = c('Bóbr', 'Brda', 'Bystrzyca', 'Czarna Hancza', 'Czarna Nida', 'Dunajec',
                 'Guber', 'Ina', 'Liwiec', 'Łyna', 'Mogilnica', 'Ner', 'Ołobok', 'Sama', 'Supraśl')
stacje_meteo = c('bobr_m', 'brda_m', 'bystrzyca_m', 'czarna_hancza_m', 'czarna_nida_m', 'dunajec_m',
                 'guber_m', 'ina_m', 'liwiec_m', 'lyna_m', 'mogilnica_m', 'ner_m', 'olobok_m', 'sama_m', 'suprasl_m')

nb_rows = 1:367
nb_cols = 1:74
i=1

hydro = list()
str(stacje_hydro)

setwd("C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE HYDRO/przekształcone")

for(i in 1:15) {
  
  hydro[[i]] = read.xlsx(xlsxFile = nazwy_stacji_hydro[i], sheet = 2,colNames = T,rows = 1:367)
  
  
  i=i+1
}

meteo_T_max = list()
meteo_T_min = list()
meteo_T_sr = list()
meteo_P_c = list()
meteo_P_w = list()
meteo_P_s = list()
pokrywa_s = list()
rownowaznik_Ws = list()

i=1
setwd("C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE METEO/przekształcone")
for(i in 1:15) {
  
  meteo_T_max[[i]] = read.xlsx(xlsxFile = nazwy_stacji_meteo[i], sheet = 2,colNames = T,rows = nb_rows)
  meteo_T_min[[i]] = read.xlsx(xlsxFile = nazwy_stacji_meteo[i], sheet = 2,colNames = T,rows = (nb_rows = nb_rows+369))
  meteo_T_sr[[i]] = read.xlsx(xlsxFile = nazwy_stacji_meteo[i], sheet = 2,colNames = T,rows = (nb_rows = nb_rows+369))
  meteo_P_c[[i]] = read.xlsx(xlsxFile = nazwy_stacji_meteo[i], sheet = 2,colNames = T,rows = (nb_rows = nb_rows+369), cols = nb_cols)
  meteo_P_w[[i]] = read.xlsx(xlsxFile = nazwy_stacji_meteo[i], sheet = 2,colNames = T,rows = nb_rows, cols = (nb_cols = nb_cols+75))
  meteo_P_s[[i]] = read.xlsx(xlsxFile = nazwy_stacji_meteo[i], sheet = 2,colNames = T,rows = nb_rows, cols = (nb_cols = nb_cols+75))
  pokrywa_s[[i]] = read.xlsx(xlsxFile = nazwy_stacji_meteo[i], sheet = 2,colNames = T,rows = (nb_rows = nb_rows+369*2))
  rownowaznik_Ws[[i]] = read.xlsx(xlsxFile = nazwy_stacji_meteo[i], sheet = 2,colNames = T,rows = (nb_rows = nb_rows+369))
  
  i=i+1
  nb_rows = 1:367
  nb_cols = 1:74
}
# przeplywy_bobr_zagan = read.xlsx(xlsxFile = "C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE HYDRO/przekształcone/przekształcone bóbr - żagań.xlsx",
#           sheet = 2,colNames = T,rows = 1:367)
# 
# 
# temp_max_bobr = read.xlsx(xlsxFile = "C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE METEO/przekształcone/przekształcone jelenia góra - bóbr.xlsx",
#                        sheet = 2, colNames = T,rows = nb_rows)
# 
# temp_min_bobr = read.xlsx(xlsxFile = "C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE METEO/przekształcone/przekształcone jelenia góra - bóbr.xlsx",
#                           sheet = 2, colNames = T,rows = (nb_rows = nb_rows+369))
# 
# temp_sr_bobr = read.xlsx(xlsxFile = "C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE METEO/przekształcone/przekształcone jelenia góra - bóbr.xlsx",
#                           sheet = 2, colNames = T,rows = (nb_rows = nb_rows+369))
# 
# opad_c_bobr = read.xlsx(xlsxFile = "C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE METEO/przekształcone/przekształcone jelenia góra - bóbr.xlsx",
#                           sheet = 2, colNames = T,rows = (nb_rows = nb_rows+369))
# 
# opad_w_bobr = read.xlsx(xlsxFile = "C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE METEO/przekształcone/przekształcone jelenia góra - bóbr.xlsx",
#                         sheet = 2, colNames = T,rows = nb_rows, cols = (nb_cols = nb_cols+75))
# opad_s_bobr = read.xlsx(xlsxFile = "C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE METEO/przekształcone/przekształcone jelenia góra - bóbr.xlsx",
#                         sheet = 2, colNames = T,rows = nb_rows, cols = (nb_cols = nb_cols+75))
# 
# pokrywa_s_bobr = read.xlsx(xlsxFile = "C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE METEO/przekształcone/przekształcone jelenia góra - bóbr.xlsx",
#                         sheet = 2, colNames = T,rows = (nb_rows = nb_rows+369*2))
# 
# rownowaznik_ws_bobr = read.xlsx(xlsxFile = "C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/dane/DANE METEO/przekształcone/przekształcone jelenia góra - bóbr.xlsx",
#                            sheet = 2, colNames = T,rows = (nb_rows = nb_rows+369))
stacje_meteo
meteo_T_max[[1]][2]

j = 2
# plot(x = hydro[[1]][c(1:j)],type = 'l',lwd = 3 ,ylab = "Przepływ [m3/s]", xlab = "Dzień roku hydrologicznego",
#      main = colnames(meteo_T_max[[1]][j]), xlim = c(1, 160),ylim = c(0,60))
# axis(4, at = c(0, 100), labels = rev(c(0,100)), lwd = 1)
# par(new = T)
# lines(x = pokrywa_s[[1]][[j]], type = 'h', col = 'darkgray', lwd = 6)
# lines(x = meteo_P_w[[1]][[j]], type = 'h', col = 'lightblue', lwd = 4)
# lines(x = meteo_P_s[[1]][[j]], type = 'h', col = 'lightgray', lwd = 4)
# lines(x = meteo_T_max[[1]][[j]], type = 'l', col = 'red')
# lines(x = meteo_T_min[[1]][[j]], type = 'l', col = 'blue')
# lines(x = meteo_T_sr[[1]][[j]], type = 'l', col = 'gray')

graphics.off()

setwd("C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/R")


meteo_proba = meteo_T_max

nazwy_meteo <- list()
j = 2
m=2
k = 1951

i=1
while (i<16){ 
  while (k<2023){ 
  nazwa <- paste0("Pok_s_",k)
  names(pokrywa_s[[i]])[m] <- nazwa
  k=k+1
  m=m+1
  }
    i=i+1
    m=2
    k=1951
}
setwd("C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/R")

saveRDS(stacjeHydro,"stacjeHydro.rds")
####dane####
setwd("C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/R")

meteo_T_max = readRDS("MeteoTMAX.rds")
meteo_T_min = readRDS("MeteoTMIN.rds")
meteo_T_sr = readRDS("MeteoTSR.rds")
meteo_P_c = readRDS("MeteoPc.rds")
meteo_P_w = readRDS("MeteoPw.rds")
meteo_P_s = readRDS("MeteoPs.rds")
pokrywa_s = readRDS("MeteoPokr.rds")
rownowaznik_Ws = readRDS("MeteoRown.rds")
hydro = readRDS("hydro.rds")
stacjeHydro = readRDS("stacjeHydro.rds")
data = data.frame(0:180)
######

# meteo_proba = pokrywa_s
# while (i<length(meteo_proba[[1]][[1]])) {
#   
# 
# meteo_prob <- replace(meteo_proba[[1]][[1]][[i]], meteo_proba[[1]][[1]][[i]]==0,NA)
# i = i+1
# }
# pokrywa_s[[]]
# meteo_proba[[1]][[2]][[81]]
# meteo_proba[[1]][[15]]

####wykresy#####
j = 2
i=1
m=2
k = 1951
ggplot(hydro[[1]], aes(x = hydro[[1]][[1]], y = hydro[[1]][[j]])) +
  geom_line(lwd = 1, ) +
  ggtitle(k) +
  theme_ipsum() +
  scale_x_continuous(name = "Dni w roku hydrologicznym", limits = c(1,160)) +
  scale_y_continuous( name = "Przepływ [m3/s], Temperatura [*C]", limits = c(-25,55),
                     sec.axis = sec_axis(~ . *3,breaks = seq(0,100,20), name = "Opad [mm], Pokrywa śnieżna [cm]")) +
  geom_col(data = pokrywa_s[[1]], mapping = aes(x=pokrywa_s[[1]][[1]], y= pokrywa_s[[1]][[j]]/3), color = 'lightgray', 
           lwd = 3, na.rm = T)+
  geom_col(data = meteo_P_s[[1]], mapping = aes(x=meteo_P_s[[1]][[1]], y= meteo_P_s[[1]][[j]]/3), color = 'darkgray',
           lwd = 1)+
  geom_line(data = data,mapping = aes(x=c(0:160), y=0), lwd = 2.2)+
  geom_line(data = meteo_T_max[[1]], mapping = aes(x=meteo_T_max[[1]][[1]], y = meteo_T_max[[1]][[j]]), color = 'red',
            lwd = 1)+
  geom_line(data = meteo_T_min[[1]], mapping = aes(x=meteo_T_min[[1]][[1]], y = meteo_T_min[[1]][[j]]), color = 'blue',
            lwd = 1)+
  geom_line(data = meteo_T_sr[[1]], mapping = aes(x=meteo_T_sr[[1]][[1]], y = meteo_T_sr[[1]][[j]]), color = 'green',
            lwd = 1)

######drukowanie#####
#m=2
#n=1
#dane <- data.frame(grupa = c("Przepływ [m3/s]", "Temperatura średnia [*C]", "Zakres temperatur maksymalnych i minimalnych [*C]",
#                   "Opad deszczu [mm]", "Opad śniegu [mm]", "Pokrywa śnieżna [cm]"))

setwd("C:/Users/bartlomiej.sobczyk/Desktop/Magisterka Bartłomiej Sobczyk/R/wykresy")
j = 2
i=1
k = 1951
while (i<16){ 
  while (k<2023){ 
   
    wys1 <- max(pokrywa_s[[i]][[j]][1:180], na.rm = TRUE)
    wys2 <- max(meteo_P_c[[i]][[j]][1:180], na.rm = TRUE)
    #wys3 <- max(meteo_T_max[[i]][[j]][1:180], na.rm = TRUE)
    wys4 <- max(hydro[[i]][[j]][1:180], na.rm = TRUE)#*2
    # if (wys1 > wys4 || wys2 > wys4 || wys3 > wys4) {
    #   wys5 <- max(c(wys1, wys2, wys3))/2
    # } else {
    #   wys5 <- max(hydro[[i]][[j]][1:180], na.rm = TRUE)
    # }
    if ((wys4) >= 400) {
      wys = 450
      os = 0.5
      t = 3
    } else if((wys4) >= 300){
      wys = 400
      os = 0.5
      t = 3
    } else if((wys4) >= 200){
      wys = 300
      os = 0.5
      t = 3
    } else if((wys4) >= 100){
      wys = 200
      os = 0.5
      t = 3
    } else if((wys4) >= 50){
      wys = 100
      os = 1
      t = 2
    } else if(wys4 < 50){
      wys = 50
      os = 2
      t = 1
    } 
    
    # wys <- ceiling(wys5/10) *10
    wys_temp = floor(min(meteo_T_min[[i]][[j]][1:180],na.rm = T)/10)*10
    
    p <- ggplot(hydro[[1]], aes(x = hydro[[1]][[1]], y = hydro[[i]][[j]])) +
      geom_line(lwd = 1, color = "darkblue") +
      ggtitle(paste(k)) +
      theme_ipsum() +
      # geom_rect(aes(xmin = -Inf, ymin = -Inf, xmax = Inf, ymax = Inf),
      #           fill = "lightgray", alpha = 0.01)+
      scale_x_continuous(name = "Dni w roku hydrologicznym", limits = c(1,180),breaks = seq(0,180,10)) +
      scale_y_continuous( name = "Przepływ [m3/s]", limits = c(wys_temp*t,wys), breaks = seq(0,wys,10/os),
                          sec.axis = sec_axis(~ . *os,breaks = seq(wys_temp,100,10), name = "Opad [mm], Pokrywa śnieżna [cm], Temperatura [*C]")) +
      geom_col(data = pokrywa_s[[1]], mapping = aes(x=pokrywa_s[[1]][[1]], y= pokrywa_s[[i]][[j]]/os), fill = 'darkgray', 
               width = 1, na.rm = T, alpha = 0.92)+
      geom_ribbon(aes(ymin = meteo_T_min[[i]][[j]]/os, ymax = meteo_T_max[[i]][[j]]/os),color = "orange",lwd = 0.01 ,fill = 'orange', alpha = 0.15)+
      geom_col(data = meteo_P_w[[1]], mapping = aes(x=meteo_P_w[[1]][[1]], y= meteo_P_w[[i]][[j]]/os), fill = 'lightblue',
                width = 1, alpha = 0.9, color = "blue", lwd = 0.2)+
      geom_col(data = meteo_P_s[[1]], mapping = aes(x=meteo_P_s[[1]][[1]], y= meteo_P_s[[i]][[j]]/os), fill = 'purple',
               width = 0.2, alpha = 0.9, color = "purple")+
      geom_line(data = data,mapping = aes(x=c(0:180), y=0), lwd = 1)+
      geom_line(data = meteo_T_sr[[1]], mapping = aes(x=meteo_T_sr[[1]][[1]], y = meteo_T_sr[[i]][[j]]/os), color = 'lightgreen',
                lwd = 0.4)+
      labs(caption = "Opracowanie własne.", tag = stacjeHydro[i])
      
     ggsave(filename = paste(stacjeHydro[i],"_",k,".jpg",sep = "",collapse = ""),plot = p,width = 10,height = 8,dpi = 300)
    
  print(paste(stacjeHydro[i],"-",k))
    k=k+1
    j=j+1
    #m=2
    #n=1
  }
  i=i+1
  j=2
  k=1952
  
}


