datos.peliculas <- read.csv(file.choose())
head(datos.peliculas)

colnames(datos.peliculas) <- c("Pelicula", "Genero", "RatingCriticos", "RatingAudiencia", "PresupuestoMillones", "A�o")
head(datos.peliculas)
tail(datos.peliculas)

str(datos.peliculas)
#Esto no s del curso, pero fue necesario abrir el paquete dplry, un edetor de gram�tica de datos,
#para as� poder poner como factores los datos character del documento proporcionado.
#Lo que hace es usa la funci�n mutate_at() para poder cambiar el tipo de dato de character a factor
library(dplyr)
datos.peliculas <- mutate_at(datos.peliculas, vars(Genero), as.factor)
datos.peliculas <- mutate_at(datos.peliculas, vars(Pelicula), as.factor)
str(datos.peliculas)

summary(datos.peliculas)

#Ahora al parecer nos est�n ense�and como alterar esto pero sin necesidad del tidyverse 
#Esto mediante factor()
factor(datos.peliculas$A�o)
datos.peliculas$A�o <- factor(datos.peliculas$A�o)
summary(datos.peliculas)
str(datos.peliculas)

#Por esto anterior, podemos ver que pudimos haber hecho lo siguiente de en lugar de alterar los datos mediante dplyr
datos.peliculas$A�o <- factor(datos.peliculas$A�o)





