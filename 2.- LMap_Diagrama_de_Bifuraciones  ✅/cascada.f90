program cascada
	
	implicit none
	
	real*8 :: x0,x,a
	integer :: n,j,intmax,ndatos,tam,i
	real*8 :: vaux_a,x1,x2
	dimension :: vaux_a(100001)
	
	open(unit=11,file="cascada.dat",status="replace",action="write")
	
	x0 = 0.5
	intmax = 100000
	tam = 10000
	
	do j=300,400,1
		x = x0
		a = j/100.0
		do n=1,intmax,1
			x = a*x*(1-x)
			if (n > intmax-tam) then
				vaux_a(n-intmax+tam) = x
			endif			
		enddo		
		x1 = vaux_a(1)
		do n=2,tam,1
			x2 = vaux_a(n)
			if (abs(x2 - x1) < 1.0d-6) then
				write(11,*) a, x2
				exit
			endif
			do i=n+1,tam,1
				if (abs(vaux_a(i) - x2) < 1.0d-6) then
					write(11,*) a, x2
					exit					
				endif					
			enddo
		enddo
	enddo
	
	close(unit=11,status="keep")		
	
endprogram
