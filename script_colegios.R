#importar archivo .dbf----
#install.packages("foreign")
library(foreign)
#seter la ubicacion del archivo
#setwd("/Users/Cristian/Documents/")
#guardar datos en un dat
#padron_web <-read,dbf(Padron_web.dbf)
padron_web<-read.dbf("/Users/Cristian/Documents/Padron_web.dbf")
class(padron_web) # clase de objeto
names(padron_web) # encabezado del data frame (variables o campos)
str(padron_web) # tipo de variable y algunos valores
attributes(padron_web)
attributes(padron_web$D_DPTO)
attributes(padron_web$NIV_MOD)
padron_web$GESTION |> attr('label')

library(tidyverse)
colegios_dpto <-padron_web |> 
  group_by(D_DPTO) |> 
  summarise(n_distinct(COD_MOD))
view(colegios_dpto)

padron_web |> 
  summarise(conteo_dif=n_distinct(COD_MOD), conteo=n())
