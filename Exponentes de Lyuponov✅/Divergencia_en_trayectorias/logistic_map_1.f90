PROGRAM LOGISTIC_MAP
  IMPLICIT NONE
  INTEGER, PARAMETER:: ip=selected_int_kind(18)
  INTEGER, PARAMETER:: rp=selected_real_kind(33,4931)
  REAL(rp) :: X_0, X1, X2, X3, X4, X5, A1, A2, A3, A4, A5, e
  INTEGER(ip) :: N, ITMAX
    
  X_0 = 0.2_rp
  A1 = 3.3_rp
  A2 = 3.3_rp
  A3 = 3.3_rp
  A4 = 3.3_rp
  A5 = 3.3_rp
  ITMAX = 10000_ip
  e = 10._rp**(-2)  !!-30 para 3.9 y  al amenos 2 para 3.3
    
  X1 = X_0 - e/ 1.0001_rp
  X2 = X_0 - e/2._rp
  X3 = X_0 
  X4 = X_0 + e/2._rp
  X5 = X_0 + e/1.0001_rp
  
  !OPEN(UNIT=12, FILE='DATA', STATUS="NEW", ACTION="WRITE")    !OLD para reescribir, NEW para generar nuevo
  OPEN(UNIT=12, FILE='data_a_3.3.txt', STATUS="REPLACE", ACTION="WRITE")
  
  ! Se usa un formato explícito (ES24.16) para guardar todos los decimales de doble precisión
  WRITE(12, "(i15,6f40.30)") 0, X1, X2, X3 , X4 , X5

  DO N=1, ITMAX, 1
    X1 = A1 * X1 * (1.0_rp - X1)
    X2 = A2 * X2 * (1.0_rp - X2)
    X3 = A3 * X3 * (1.0_rp - X3)
    X4 = A4 * X4 * (1.0_rp - X4)
    X5 = A5 * X5 * (1.0_rp - X5)    
    
    WRITE(12, "(i15,6f40.30)") N, X1, X2, X3 , X4 , X5
  ENDDO
    
  CLOSE(UNIT=12, STATUS="KEEP") 

END PROGRAM LOGISTIC_MAP
