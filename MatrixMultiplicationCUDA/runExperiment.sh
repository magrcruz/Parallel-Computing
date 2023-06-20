#!/bin/bash

# Parámetros de la lista a, b y c
a=(1080 1440 1800 2160 2520 2880 3240 3600 3960 4320)
b=(720 960 1200 1440 1680 1920 2160 2400 2640 2880)
c=(900 1200 1500 1800 2100 2400 2700 3000 3300 3600)

# Número de iteraciones
n=5

# Ejecutar matmul n veces con diferentes parámetros
for ((i=1; i<=$n; i++))
do
  # Obtener los parámetros para la iteración actual
  param_a=${a[$((i % ${#a[@]}))]}
  param_b=${b[$((i % ${#b[@]}))]}
  param_c=${c[$((i % ${#c[@]}))]}

  # Ejecutar el programa matmul con los parámetros actuales
  output=$(./matmul $param_a $param_b $param_c)

  # Extraer el tiempo de ejecución de CUDA
  cuda_time=$(echo "$output" | grep -oE 'Implemented CUDA code ran in: [0-9.]+ msecs.' | awk '{print $6}')

  # Extraer el tiempo de ejecución de la CPU
  cpu_time=$(echo "$output" | grep -oE 'Implemented CPU code ran in: [0-9.]+ msecs.' | awk '{print $6}')

  # Ejecutar el programa matmul con los parámetros actuales
  output=$(./matmulTiled $param_a $param_b $param_c)

  # Extraer el tiempo de ejecución de CUDA
  cudaT_time=$(echo "$output" | grep -oE 'Implemented CUDA code ran in: [0-9.]+ msecs.' | awk '{print $6}')

  # Extraer el tiempo de ejecución de la CPU
  cpuT_time=$(echo "$output" | grep -oE 'Implemented CPU code ran in: [0-9.]+ msecs.' | awk '{print $6}')

  # Imprimir los resultados
  echo "$i: $cuda_time $cpu_time $cudaT_time $cpuT_time"
done
