
#Importa los datos
peliculas <- read.csv(file.choose())

#An�lisis Exploratorio

head(peliculas) #filas superiores
summary(peliculas) #resumen de las columnas
str(peliculas) #estructura del set de datos

#Activar GGPlot2
#Usar install.package("ggplot2") en caso de no tener el paquete descargado
library(ggplot2)

#Fuera de alcance pero esta interesante: 
ggplot(data=peliculas, aes(x=D�a.de.la.Semana..lanzamiento.)) + geom_bar()
#�Te das cuenta? No ha habido estrenos de pel�culas en un Lunes. 

#Ahora vamos a filtrar nuestro set de datos para dejar �nicamente
#los G�neros y los Estudios en los que estamos interesados
#Empezaremos con el filtro de G�nero. Usaremos el operador l�gico 
#"or" para seleccionar m�ltiples G�neros:
filtro1 <- (peliculas$G�nero == "acci�n") | (peliculas$G�nero == "aventura") | (peliculas$G�nero == "animaci�n") | (peliculas$G�nero == "comedia") | (peliculas$G�nero == "drama")

#Ahora hagamos lo mismo para los Estudios:
filtro2 <- (peliculas$Estudio == "Buena Vista Studios") | (peliculas$Estudio == "WB") | (peliculas$Estudio  =="Fox") | (peliculas$Estudio == "Universal") | (peliculas$Estudio == "Sony") | (peliculas$Estudio == "Paramount Pictures")
  
#Aplica los filtros de las filas al marco de datos
peliculas2 <- peliculas[filtro1 & filtro2,]

#Prepara los datos del gr�fico y las capas de est�ticas
#Nota que no le cambiamos el nombre a las columnas
#Usa str() o summary() para encontrar el nombre correcto de las columnas
str(peliculas2)
p <- ggplot(data=peliculas2, aes(x=G�nero, y=Venta...USA))
p #No pasa nada porque se necesita una geometr�a

#Agrega una capa con geometr�a de puntos
p + geom_point()

#Puedes agregar un boxplot en lugar de los puntos
p + geom_boxplot()

#Nota que los valores at�picos son parte de la capa del boxplot
#Usaremos esa observaci�n despu�s (*)

#Agrega los puntos
p + geom_boxplot() + geom_point()
#No es exactamente lo que est�bamos buscando

#Cambia los puntos por el jitter
p + geom_boxplot() + geom_jitter()

#Posiciona el boxplot por encima del jitter
p + geom_jitter() + geom_boxplot() 

#Agrega transparencia al boxplot
p + geom_jitter() + geom_boxplot(alpha=0.7) 

#Ahora puedes agregar tama�o y color a los puntos:
p + geom_jitter(aes(size=Presupuesto...mill., color=Estudio)) + 
  geom_boxplot(alpha=0.7) 
#�Puedes ver los puntos negros que a�n est�n visibles?
#�De d�nde vienen?
#Son parte del boxplot - �Recuerdas la observaci�n (*) que hicimos arriba?

#Vamos a quitarlos:
p + geom_jitter(aes(size=Presupuesto...mill., color=Estudio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA) 

#Almacenamos nuestro progreso en un nuevo objeto: 
q <- p + geom_jitter(aes(size=Presupuesto...mill., color=Estudio)) + 
  geom_boxplot(alpha = 0.7, outlier.colour = NA) 
q

#Elementos que no son datos (non-data ink)
q <- q + 
  xlab("G�nero") + #t�tulo del eje x
  ylab("% Ventas USA") + #t�tulo del eje y
  ggtitle("Domestic Gross % by Genre", ) #t�tulo del diagrama
q

#Para lo siguiente se requiere theme()
#Tema
q <- q + 
  theme(
    
    #T�tulo de los ejes:
    axis.title.x = element_text(color="Blue", size=20),
    axis.title.y = element_text(color="Blue", size=20),
    
    #Texto de los ejes:
    axis.text.x = element_text(size=15),
    axis.text.y = element_text(size=15),  
    
    #T�tulo del gr�fico:
    plot.title  = element_text(color="Black",
                              size=25, 
                              hjust = 0.5),
    
    #T�tulo de la Leyenda:
    legend.title = element_text(size=15),
    
    #Texto de la Leyenda
    legend.text = element_text(size=10)
  )
q

#Toque Final. Esto no lo hab�amos visto durante el curso
#Pero de esta manera puedes cambiar individualmente el t�tulo de tu leyenda
q$labels$size = "Presupuesto $M"
q

