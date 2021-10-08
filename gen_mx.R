getwd()

dir()

library(tidyverse)
library(lubridate)

gen_mx <- read_csv("gen_ago_2021.csv", skip=7)

class(gen_mx)

#Eolica, Fotovoltaica, Biomasa, Carboelectrica, `Ciclo Combinado`,
#`Combustion Interna`, Geotermoelectrica, Hidroelectrica, Nucleoelectrica,
#`Termica Convencional`, `Turbo Gas`  

gen_long <- gen_mx %>% 
  gather(key = Tipo, value = Gen, -Sistema, -Dia, -Hora) %>% 
 select(Dia, Hora, Tipo, Gen)%>% 
rename(
 day = Dia,
 hour = Hora,
 source = Tipo,
 gen = Gen
 )%>% 
count(source)%>% 
mutate(source = case_when(source == "Biomasa" ~ "Biomasa",
                          source == "Carboelectrica" ~ "Carbon",
                          source == "Ciclo Combinado" ~ "Gas",
                          source == "Combustion Interna" ~ "Petroleo",
                          source == "Eolica" ~ "Viento",
                          source == "Fotovoltaica" ~ "Sol",
                          source == "Geotermoelectrica" ~ "Geotermia",
                          source == "Hidroelectrica" ~ "Agua",
                          source == "Nucleoelectrica" ~ "Nuclear",
                          source == "Termica Convencional" ~ "Petroleo",
                          source == "Turbo Gas" ~ "Petroleo"
                          ))

gen_long %>%
  count(source)




