?read.csv()

#M�todo 1 o por selecci�n manual del archivo
datos <- read.csv(file.choose())
datos

#M�todo 2 o por directorio de trabajo (working directory)
getwd()
?setwd()
#NOTA, se debe reemplazar \ por \\, si no es incapaz de encontrar la direcci�n!!!!!
setwd("C:\\Users\\Auch\\Downloads\\Datos de trabajo")
getwd()
rm(datos)
datos <-read.csv("DatosDemograficos.csv")


#Explorando los datos
datos

#N�mero de filas y columnas del archivo mediante nrow() y ncol()
nrow(datos)
ncol(datos)

#Para ir visualizando c�mo van a estar acomodados los datos, o querer ver el nombre de las columnas r�pidamente
#Se puede usar head() que da las primeras 6 filas, o tail() que da las �ltimas 6.
head(datos)
tail(datos)

#Como se dijo, por default te da 6 filas, pero se puede decidir el N de filas
head(datos, 15)
head(datos, 40)
tail(datos, 4)
tail(datos, 2)

#Para saber la estructura del marco de datos. Esto nos indica el tipo de datos, los c�digos de las variables,
#si hay factores (variables con N niveles), el # de filas y columnas, etc.
str(datos)

#Este hace un resumen por columnas de los datos, incluse te dad m�n, m�x, 1� y 3� intercuartil, mediana, y media
summary(datos)


