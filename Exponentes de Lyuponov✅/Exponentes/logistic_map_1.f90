PROGRAM LOGISTIC_MAP
  IMPLICIT NONE
  INTEGER, PARAMETER :: ip = selected_int_kind(18)            ! Cuadruple precision
  INTEGER, PARAMETER :: rp = selected_real_kind(33, 4931)     ! Cuadruple precision
  
  REAL(rp) :: xo, x, derivada, ao, af, a, acumulador, exponente, paso
  INTEGER(ip) :: N, ITMAX, j, dd
  
  xo = 0.2_rp
  
  ! Rango de los valores de a que vamos a estudiar 
  !!===================================================
  ao = 0.0_rp
  af = 3.9_rp
  dd = 1000_ip   ! Numero de valores de 'a' a calcular
  !!===================================================
 
  ITMAX = 1000_ip  
  paso = (af - ao) / REAL(dd, rp)    ! Mucho cuidado ERROR TIPICO
  write(*,*) "Valor del paso de a: ", paso
    
  OPEN(UNIT=12, FILE='datos_lyapunov.dat', STATUS="REPLACE", ACTION="WRITE")
  
  DO j = 1, dd                       ! j fue declarado como int
     a = ao + paso * REAL(j, rp)     ! Mucho cuidado ERROR TIPICO
     x = xo
     acumulador = 0.0_rp
     
     DO N = 1, ITMAX
        derivada = a - 2.0_rp * a * x
        acumulador = acumulador + LOG(ABS(derivada))
        x = a * x * (1.0_rp - x)
     END DO 
     
     exponente = acumulador / REAL(ITMAX, rp)
     
     WRITE(12, "(2f40.30)") a, exponente  
  END DO
  
  CLOSE(UNIT=12, STATUS="KEEP") 

END PROGRAM LOGISTIC_MAP
