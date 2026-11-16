PROGRAM  logistic_map    ! Begin program

  ! Definicion de variables en el programa
  REAL :: xo, x, a      ! Variables type Double 
  INTEGER :: n, itmax   ! Variables type Int
  
  
  write(*,*) "Estamos trabajando con PRECISION DOBLE"
  write(*,*) "32 bits (4 bytes) de memoria"
  write(*,*) "7 decimales"
  
  ! Condiciones Iniciales
  write(*,*) "Ingrese el valor de xo:"
  read(*,*) xo
  
  write(*,*) "Ingrese el valor de a:"
  read(*,*) a
  
  call validar_valores(xo,a)
 
  ! xo = 0.5              ! Define xo variable
  ! a = 2.5              ! Define a variable 
  
  itmax = 10000          ! Define iteration number	
  x = xo
  ! Create a file document 
  OPEN( UNIT=11, FILE= "datos_Pre_simple.dat", STATUS= "REPLACE", ACTION="WRITE")
  WRITE(*,*) 'Iteración', '   x'
  WRITE(11,*) 0 , xo  ! Write initial values in file_out
  
  DO n=1, itmax, 1        ! Begin for 
    x = a*x*(1.0-x)	  ! Logistic map funtion
    WRITE(11,*) n, x	  ! Print iteration result 
  ENDDO                   ! end for 
    
   CLOSE(UNIT=11, STATUS="KEEP") 

! Generamos las subrrutinas del programa-CONTAINS

CONTAINS
subroutine validar_valores(value_x, value_a)
REAL, INTENT(IN) :: value_x, value_a ! INTENT(IN) VARIABLES DE SOLO LECTURA
 if (value_x<= 0.0 .OR. value_x>= 1.0 ) then
  	write(*,*) "xo fuera del rango aceptable ]0.0 : 1.0["
  	stop
 end if
 
 if (value_a < 0.0 .OR. value_a > 4.0) then
      write(*,*) "a fuera de rango [0.0 :4.0]"
      stop
 end if
end subroutine validar_valores

END PROGRAM logistic_map   ! End Program 
