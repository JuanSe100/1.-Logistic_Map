! codigo mauricio
program logistic_map_ainfty

	implicit none
        ! Incluimos la cuadruple precisión
	integer, parameter :: ip=selected_int_kind(18)
	integer, parameter :: qp = selected_real_kind(33, 4931)
	!Declaración de variables del program
	real(qp) :: x0,x,a,eps,xn,xdif
	integer(ip) :: n, intmax
	
	! Abrimos e archivo de escritura 
	open(unit=11,file="lmap_ainfty_x0_08_a_25.dat",status="replace",action="write")
	
	! Condiciones Iniciales del program
	x0 = 0.8_qp
	eps = 10._qp**(-20)  ! Desplazamiento infinitesimasl
	a = 2.5_qp
	intmax = 100000_qp   ! Numero de iteraciones del programa
	

	
	x = x0
	xn = x0+eps
	xdif = abs(x-xn)   ! Diferencia entre x y x+eps
	
       call valores_utilizados(x0, xn, a , eps)
	
	write(11,*) 0,x,xn,xdif  ! Imprimimos e primer dato antes del for
!	print*, "0",x,xn,xdif
	
	do n=1,intmax,1
		x = a*x*(1-x)
		xn = a*xn*(1-xn)
		xdif = abs(x-xn)
		write(11,*) n,x,xn,xdif
	enddo
	
	close(unit=11,status="keep")
! Subrrutinas del program
	



endprogram logistic_map_ainfty
