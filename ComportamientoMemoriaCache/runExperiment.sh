#!/bin/bash

for (( i=6; i<=42; i+=6 ))
do
   # Ejecuta el programa con los parametros definidos
   ./matrixC.exe $i

done
for (( i=6; i<=42; i+=6 ))
do
   # Ejecuta el programa con los parametros definidos
   ./matrixB.exe $i

done

