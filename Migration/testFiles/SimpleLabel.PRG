!                       DR_INIT3
!			********
!
!********************************************************************
!	INITIALISATIE						    *
!********************************************************************
!
	LSTIO	0003
  SET1  PLCC1 !eerste PLC_cyclus hoog_signaal
	JSAT	L00008
	RET
!
!********************************************************************
! SUBROUTINES EN I/O_SLAGEN           *
!********************************************************************
!
L00004	LSTIO	0199
	END	DWS1_1	!eenheid DWS

L00006	LSTIO	1099
	END	1000
!
!********************************************************************
!	BEGIN HOOFDPROGRAMMA					    *
!********************************************************************
!
L00008	AND	000.1