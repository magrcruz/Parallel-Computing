import matplotlib.pyplot as plt

# Cargar los datos del archivo1.txt
x1 = []
y1 = []
with open('tiemposB.txt', 'r') as f:
    for line in f:
        values = line.split()
        x1.append(float(values[0]))
        y1.append(float(values[1]))

# Cargar los datos del archivo2.txt
x2 = []
y2 = []
with open('tiemposC.txt', 'r') as f:
    for line in f:
        values = line.split()
        x2.append(float(values[0]))
        y2.append(float(values[1]))

# Crear el gráfico de líneas
plt.plot(x1, y1, label='Multiplicación por bloques')
plt.plot(x2, y2, label='Multiplicación Clásica')

# Personalizar el gráfico
plt.xlabel('Tamaño de la matriz')
plt.ylabel('Tiempo (microsegundos)')
plt.title('Comparación de tiempos')
plt.legend()

# Mostrar el gráfico
plt.show()
