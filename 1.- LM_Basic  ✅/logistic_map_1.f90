PROGRAM  logistic_map    ! Begin program

  ! Definicion de variables en el programa
  REAL :: xo, x, a      ! Variables type Double 
  INTEGER :: n, itmax   ! Variables type Int
  
  
  write(*,*) "Estamos trabajando con precisión simple"
  write(*,*) "32 bits (4 bytes) de memoria"
  write(*,*) "7 decimales"
  
  ! Variables iniciales	
  write(*,*) "Ingrese el valor de xo:"
  read(*,*) xo
   
  write(*,*) "Ingrese el valor de a:"
  read(*,*) a
 
 
  ! xo = 0.5              ! Define xo variable
  ! a = 2.5              ! Define a variable 
  
  itmax = 10000          ! Define iteration number	
  x = xo
  ! Create a file document 
  OPEN( UNIT=11, FILE= "datos.dat", STATUS= "REPLACE", ACTION="WRITE")
  WRITE(*,*) 'Iteración', '   x'
  WRITE(11,*) 0, xo  ! Write initial values in file_out
  
  DO n=1, itmax, 1        ! Begin for 
    x = a*x*(1-x)	  ! Logistic map funtion
    WRITE(11,*) n, x	  ! Print iteration result 
  ENDDO                   ! end for 
    
   CLOSE(UNIT=11, STATUS="KEEP") 

END PROGRAM logistic_map   ! End Program 
