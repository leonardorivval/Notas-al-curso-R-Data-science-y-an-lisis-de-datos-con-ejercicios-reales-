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


#Uso del s�mbolo de $
head(datos)

#Se pueden seleccionar datos como en una matriz
datos[4,3]
datos[4,4]
datos[4,5]
datos[4, "Tasa.Natalidad"]
datos[2, "Tasa.Natalidad"]

#El $ regresa un vector de alguna de las columnas de los datos
datos$Nombre.Pais
datos$Codigo.Pais
datos$Tasa.Natalidad
datos$Penetracion.Internet
datos$Grupo.Ingresos

#Tambi�n nos puede ayudar a conocer los niveles de una variable cuando se junta con levels()
str(datos)
levels(datos$Grupo.Ingresos)


#Operaciones b�sicas con un marco de datos

#Subconjuntos. Primero se especifica las filas y luego las columnas
datos[1:10, ]

#Si usamos C() dentro del subconjunto podemos seleccionar varias filas discontinuas
datos[c(1,4,6),]

#A diferencia de las matrices si se selecciona una sola fila no tenemos el cambio a vector. Se mantiene como marco de datos
datos[1,]
is.data.frame(datos[1,])

#Sin embargo al extraer una columna si tenemos la conversi�n a vector
datos[,1]
is.data.frame(datos[,1])
#Si se quiere mantener como marco de datos se aplica drop=. Esto evita que caiga la dimensi�n
datos[, 1, drop= FALSE]
is.data.frame(datos[, 1, drop= FALSE])

#Lo siguiente no tiene mucho sentido para los datos que uso, pero permite demostrar c�mo hacer operaciones aritm�ticas
head(datos)
datos$Tasa.Natalidad * datos$Penetracion.Internet
datos$Tasa.Natalidad / datos$Penetracion.Internet
datos$Tasa.Natalidad + datos$Penetracion.Internet
datos$Tasa.Natalidad - datos$Penetracion.Internet
sqrt(datos$Tasa.Natalidad)

#Tambi�n se pueden agregar columnas nuevas al marco de datos
head(datos)
datos$columna.extra <- datos$Tasa.Natalidad * datos$Penetracion.Internet
head(datos)

#Podemos aprovechar el reciclado de vectores para agregar columnas
datos$xyz <- 1:3
head(datos)

#Si queremos quitar columnas podemos hacerlo mediante NULL
datos$xyz <- NULL
datos$columna.extra <- NULL
head(datos)


#Filtrando marcos de datos
head(datos)
filtro <- datos$Penetracion.Internet < 2
datos[filtro, ]

#Una forma alternativa sin generar el objeto filtro
datos[datos$Tasa.Natalidad > 40,]

#Si quisi�ramos agregar m�s de una condici�n entonces podemos usar &, si ambas son TRUE entonces se imprime en la consola el marco de datos deseado
datos[datos$Tasa.Natalidad > 40 & datos$Penetracion.Internet <2,]

#Tambi�n se puede hacer el filtrado con variables categ�ricas
datos[datos$Grupo.Ingresos == "Ingreso alto", ]
datos[datos$Grupo.Ingresos == "Ingreso bajo", ]

# Lo mismo se puede hacer con elementos individuales de las columnas, si estas tienen un c�digo �nico como en el caso de los pa�ses
datos[datos == "Malta", ]

#INTRODUCCI�N A qplot()
install.packages("ggplot2")
qplot(data=datos, x= Penetracion.Internet)

#Podemos graficar una variabe categ�rica en en eje x contra una num�rica en y
qplot(data=datos, x=Grupo.Ingresos, y= Tasa.Natalidad)

#Podemos aumentar el tama�o de los puntos de la gr�fica para hacerlos m�s visibles
qplot(data=datos, x= Grupo.Ingresos, y = Tasa.Natalidad, size = 3)

#As� mismo se debe especificar con I() o "as is", qu� tama�o queremos, o qu� color queremos para el gr�fico
qplot(data=datos, x= Grupo.Ingresos, y= Tasa.Natalidad, size= I(10))

qplot(data=datos, x=Grupo.Ingresos, y=Tasa.Natalidad, size = I(3),
      color= I("blue"))
qplot(data=datos, x=Grupo.Ingresos, y=Tasa.Natalidad, size = I(3),
      color= I("red"))
qplot(data=datos, x=Grupo.Ingresos, y=Tasa.Natalidad, size = I(3),
      color= I("green"))
qplot(data=datos, x=Grupo.Ingresos, y=Tasa.Natalidad, size = I(3),
      color= I("violet"))
qplot(data=datos, x=Grupo.Ingresos, y=Tasa.Natalidad, size = I(3),
      color= I("yellow"))
qplot(data=datos, x=Grupo.Ingresos, y=Tasa.Natalidad, size = I(3),
      color= I("pink"))

#Otra cosa que podemos alterar es la geometr�a de la gr�fica...como un boxplot
qplot(data=datos, x=Grupo.Ingresos, y=Tasa.Natalidad, geom = "boxplot")

#Visualizando la solicitud

qplot(data=datos, x= Penetracion.Internet, y= Tasa.Natalidad)
qplot(data=datos, x= Penetracion.Internet, y= Tasa.Natalidad, size= I(5))
qplot(data=datos, x= Penetracion.Internet, y= Tasa.Natalidad, size= I(5),
      color= Grupo.Ingresos)


#Creando marcos de datos
mi_data_frame <- data.frame(Pais_dataset_p2, Codigo_Pais_dataset_p2, Region_dataset_p2)
head(mi_data_frame)
colnames(mi_data_frame) <- c("Pais", "Codigo", "Region")
head(mi_data_frame)

rm(mi_data_frame)

#Una forma m�s directa de hacer el marco de datos pero ya con los nombres que queremos
mi_data_frame <- data.frame(Pais=Pais_dataset_p2, Codigo=Codigo_Pais_dataset_p2, 
                            Region=Region_dataset_p2)
head(mi_data_frame)
tail(mi_data_frame)
summary(mi_data_frame)


#Combinando marcos de datos merge()
head(datos)
head(mi_data_frame)

#Nota, el by.x= y by.y= indican a merge() por que puntos unir los dataframes y es necesario que se sciban todo junto
data_frame_combinado <- merge(datos, mi_data_frame, by.x= "Codigo.Pais", by.y= "Codigo")
head(data_frame_combinado)

#Como se puede ver tenemos columnas repetidas y hay que eliminaras por medio de $ y NULL
data_frame_combinado$Pais <- NULL
head(data_frame_combinado)


#Visualizando con qplot() parte 2. O sea con el nuevo marco de datos creado previamente
#Tasa de natalidad con penetraci�n del internet en fuunci�n del pa�s

qplot(data=data_frame_combinado, x = Penetracion.Internet, y= Tasa.Natalidad, color = Region, size= I(5))

#Lo mismo pero con un cambio de figura

qplot(data=data_frame_combinado, x = Penetracion.Internet, y= Tasa.Natalidad,
      color = Region, size= I(5), shape= I(17))

#Se pueden transparentar las figuras y as� poder mejor las conglomeraciones
#Alpha= va de 0 a 1, donde 0 es completamente transparente y uno es opaco
qplot(data=data_frame_combinado, x = Penetracion.Internet, y= Tasa.Natalidad,
      color = Region, size= I(5), shape= I(17), alpha= I(.5))

#Agregar t�tulo en gr�fico
qplot(data=data_frame_combinado, x = Penetracion.Internet, y= Tasa.Natalidad,
      color = Region, size= I(5), shape= I(17), alpha= I(.5),
      main= "Tasa de Natalida V.S Penetraci�n del Internet")


