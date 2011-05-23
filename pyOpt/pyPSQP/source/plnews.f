* SUBROUTINE PLNEWS             ALL SYSTEMS                   97/12/01
* PORTABILITY : ALL SYSTEMS
* 97/12/01 LU : ORIGINAL VERSION
*
* PURPOSE :
* TEST ON ACTIVITY OF A GIVEN SIMPLE BOUND.
*
* PARAMETERS :
*  RI  X(NF)  VECTOR OF VARIABLES.
*  IU  IX(NF)  VECTOR CONTAINING TYPES OF BOUNDS.
*  RI  XL(NF)  VECTOR CONTAINING LOWER BOUNDS FOR VARIABLES.
*  RI  XU(NF)  VECTOR CONTAINING UPPER BOUNDS FOR VARIABLES.
*  RI  EPS9  TOLERANCE FOR ACTIVE CONSTRAINTS.
*  II  I  INDEX OF TESTED SIMPLE BOUND.
*  IO  INEW  INDEX OF THE NEW ACTIVE CONSTRAINT.
*
      SUBROUTINE PLNEWS(X,IX,XL,XU,EPS9,I,INEW)
      INTEGER IX(*),I,INEW
      DOUBLE PRECISION X(*),XL(*),XU(*),EPS9
      DOUBLE PRECISION TEMP
      TEMP=1.0D 0
      IF (IX(I).LE.0) THEN
      ELSE IF (IX(I).EQ.1) THEN
      IF (X(I).LE.XL(I)+EPS9*MAX(ABS(XL(I)),TEMP)) THEN
      IX(I)=11
      INEW=-I
      ENDIF
      ELSE IF (IX(I).EQ.2) THEN
      IF (X(I).GE.XU(I)-EPS9*MAX(ABS(XU(I)),TEMP)) THEN
      IX(I)=12
      INEW=-I
      ENDIF
      ELSE IF (IX(I).EQ.3.OR.IX(I).EQ.4) THEN
      IF (X(I).LE.XL(I)+EPS9*MAX(ABS(XL(I)),TEMP)) THEN
      IX(I)=13
      INEW=-I
      ENDIF
      IF (X(I).GE.XU(I)-EPS9*MAX(ABS(XU(I)),TEMP)) THEN
      IX(I)=14
      INEW=-I
      ENDIF
      ENDIF
      RETURN
      END