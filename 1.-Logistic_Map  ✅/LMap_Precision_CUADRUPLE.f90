PROGRAM logistic_map
  IMPLICIT NONE

  ! Definición de tipos de datos (Entero de 64 bits y Real de 128 bits)
  INTEGER, PARAMETER :: ip = selected_int_kind(18)
  INTEGER, PARAMETER :: rp = selected_real_kind(33, 4931)
  
  INTEGER(ip) :: n, itmax
  REAL(rp) :: xo, x, a


  call input_value(xo,a)
  call validar_valores(xo,a)
  
 ! xo = 0.5_rp              
 ! a = 0.5_rp
  
  itmax = 100_ip
  call terminal_dats(xo, a, itmax)
  x = xo

  ! Crear archivo de salida con nombre acorde a la precisión
  OPEN(UNIT=11, FILE="datos.dat", STATUS="REPLACE", ACTION="WRITE")
  WRITE(11,*) 0_ip, xo
  
  DO n = 1_ip, itmax
    x = a * x * (1.0_rp - x)
    WRITE(11,*) n, x
  END DO
    
  CLOSE(UNIT=11, STATUS="KEEP")
  WRITE(*,*) "Calculo finalizado. Datos guardados en 'datos_Pre_Cuadruple.dat'."

CONTAINS

  !!---------------------------------------------------------------------------------------
  SUBROUTINE validar_valores(value_x, value_a)
    ! Hereda rp de forma automática gracias a CONTAINS
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
  
  !!---------------------------------------------------------------------------------------
  SUBROUTINE input_value(value_x, value_a)
    ! Hereda rp. Se eliminó la re-declaración redundante de ip y rp.
    REAL(rp), INTENT(OUT) :: value_x, value_a   ! Variables de salida  
  
    WRITE(*,*) "Ingrese el valor de xo:"
    READ(*,*) value_x
  
    WRITE(*,*) "Ingrese el valor de a:"
    READ(*,*) value_a
  END SUBROUTINE input_value

  !!---------------------------------------------------------------------------------------
  SUBROUTINE terminal_dats(valor_de_x, valor_de_a, iteration)
    ! Se eliminó la re-declaración de ip y rp. Se añadió INTENT(IN).
    REAL(rp), INTENT(IN)  :: valor_de_x, valor_de_a 
    INTEGER(ip), INTENT(IN) :: iteration 
    
    WRITE(*,*) "----------------------------------------"
    WRITE(*,*) "Estamos trabajando con PRECISION CUADRUPLE"
    WRITE(*,*) "128 bits (16 bytes) de memoria"
    WRITE(*,*) "~33-34 decimales de precision"
    WRITE(*,*) "El valor de xo es     : " , valor_de_x
    WRITE(*,*) "El valor de a es      : " , valor_de_a
    WRITE(*,*) "Numero de iteraciones : " , iteration 
    WRITE(*,*) "----------------------------------------"
  END SUBROUTINE terminal_dats

END PROGRAM logistic_map
