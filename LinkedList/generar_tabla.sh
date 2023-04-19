#!/bin/bash

# Definir los programas a ejecutar y los números de threads a probar
PROGRAMS=("pth_ll_rwl" "pth_ll_one_mut" "pth_ll_mult_mut")
THREADS=(1 2 4 8)

# Función para imprimir la tabla
print_table() {
  # Imprimir la primera fila de encabezados de columnas
  printf "\t|"
  for t in "${THREADS[@]}"; do
    printf "%-10s | " "$t        "
  done
  printf "\n"
  
  # Imprimir la fila divisoria
  printf -- "+"
  for t in "${THREADS[@]}"; do
    printf -- "------------+"
  done
  printf "\n"

  # Imprimir cada fila de la tabla
  for p in "${PROGRAMS[@]}"; do
    printf "%-10s | " "$p"
    for t in "${THREADS[@]}"; do
      # Ejecutar el programa con el número de threads y procesos correspondientes
      output=$(./$p $t < "params.txt" 2>/dev/null)

      time=$(echo "$output" | grep "Elapsed time" | awk '{print $4}')


      # Imprimir el tiempo en la celda correspondiente
      printf "%-10s | " "$time"
    done
    printf "\n"
  done
      
  # Imprimir la fila divisoria
    printf -- "+"
    for t in "${THREADS[@]}"; do
      printf -- "------------+"
    done
    printf "\n"
}

# Imprimir la tabla
print_table

