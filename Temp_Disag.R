################################################
# Con este código se pueden pronósticar series de tiempo multivariadas
#
## Funciones de transferencia para pronosticar el IPC utilizando el precio del petróleo
#
# Hecho por Mauricio Montiel el 14/04/2020
###############################################

#librerías
library(readxl)
library(tidyverse)
library(tseries)
library(urca)
library(forecast)
library(tempdisagg)

# Preliminares
remove(list = ls())
setwd("~/GitHub/Forecasting/Desagregacion-Temporal-PIB")

# Importar datos
datos <- read.csv("PIB.csv")
pib <- ts(datos[,1], start = c(1997, 2), end=c(2019,3), 
          frequency = 4)

igae <- ts(datos[,2], start = c(1997, 7), 
          frequency = 12)
x11()
ts.plot(igae)

pib_m <- predict(td(pib ~ igae + 0, conversion = "average", 
                    to = "monthly", method = "denton-cholette"))

# Grafica del PIB mensual
ts.plot(pib_m)
