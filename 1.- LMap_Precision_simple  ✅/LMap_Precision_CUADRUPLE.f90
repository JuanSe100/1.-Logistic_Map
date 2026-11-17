PROGRAM logistic_map
  IMPLICIT NONE

  ! Definición de tipos de datos (Entero de 64 bits y Real de 128 bits)
  INTEGER, PARAMETER :: ip = selected_int_kind(18)
  INTEGER, PARAMETER :: rp = selected_real_kind(33, 4931)
  
  INTEGER(ip) :: n, itmax
  REAL(rp) :: xo, x, a

  WRITE(*,*) "Estamos trabajando con PRECISION CUADRUPLE"
  WRITE(*,*) "128 bits (16 bytes) de memoria"
  WRITE(*,*) "32-33 decimales"
  
  ! Condiciones Iniciales
  WRITE(*,*) "Ingrese el valor de xo:"
  READ(*,*) xo
  
  WRITE(*,*) "Ingrese el valor de a:"
  READ(*,*) a
  
  CALL validar_valores(xo, a)
  
  itmax = 10000_ip
  x = xo

  ! Crear archivo de salida con nombre acorde a la precisión
  OPEN(UNIT=11, FILE="datos_Pre_Cuadruple.dat", STATUS="REPLACE", ACTION="WRITE")
  WRITE(11,*) 0_ip, xo
  
  DO n = 1_ip, itmax
    x = a * x * (1.0_rp - x)
    WRITE(11,*) n, x
  END DO
    
  CLOSE(UNIT=11, STATUS="KEEP")
  WRITE(*,*) "Calculo finalizado. Datos guardados en 'datos_Pre_Cuadruple.dat'."

CONTAINS

  SUBROUTINE validar_valores(value_x, value_a)
    ! Se heredan 'rp' e 'ip' del programa principal, pero se deben declarar los argumentos
    REAL(rp), INTENT(IN) :: value_x, value_a

    IF (value_x <= 0.0_rp .OR. value_x >= 1.0_rp) THEN
      WRITE(*,*) "xo fuera del rango aceptable ]0.0 : 1.0["
      STOP
    END IF
   
    IF (value_a < 0.0_rp .OR. value_a > 4.0_rp) THEN
      WRITE(*,*) "a fuera de rango [0.0 : 4.0]"
      STOP
    END IF
  END SUBROUTINE validar_valores

END PROGRAM logistic_map

