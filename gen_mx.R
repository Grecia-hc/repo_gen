getwd()

dir()

library(tidyverse)
library(lubridate)

gen_mx <- read.csv("gen_ago_2021.csv", skip=8)

class(gen_mx)

gen_long <- gen_mx %>% 
  gather(key = Tipo, value = Generación, - Sistema, Dia, Hora)
         
#Eolica, Fotovoltaica, Biomasa, Carboelectrica, `Ciclo Combinado`,
#`Combustion Interna`, Geotermoelectrica, Hidroelectrica, Nucleoelectrica,
#`Termica Convencional`, `Turbo Gas`  
  
#select(Dia, Hora, Tipo) %>% 
#rename(
# day = Día,
# hour = Hora,
# source = Tipo,
# gen = Generación
# ) 
#%>% 
# count()
  
mutate(source = case_when(source == "Biomasa" ~ "Biomasa",
                          source == "Carboelectrica" ~ "Carbon".
                          source == "Ciclo Combinado" ~ "Gas",
                          source == "Combustion Interna" ~ "Petroleo",
                          Source == "Eolica" ~ "Viento",
                          source == "Fotovoltaica" ~ "Sol",
                          source == "Geotermoelectrica" ~ "Geotermia",
                          source == "Hidroelectrica" ~ "Agua",
                          source == "Nucleoelectrica" ~ "Nuclear",
                          source == "Termica Convencional" ~ "Petroleo",
                          source == "Turbo Gas" ~ "Petroleo"
                          ))
#count (source)




