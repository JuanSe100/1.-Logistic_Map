import numpy as np
import matplotlib.pyplot as plt
import scienceplots 

# Definimos variables para los labels
#=====================================================
input_name = "datos"        #Archivo de entrada

titulo = "Lmap_a3.45_x0.5"           #Nombre de la imagen

legend = r'$a=3.45, \: x_0=0.5$'   #Leyenda de la imagen
#=====================================================

plt.style.use(['science', 'ieee']) # Formato IEEE

x, y = np.loadtxt(f'{input_name}.dat', unpack=True) # LECTURA DE DATOS

# Inicializar la figura
fig, ax = plt.subplots()


#'plot' puntos conectador por lineas 
#'scatter' puntos sueltos sin conectar 
ax.plot(x, y, marker='o', linestyle='-', color='blue', linewidth=0.4, markersize=1.2,label=legend)

#Etiquetas

ax.set_xlabel(r'Iteración, $n$')
ax.set_ylabel(r'Población, $x_n$')

ax.set_xlim(0, 100)
ax.set_ylim(0.3, 0.9)
# Opcional: Agregar una leyenda si tienes más de una curva
ax.legend(loc='best')

fig.savefig(f'{titulo}.pdf')



