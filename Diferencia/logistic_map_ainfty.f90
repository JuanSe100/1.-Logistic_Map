program logistic_map_ainfty

	implicit none

	integer, parameter :: ip=selected_int_kind(18)
	integer, parameter :: qp = selected_real_kind(33, 4931)
	real(qp) :: x0,x,a,eps,xn,xdif
	integer(ip) :: n, intmax
	
	open(unit=11,file="lmap_ainftyxo0.1.dat",status="replace",action="write")
	
	x0 = 0.1_qp
	eps = 5.0_qp**(-20)
	a = 3.9_qp
	intmax = 100000_qp
	
	x = x0
	xn = x0+eps
	xdif = abs(x-xn)
	
	write(11,*) 0,x,xn,xdif
	
	do n=1,intmax,1
		x = a*x*(1-x)
		xn = a*xn*(1-xn)
		xdif = abs(x-xn)
		write(11,*) n,x,xn,xdif
	enddo
	
	close(unit=11,status="keep")

endprogram logistic_map_ainfty
