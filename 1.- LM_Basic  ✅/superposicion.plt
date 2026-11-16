# Estética general
set title "Logistic Map"
set xlabel "x"
set ylabel "f(x)"
set grid
#set yrange [-1.25:1.25]
#set xrange [0:5]
set samples 1000 

)

####Gráficas superpuestas#############
plot \
'===Name====.dat' using 1:2 with points pt 7 ps 0.35 lc rgb "red" title "EU", \
'===Name====.dat.dat' using 1:2 with points pt 7 ps 0.35 lc rgb "black" title "EM", \
'===Name====.dat.dat' using 1:2 with points pt 7 ps 0.35 lc rgb "orange" title "PC"
# 0 lc rgb "gray" dt 2 notitle  # Línea base opcional, punteada

pause -1
