set xrange[0:500]
set yrange[0:1]
set logscale y
plot "lmap_ainfty.dat" using 1:2 with linespoints pt 7 ps 0.35

