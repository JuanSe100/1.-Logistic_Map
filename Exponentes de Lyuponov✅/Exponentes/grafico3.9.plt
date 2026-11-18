#set term pngcairo size 500,500
#set output "figura.png"
#set term postscript color
#set output "figura.eps"

set grid
#set key off
#set xlabel "x" offset 0,-1.5 font "Arial, 30"
#set ylabel "y" offset -1.5,0 font "Arial, 30"
set xrange [0:4]
#set yrange [-25:21]
#set xtics -10,2,10 font "Arial,20"
#set ytics -20,5,20 font "Arial,20"
#set label 1 "-1.979,-0.287" at -2.4,2 font "Arial, 20"
#set arrow from 25,0 to 25,1 nohead lc rgb "blue"






plot 'data_a_3.3.txt' using 1:2 with linespoints pt 7 ps 0.5 lc rgb "red" 


pause -1
