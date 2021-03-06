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

#Est�ticas

library(ggplot2)
ggplot(data=datos.peliculas, aes(x=RatingCriticos, y=RatingAudiencia))

#Al aplicar esto anterior solamente se obtiene el eje (x,y), pero no obtenemos nada m�s
#Esto se debe a que las est�ticas solo van a generar la relaci�n entre los datos y el gr�fico pero no el gr�fico en s�


#Geometr�as

ggplot(data=datos.peliculas, aes(x=RatingCriticos, y=RatingAudiencia))+
  geom_point()

#Para agregar color usamos aes()

ggplot(data=datos.peliculas, aes(x=RatingCriticos, y=RatingAudiencia, color=Genero))+
         geom_point()

#Para poder alterar el tama�o de los puntos
ggplot(data=datos.peliculas, aes(x=RatingCriticos, y=RatingAudiencia, color=Genero, size= PresupuestoMillones))+
  geom_point()


#Graficando con Capas
#Primero vamos a convertir nuestro c�digo de ggplot en un objeto

A <- ggplot(data=datos.peliculas, aes(x=RatingCriticos, y=RatingAudiencia, color=Genero, size= PresupuestoMillones))

#Si corremos A tendremos solamente un gr�fico sin puntos
A
#As� tendremos de nuevo el �ltimo gr�fico de la secci�n anterior
A + geom_point()

#Lo mismo pero con l�neas
A + geom_line()

#Podemos combinar las capas, en este caso las l�nea y los puntos
A + geom_line() + geom_point()

#El orden de las capas es importante como lo ilustra la siguiente gr�fica donde no se ven los puntos por ponerlos primero
A + geom_point() + geom_line()


#Sobreescribiendo est�ticas

B <- ggplot(data= datos.peliculas, aes(x = RatingCriticos, y = RatingAudiencia, 
                                       size= PresupuestoMillones, color=Genero))
B + geom_point()

#Debido a que geom_point es una capa sobre el objeto, nosotros podemos sobreescribir las est�ticas derivadas del objeto

B + geom_point(aes(size=RatingCriticos))

B + geom_point(aes(color=PresupuestoMillones))
#Como se ve, la etiqueta de g�nero que pertenec�a a B se mantiene aunque hayamos cambiado el color en la capa. Esto es porque el objeto se mantiene y como una capa de pintura esta no altera al objeto

#Este mismo fen�meno se observa en el siguiente ejemplo, nuestra capa original de est�tica se mantendr�.
#Se mantuvieron los RatingCriticos, a pesar de que la geometr�a dice lo contrario
B + geom_point(aes(x= PresupuestoMillones))

#Una soluci�n a esto es por medio de xlab()
B + geom_point(aes(x= PresupuestoMillones)) + xlab("PresupuestoMillones")


#Volviendo al ejemplo de las l�neas, podemos modificar su tama�o para que se puedan ver los puntos f�cilmente
B + geom_line(size= 1) + geom_point()


#Mapear contra Establecer
C <- ggplot(data= datos.peliculas, aes(x=RatingCriticos, y=RatingAudiencia))
C + geom_point()

#Agregado de color por mapeo y estableciendo
#Mapeo qua involucra el cambio de algo en funci�n de una variable y depende de aes()
C + geom_point(aes(color=Genero))
C + geom_point(aes(size= PresupuestoMillones))

#Estableciendo, es directo y no depende de la variable
C + geom_point(color="Darkgreen")
C + geom_point(color= "Blue")
C + geom_point(size= 4)

#ERROR
C + geom_point(aes(color="Darkgreen"))
C + geom_point(aes(size= 20))
      
#Histogramas y diagramas de densidad
D <- ggplot(data=datos.peliculas, aes(x=PresupuestoMillones)) 
D + geom_histogram(binwidth =  10)

#Agregar color
D + geom_histogram(binwidth =  10, fill ="red") #Establecer
D + geom_histogram(binwidth = 10, aes(fill = Genero))

#Agregar borde
D + geom_histogram(binwidth = 10, aes(fill = Genero), color ="black")

#Gr�ficos de densidad
D +geom_density()
D +geom_density(aes(fill= Genero))
D +geom_density(aes(fill= Genero), position = "stack")


#Tips de capa inicial
E<- ggplot(data=datos.peliculas, aes(x=RatingAudiencia))
E + geom_histogram(binwidth = 10, fill="White")
E + geom_histogram(binwidth = 10, fill="White", color="pink")

#Otra opci�n es dejar las est�ticas para despu�s
E <- ggplot(data=datos.peliculas)
E + geom_histogram(aes(x=RatingAudiencia),
  binwidth = 10, fill="White", color="pink")
E + geom_histogram(aes(x=RatingCriticos),
                   binwidth = 10, fill="White", color="pink")

#Una �ltima opci�n es dejar el esqueleto de ggplot sin nada
E <- ggplot()


#Transformaciones estad�sticas
#Geom_smooth()
#Mediante estas l�neas geom_smooth permite observar patrones que ser�an complicados de ver cuando los datos est�n dispersos

G <- ggplot(data= datos.peliculas, aes(x= RatingCriticos, y= RatingAudiencia,
            color= Genero))
G + geom_point() + geom_smooth(fill=NA)

#Geom_boxplot

G2 <- ggplot(data=datos.peliculas, aes(x= Genero, y= RatingCriticos,
                                       color= Genero))
#Otras opciones de geom_boxpot
G2 + geom_boxplot(size= 2) + geom_point()
G2 + geom_boxplot(size=2) + geom_jitter()


#Usando Facetas
H <- ggplot(data=datos.peliculas, aes(x= PresupuestoMillones))
H + geom_histogram(binwidth =10, aes(fill=Genero), color= "Black", size= 1)

#Facetas, por medio de estas podemos tener un histograma, o cualquier geometr�a, para cada uno de los factores
H + geom_histogram(binwidth =10, aes(fill=Genero), color= "Black", size= 1) +
  facet_grid(Genero~.,scales = "free")

#Facetas con gr�ficos de dispersi�n
I <- ggplot(data=datos.peliculas, aes(x=RatingCriticos, y=RatingAudiencia,
            color=Genero))
I + geom_point(size= 3) + facet_grid(.~A�o) #Columnas
I + geom_point(size= 3) + facet_grid(A�o~.) #Filas
I + geom_point(size= 3) + facet_grid(Genero~A�o) #Genero en filas y columnas de A�o
I + geom_point(aes(size= PresupuestoMillones)) + facet_grid(Genero~A�o) + geom_smooth()


#Coordenandas
J <- ggplot(data=datos.peliculas, aes(x=RatingCriticos, y=RatingAudiencia, 
                                      color=Genero))
J + geom_point()
#Si + xlim() y + ylim() podemos lograr seleccionar una seccion de todo el sistema de coordenadas
J + geom_point() + xlim(50, 100) + ylim(50, 100)

#Sin embargo no siempre es �til, como en el caso de un histograma
K <- ggplot(data=datos.peliculas, aes(x=PresupuestoMillones))
K + geom_histogram(binwidth=10, aes(fill=Genero), color="black", size= 1) +
  ylim(0,50)

#El problema con esto anterior es que se cortan los datos y se pierde mucha informaci�n
#Para resolver esto pdemos usar coord_cartesian()
K + geom_histogram(binwidth=10, aes(fill=Genero), color="black", size= 1) +
  coord_cartesian(ylim=c(0,50))

L <- ggplot(data=datos.peliculas, aes(x=RatingCriticos, y=RatingAudiencia, color=Genero))
L + geom_point(aes(size=PresupuestoMillones)) + geom_smooth() +
  facet_grid(Genero~A�o) + coord_cartesian(ylim=c(0,100))


#Temas
M <- ggplot(data=datos.peliculas, aes(x=PresupuestoMillones))
N<- M + geom_histogram(binwidth = 10, aes(fill=Genero), color= "black", size=1)
N

#Primero etiquetas de ejes por medios de x y y label
N + xlab("Presupuesto") + ylab("N�mero de Pel�culas")

#Formato
N + xlab("Presupuesto") + ylab("N�mero de Pel�culas") +
  theme(axis.title.x = element_text(color = "Darkgreen", size=20),
        axis.title.y = element_text(color= "Red", size=20),
        axis.text = element_text(size=15), #si no pongo .y o .x se modifican ambos
        legend.title=element_text(size=15),
        legend.text = element_text(size= 12),
        legend.position = c(0.98,0.98), #Determina la posici�n en el gr�fico
        legend.justification = c(1,1)) #Ancla un punto de referencia para que no se salga del margen


#T�tulo del diagrama
N + xlab("Presupuesto") + ylab("N�mero de Pel�culas") +
  ggtitle("Distribuci�n del Presupuesto en Pel�culas") +
  theme(axis.title.x = element_text(color = "Darkgreen", size=20),
        axis.title.y = element_text(color= "Red", size=20),
        axis.text = element_text(size=15), #si no pongo .y o .x se modifican ambos
        legend.title=element_text(size=15),
        legend.text = element_text(size= 12),
        legend.position = c(0.98,0.98), #Determina la posici�n en el gr�fico
        legend.justification = c(1,1), #Ancla un punto de referencia para que no se salga del margen
        plot.title = element_text(color = "darkblue", size = 30, hjust = .5)
        ) 
