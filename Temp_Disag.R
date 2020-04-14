#
## Desagregación temporal del PIB        
#

pib <- read.csv(paste(path, "PIB.csv", sep = ""), row.names = 1)

pib <- ts(pib, start = c(as.numeric(year), (as.numeric(month)-1)/3), 
          frequency = 4)

pib_m <- predict(td(pib ~ datos[,"igae"] + 0, conversion = "average", 
                    to = "monthly", method = "denton-cholette"))


# Grafica del PIB mensual
ts.plot(pib_m)