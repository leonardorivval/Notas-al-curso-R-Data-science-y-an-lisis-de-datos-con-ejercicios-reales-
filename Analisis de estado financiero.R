#Datos
ingresos <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
gastos <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Respuesta
?round()
#Calcular Utilidad como la Diferencia de Ingreso y Gasto

utilidad <- ingresos - gastos
utilidad

#Calcular el Impuesto como el 30% de la Utilidad y Redondear a 2 Puntos Decimales
impuesto <- round(0.30 * utilidad, 2)
impuesto 

#Calcular la Utilidad Despu�s de Impuestos
utilidad.despues.de.impuestos <- utilidad - impuesto
utilidad.despues.de.impuestos

#Calcular el Margen de Utilidad como Utilidad Despu�s de Impuestos sobre Ingresos
#Redondear a 2 Puntos Decimales, Luego Multiplicar por 100 para obtener el %
margen.de.utilidad <- round(utilidad.despues.de.impuestos/ ingresos, 2) * 100
margen.de.utilidad

#Calcular el promedio para los 12 meses de la Utilidad Despu�s de Impuestos
promedio.utilidad.despues.de.impuestos <- mean(utilidad.despues.de.impuestos)
promedio.utilidad.despues.de.impuestos

#Encuentra los Meses Utilidad Despu�s de Impuestos por Encima de la Media
meses.buenos <- utilidad.despues.de.impuestos > promedio.utilidad.despues.de.impuestos
meses.buenos

#Los Meses Malos son el Opuesto a los Meses Buenos !
meses.malos <- !meses.buenos
meses.malos

#El Mejor Mes es Donde la Utilidad Despu�s de Impuestos es Igual al M�ximo
#Aqu� compara capada valor de utilidad.despu�s de impuestos con el m�ximo de ese vector
#Esto es gracias al reciclado de valores, el valor m�ximo se repite las 12 veces
mejor.mes <- utilidad.despues.de.impuestos == max(utilidad.despues.de.impuestos)
mejor.mes

#El Peor Mes es Donde la Utilidad Despu�s de Impuestos es Igual al M�nimo
#Mismos principios que en el paso anterior
peor.mes <- utilidad.despues.de.impuestos == min(utilidad.despues.de.impuestos)
peor.mes

#Convierte Todos los C�lculos a Unidades de Mil D�lares
ingresos.1000 <- round(ingresos / 1000, 0)
gastos.1000 <- round(gastos / 1000, 0)
utilidad.1000 <- round(utilidad / 1000, 0)
utilidad.despues.de.impuestos.1000 <- round(utilidad.despues.de.impuestos/1000, 0)

#Imprime los Resultados
print(ingresos.1000)
print(gastos.1000)
print(utilidad.1000)
print(utilidad.despues.de.impuestos.1000)
print(margen.de.utilidad)
print(meses.buenos)
print(meses.malos)
print(mejor.mes)
print(peor.mes)

#BONUS:
#Preview de lo que Veremos en la Pr�xima Secci�n
M <- rbind(
  ingresos.1000,
  gastos.1000,
  utilidad.1000,
  utilidad.despues.de.impuestos.1000,
  margen.de.utilidad,
  meses.buenos,
  meses.malos,
  mejor.mes,
  peor.mes
)

M

#Imprime la Matriz
_

