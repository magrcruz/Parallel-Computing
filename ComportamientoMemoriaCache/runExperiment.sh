#!/bin/bash

for (( i=100; i<=100*10; i+=100 ))
do
   # Ejecuta el programa con los parametros definidos
   ./matrixC.exe $i >> tiemposC.txt

done
for (( i=100; i<=100*10; i+=100 ))
do
   # Ejecuta el programa con los parametros definidos
   ./matrixB.exe $i >> tiemposB.txt

done
