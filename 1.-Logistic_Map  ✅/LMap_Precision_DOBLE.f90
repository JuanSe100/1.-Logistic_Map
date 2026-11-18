PROGRAM  logistic_map    ! Begin program
  implicit none ! Nos obliga a declarar todas lasvariables
  ! Definicion de variables en el programa
  REAL(8) :: xo, x, a      ! Variables type Double 
  INTEGER :: n, itmax   ! Variables type Int
  
 
  !call input_value(xo,a)
  !call validar_valores(xo,a)
  
  xo = 0.5d0              
  a = 0.5d0             
  itmax = 10000          	
   
  call terminal_dats(xo,a,itmax)
  x = xo
  
  OPEN( UNIT=11, FILE= "datos_Pre_Doble.dat", STATUS= "REPLACE", ACTION="WRITE")
  !WRITE(*,*) 'Iteración', '   x'
  WRITE(11,*) 0 , xo  ! Write initial values in file_out
  
  DO n=1, itmax, 1        ! Begin for 
    x = a*x*(1.0d0-x)	  ! Logistic map funtion
    WRITE(11,*) n , x  !Print iteration result 
  ENDDO                   ! end for 
    
   CLOSE(UNIT=11, STATUS="KEEP") 

! Generamos las subrrutinas del programa-CONTAINS

CONTAINS 

!----------------------------------------------------------------------

subroutine validar_valores(value_x, value_a)
REAL(8), INTENT(IN) :: value_x, value_a ! INTENT(IN) VARIABLES DE SOLO LECTURA
 if (value_x<= 0.0d0 .OR. value_x>= 1.0d0 ) then
  	write(*,*) "xo fuera del rango aceptable ]0.0 : 1.0["
  	stop
 end if 
 if (value_a < 0.0d0 .OR. value_a > 4.0d0) then
      write(*,*) "a fuera de rango [0.0 :4.0]"
      stop
 end if
end subroutine validar_valores

!----------------------------------------------------------------------

subroutine input_value(value_x, value_a)
  REAL(8), INTENT(OUT) :: value_x, value_a   ! Out especifica qeu son variables de salida  
  
  write(*,*) "Ingrese el valor de xo:"
  read(*,*) value_x
  
  write(*,*) "Ingrese el valor de a:"
  read(*,*) value_a

end subroutine input_value

!----------------------------------------------------------------------

subroutine terminal_dats(valor_de_x, valor_de_a, iteration)
REAL(8) :: valor_de_x, valor_de_a      ! Variables type Double 
INTEGER ::  iteration   ! Variables type Int
	  write(*,*) "Estamos trabajando con PRECISION DOBLE"
	  write(*,*) "64 bits (8 bytes) de memoria"
	  write(*,*) "15-17 decimales"
	  write(*,*) "El valor de xo es     : " ,valor_de_x
	  write(*,*) "El valor de a es      : " ,valor_de_a
	  write(*,*) "Numero de iteraciones : " ,iteration 
end subroutine terminal_dats

END PROGRAM logistic_map   ! End Program 
