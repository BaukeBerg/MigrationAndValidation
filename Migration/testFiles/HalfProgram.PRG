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
	JSAT	L00004
	JSAT	L00006
	NOP
!
!********************************************************************
!	MAKEN VAN TRIGGERPULSEN T.B.V. TIMERS			    *
!********************************************************************
!
	AND	001.0	!0.1 sec. puls
	TRIG	510.0
	EQL	S_0,1SEC	!triggerpuls 0,1 sec.

	AND	KNIPPER
	TRIG	510.1
	EQL	S_1SEC	!triggerpuls 1,0 sec.

	AND	001.2	!10 sec. puls
	TRIG	510.2
	EQL	S_10SEC	!triggerpuls 10 sec.

	AND	001.3	!1 min. puls
	TRIG	510.3
	EQL	S_1MIN	!triggerpuls 1 min.
	FTCHC	00
	STRD	0320
	STRD	0321
	STRD	0322
	STRD	0323
	STRD	0324
	STRD	0325
	STRD	0326
	STRD	0327
	STRD	0328
	STRD	0329
	STRD	0330
	STRD	0331
	STRD	0332
	STRD	0333

	ANDNT	000.1
  EQL V13_1__2
	EQL	147.1
	EQL	147.2
	NOP	57
	AND	000.1
	FTCHC	00
	STRD	1500	!constante 0

	AND	000.1
	FTCHC	01
	STRD	1501	!constante 1

	AND	000.1
	FTCHC	02
	STRD	1502	!constante 2

	AND	000.1
	FTCHC	03
	STRD	1503	!constante 3

	AND	000.1
	FTCHC	04
	STRD	1504	!constante 4

	AND	000.1
	FTCHC	05
	STRD	1505	!constante 5

	AND	000.1
	FTCHC	06
	STRD	1506	!constante 6

	AND	000.1
	FTCHC	07
	STRD	1507	!constante 7

	AND	000.1
	FTCHC	08
	STRD	1508	!constante 8

	AND	000.1
	FTCHC	09
	STRD	1509	!constante 9

  AND 114.2 !ENTER_drukknop
	TRIG	003.2
	EQL	ENTER	!triggerpuls enterdrukkn.

	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00153

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP00_0	!setpoint 00 eenheden
	STRD	STP00_1	!setpoint 00 tientallen
	STRD	STP00_2	!setpoint 00 honderdtallen
	STRD	STP00_3	!setpoint 00 duizendtallen

	ANDNT	000.1
	NOP	1

L00153	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00173

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP01_0	!setpoint 01 eenheden
	STRD	STP01_1	!setpoint 01 tientallen
	STRD	STP01_2	!setpoint 01 honderdtallen
	STRD	STP01_3	!setpoint 01 duizendtallen

	ANDNT	000.1
	NOP	1

L00173	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00193

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP02_0	!setpoint 02 eenheden
	STRD	STP02_1	!setpoint 02 tientallen
	STRD	STP02_2	!setpoint 02 honderdtallen
	STRD	STP02_3	!setpoint 02 duizendtallen

	ANDNT	000.1
	NOP	1

L00193	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00213

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP03_0	!setpoint 03 eenheden
	STRD	STP03_1	!setpoint 03 tientallen
	STRD	STP03_2	!setpoint 03 honderdtallen
	STRD	STP03_3	!setpoint 03 duizendtallen

	ANDNT	000.1
	NOP	1

L00213	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00233

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP04_0	!setpoint 04 eenheden
	STRD	STP04_1	!setpoint 04 tientallen
	STRD	STP04_2	!setpoint 04 honderdtallen
	STRD	STP04_3	!setpoint 04 duizendtallen

	ANDNT	000.1
	NOP	1

L00233	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00253

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP05_0	!setpoint 05 eenheden
	STRD	STP05_1	!setpoint 05 tientallen
	STRD	STP05_2	!setpoint 05 honderdtallen
	STRD	STP05_3	!setpoint 05 duizendtallen

	ANDNT	000.1
	NOP	1

L00253	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00273

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP06_0	!setpoint 06 eenheden
	STRD	STP06_1	!setpoint 06 tientallen
	STRD	STP06_2	!setpoint 06 honderdtallen
	STRD	STP06_3	!setpoint 06 duizendtallen

	ANDNT	000.1
	NOP	1

L00273	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00293

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP07_0	!setpoint 07 eenheden
	STRD	STP07_1	!setpoint 07 tientallen
	STRD	STP07_2	!setpoint 07 honderdtallen
	STRD	STP07_3	!setpoint 07 duizendtallen

	ANDNT	000.1
	NOP	1

L00293	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00313

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP08_0	!setpoint 08 eenheden
	STRD	STP08_1	!setpoint 08 tientallen
	STRD	STP08_2	!setpoint 08 honderdtallen
	STRD	STP08_3	!setpoint 08 duizendtallen

	ANDNT	000.1
	NOP	1

L00313	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1500	!constante 0
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00333

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP09_0	!setpoint 09 eenheden
	STRD	STP09_1	!setpoint 09 tientallen
	STRD	STP09_2	!setpoint 09 honderdtallen
	STRD	STP09_3	!setpoint 09 duizendtallen

	ANDNT	000.1
	NOP	1

L00333	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00353

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP10_0	!setpoint 10 eenheden
	STRD	STP10_1	!setpoint 10 tientallen
	STRD	STP10_2	!setpoint 10 honderdtallen
	STRD	STP10_3	!setpoint 10 duizendtallen

	ANDNT	000.1
	NOP	1

L00353	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00373

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP11_0	!setpoint 11 eenheden
	STRD	STP11_1	!setpoint 11 tientallen
	STRD	STP11_2	!setpoint 11 honderdtallen
	STRD	STP11_3	!setpoint 11 duizendtallen

	ANDNT	000.1
	NOP	1

L00373	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00393

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP12_0	!setpoint 12 eenheden
	STRD	STP12_1	!setpoint 12 tientallen
	STRD	STP12_2	!setpoint 12 honderdtallen
	STRD	STP12_3	!setpoint 12 duizendtallen

	ANDNT	000.1
	NOP	1

L00393	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00413

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP13_0	!setpoint 13 eenheden
	STRD	STP13_1	!setpoint 13 tientallen
	STRD	STP13_2	!setpoint 13 honderdtallen
	STRD	STP13_3	!setpoint 13 duizendtallen

	ANDNT	000.1
	NOP	1

L00413	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00433

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP14_0	!setpoint 14 eenheden
	STRD	STP14_1	!setpoint 14 tientallen
	STRD	STP14_2	!setpoint 14 honderdtallen
	STRD	STP14_3	!setpoint 14 duizendtallen

	ANDNT	000.1
	NOP	1

L00433	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00453

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP15_0	!setpoint 15 eenheden
	STRD	STP15_1	!setpoint 15 tientallen
	STRD	STP15_2	!setpoint 15 honderdtallen
	STRD	STP15_3	!setpoint 15 duizendtallen

	ANDNT	000.1
	NOP	1

L00453	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00473

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP16_0	!setpoint 16 eenheden
	STRD	STP16_1	!setpoint 16 tientallen
	STRD	STP16_2	!setpoint 16 honderdtallen
	STRD	STP16_3	!setpoint 16 duizendtallen

	ANDNT	000.1
	NOP	1

L00473	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00493

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP17_0	!setpoint 17 eenheden
	STRD	STP17_1	!setpoint 17 tientallen
	STRD	STP17_2	!setpoint 17 honderdtallen
	STRD	STP17_3	!setpoint 17 duizendtallen

	ANDNT	000.1
	NOP	1

L00493	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00513

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP18_0	!setpoint 18 eenheden
	STRD	STP18_1	!setpoint 18 tientallen
	STRD	STP18_2	!setpoint 18 honderdtallen
	STRD	STP18_3	!setpoint 18 duizendtallen

	ANDNT	000.1
	NOP	1

L00513	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1501	!constante 1
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00533

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP19_0	!setpoint 19 eenheden
	STRD	STP19_1	!setpoint 19 tientallen
	STRD	STP19_2	!setpoint 19 honderdtallen
	STRD	STP19_3	!setpoint 19 duizendtallen

	ANDNT	000.1
	NOP	1

L00533	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00553

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP20_0	!setpoint 20 eenheden
	STRD	STP20_1	!setpoint 20 tientallen
	STRD	STP20_2	!setpoint 20 honderdtallen
	STRD	STP20_3	!setpoint 20 duizendtallen

	ANDNT	000.1
	NOP	1

L00553	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00573

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP21_0	!setpoint 21 eenheden
	STRD	STP21_1	!setpoint 21 tientallen
	STRD	STP21_2	!setpoint 21 honderdtallen
	STRD	STP21_3	!setpoint 21 duizendtallen

	ANDNT	000.1
	NOP	1

L00573	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00593

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP22_0	!setpoint 22 eenheden
	STRD	STP22_1	!setpoint 22 tientallen
	STRD	STP22_2	!setpoint 22 honderdtallen
	STRD	STP22_3	!setpoint 22 duizendtallen

	ANDNT	000.1
	NOP	1

L00593	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00613

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP23_0	!setpoint 23 eenheden
	STRD	STP23_1	!setpoint 23 tientallen
	STRD	STP23_2	!setpoint 23 honderdtallen
	STRD	STP23_3	!setpoint 23 duizendtallen

	ANDNT	000.1
	NOP	1

L00613	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00633

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP24_0	!setpoint 24 eenheden
	STRD	STP24_1	!setpoint 24 tientallen
	STRD	STP24_2	!setpoint 24 honderdtallen
	STRD	STP24_3	!setpoint 24 duizendtallen

	ANDNT	000.1
	NOP	1

L00633	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00653

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP25_0	!setpoint 25 eenheden
	STRD	STP25_1	!setpoint 25 tientallen
	STRD	STP25_2	!setpoint 25 honderdtallen
	STRD	STP25_3	!setpoint 25 duizendtallen

	ANDNT	000.1
	NOP	1

L00653	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00673

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP26_0	!setpoint 26 eenheden
	STRD	STP26_1	!setpoint 26 tientallen
	STRD	STP26_2	!setpoint 26 honderdtallen
	STRD	STP26_3	!setpoint 26 duizendtallen

	ANDNT	000.1
	NOP	1

L00673	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00693

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP27_0	!setpoint 27 eenheden
	STRD	STP27_1	!setpoint 27 tientallen
	STRD	STP27_2	!setpoint 27 honderdtallen
	STRD	STP27_3	!setpoint 27 duizendtallen

	ANDNT	000.1
	NOP	1

L00693	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00713

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP28_0	!setpoint 28 eenheden
	STRD	STP28_1	!setpoint 28 tientallen
	STRD	STP28_2	!setpoint 28 honderdtallen
	STRD	STP28_3	!setpoint 28 duizendtallen

	ANDNT	000.1
	NOP	1

L00713	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1502	!constante 2
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00733

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP29_0	!setpoint 29 eenheden
	STRD	STP29_1	!setpoint 29 tientallen
	STRD	STP29_2	!setpoint 29 honderdtallen
	STRD	STP29_3	!setpoint 29 duizendtallen

	ANDNT	000.1
	NOP	1

L00733	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00753

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP30_0	!setpoint 30 eenheden
	STRD	STP30_1	!setpoint 30 tientallen
	STRD	STP30_2	!setpoint 30 honderdtallen
	STRD	STP30_3	!setpoint 30 duizendtallen

	ANDNT	000.1
	NOP	1

L00753	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00773

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP31_0	!setpoint 31 eenheden
	STRD	STP31_1	!setpoint 31 tientallen
	STRD	STP31_2	!setpoint 31 honderdtallen
	STRD	STP31_3	!setpoint 31 duizendtallen

	ANDNT	000.1
	NOP	1

L00773	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00793

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP32_0	!setpoint 32 eenheden
	STRD	STP32_1	!setpoint 32 tientallen
	STRD	STP32_2	!setpoint 32 honderdtallen
	STRD	STP32_3	!setpoint 32 duizendtallen

	ANDNT	000.1
	NOP	1

L00793	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00813

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP33_0	!setpoint 33 eenheden
	STRD	STP33_1	!setpoint 33 tientallen
	STRD	STP33_2	!setpoint 33 honderdtallen
	STRD	STP33_3	!setpoint 33 duizendtallen

	ANDNT	000.1
	NOP	1

L00813	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00833

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP34_0	!setpoint 34 eenheden
	STRD	STP34_1	!setpoint 34 tientallen
	STRD	STP34_2	!setpoint 34 honderdtallen
	STRD	STP34_3	!setpoint 34 duizendtallen

	ANDNT	000.1
	NOP	1

L00833	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00853

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP35_0	!setpoint 35 eenheden
	STRD	STP35_1	!setpoint 35 tientallen
	STRD	STP35_2	!setpoint 35 honderdtallen
	STRD	STP35_3	!setpoint 35 duizendtallen

	ANDNT	000.1
	NOP	1

L00853	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00873

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP36_0	!setpoint 36 eenheden
	STRD	STP36_1	!setpoint 36 tientallen
	STRD	STP36_2	!setpoint 36 honderdtallen
	STRD	STP36_3	!setpoint 36 duizendtallen

	ANDNT	000.1
	NOP	1

L00873	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00893

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP37_0	!setpoint 37 eenheden
	STRD	STP37_1	!setpoint 37 tientallen
	STRD	STP37_2	!setpoint 37 honderdtallen
	STRD	STP37_3	!setpoint 37 duizendtallen

	ANDNT	000.1
	NOP	1

L00893	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00913

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP38_0	!setpoint 38 eenheden
	STRD	STP38_1	!setpoint 38 tientallen
	STRD	STP38_2	!setpoint 38 honderdtallen
	STRD	STP38_3	!setpoint 38 duizendtallen

	ANDNT	000.1
	NOP	1

L00913	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1503	!constante 3
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00933

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP39_0	!setpoint 39 eenheden
	STRD	STP39_1	!setpoint 39 tientallen
	STRD	STP39_2	!setpoint 39 honderdtallen
	STRD	STP39_3	!setpoint 39 duizendtallen

	ANDNT	000.1
	NOP	1

L00933	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00953

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP40_0	!setpoint 40 eenheden
	STRD	STP40_1	!setpoint 40 tientallen
	STRD	STP40_2	!setpoint 40 honderdtallen
	STRD	STP40_3	!setpoint 40 duizendtallen

	ANDNT	000.1
	NOP	1

L00953	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00973

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP41_0	!setpoint 41 eenheden
	STRD	STP41_1	!setpoint 41 tientallen
	STRD	STP41_2	!setpoint 41 honderdtallen
	STRD	STP41_3	!setpoint 41 duizendtallen

	ANDNT	000.1
	NOP	1

L00973	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L00993

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP42_0	!setpoint 42 eenheden
	STRD	STP42_1	!setpoint 42 tientallen
	STRD	STP42_2	!setpoint 42 honderdtallen
	STRD	STP42_3	!setpoint 42 duizendtallen

	ANDNT	000.1
	NOP	1

L00993	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01013

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP43_0	!setpoint 43 eenheden
	STRD	STP43_1	!setpoint 43 tientallen
	STRD	STP43_2	!setpoint 43 honderdtallen
	STRD	STP43_3	!setpoint 43 duizendtallen

	ANDNT	000.1
	NOP	1

L01013	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01033

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP44_0	!setpoint 44 eenheden
	STRD	STP44_1	!setpoint 44 tientallen
	STRD	STP44_2	!setpoint 44 honderdtallen
	STRD	STP44_3	!setpoint 44 duizendtallen

	ANDNT	000.1
	NOP	1

L01033	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01053

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP45_0	!setpoint 45 eenheden
	STRD	STP45_1	!setpoint 45 tientallen
	STRD	STP45_2	!setpoint 45 honderdtallen
	STRD	STP45_3	!setpoint 45 duizendtallen

	ANDNT	000.1
	NOP	1

L01053	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01073

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP46_0	!setpoint 46 eenheden
	STRD	STP46_1	!setpoint 46 tientallen
	STRD	STP46_2	!setpoint 46 honderdtallen
	STRD	STP46_3	!setpoint 46 duizendtallen

	ANDNT	000.1
	NOP	1

L01073	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01093

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP47_0	!setpoint 47 eenheden
	STRD	STP47_1	!setpoint 47 tientallen
	STRD	STP47_2	!setpoint 47 honderdtallen
	STRD	STP47_3	!setpoint 47 duizendtallen

	ANDNT	000.1
	NOP	1

L01093	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01113

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP48_0	!setpoint 48 eenheden
	STRD	STP48_1	!setpoint 48 tientallen
	STRD	STP48_2	!setpoint 48 honderdtallen
	STRD	STP48_3	!setpoint 48 duizendtallen

	ANDNT	000.1
	NOP	1

L01113	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1504	!constante 4
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01133

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP49_0	!setpoint 49 eenheden
	STRD	STP49_1	!setpoint 49 tientallen
	STRD	STP49_2	!setpoint 49 honderdtallen
	STRD	STP49_3	!setpoint 49 duizendtallen

	ANDNT	000.1
	NOP	1

L01133	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01153

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP50_0	!setpoint 50 eenheden
	STRD	STP50_1	!setpoint 50 tientallen
	STRD	STP50_2	!setpoint 50 honderdtallen
	STRD	STP50_3	!setpoint 50 duizendtallen

	ANDNT	000.1
	NOP	1

L01153	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01173

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP51_0	!setpoint 51 eenheden
	STRD	STP51_1	!setpoint 51 tientallen
	STRD	STP51_2	!setpoint 51 honderdtallen
	STRD	STP51_3	!setpoint 51 duizendtallen

	ANDNT	000.1
	NOP	1

L01173	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01193

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP52_0	!setpoint 52 eenheden
	STRD	STP52_1	!setpoint 52 tientallen
	STRD	STP52_2	!setpoint 52 honderdtallen
	STRD	STP52_3	!setpoint 52 duizendtallen

	ANDNT	000.1
	NOP	1

L01193	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01213

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP53_0	!setpoint 53 eenheden
	STRD	STP53_1	!setpoint 53 tientallen
	STRD	STP53_2	!setpoint 53 honderdtallen
	STRD	STP53_3	!setpoint 53 duizendtallen

	ANDNT	000.1
	NOP	1

L01213	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01233

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP54_0	!setpoint 54 eenheden
	STRD	STP54_1	!setpoint 54 tientallen
	STRD	STP54_2	!setpoint 54 honderdtallen
	STRD	STP54_3	!setpoint 54 duizendtallen

	ANDNT	000.1
	NOP	1

L01233	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01253

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP55_0	!setpoint 55 eenheden
	STRD	STP55_1	!setpoint 55 tientallen
	STRD	STP55_2	!setpoint 55 honderdtallen
	STRD	STP55_3	!setpoint 55 duizendtallen

	ANDNT	000.1
	NOP	1

L01253	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01273

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP56_0	!setpoint 56 eenheden
	STRD	STP56_1	!setpoint 56 tientallen
	STRD	STP56_2	!setpoint 56 honderdtallen
	STRD	STP56_3	!setpoint 56 duizendtallen

	ANDNT	000.1
	NOP	1

L01273	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01293

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP57_0	!setpoint 57 eenheden
	STRD	STP57_1	!setpoint 57 tientallen
	STRD	STP57_2	!setpoint 57 honderdtallen
	STRD	STP57_3	!setpoint 57 duizendtallen

	ANDNT	000.1
	NOP	1

L01293	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01313

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP58_0	!setpoint 58 eenheden
	STRD	STP58_1	!setpoint 58 tientallen
	STRD	STP58_2	!setpoint 58 honderdtallen
	STRD	STP58_3	!setpoint 58 duizendtallen

	ANDNT	000.1
	NOP	1

L01313	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1505	!constante 5
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01333

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP59_0	!setpoint 59 eenheden
	STRD	STP59_1	!setpoint 59 tientallen
	STRD	STP59_2	!setpoint 59 honderdtallen
	STRD	STP59_3	!setpoint 59 duizendtallen

	ANDNT	000.1
	NOP	1

L01333	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01353

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP60_0	!setpoint 60 eenheden
	STRD	STP60_1	!setpoint 60 tientallen
	STRD	STP60_2	!setpoint 60 honderdtallen
	STRD	STP60_3	!setpoint 60 duizendtallen

	ANDNT	000.1
	NOP	1

L01353	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01373

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP61_0	!setpoint 61 eenheden
	STRD	STP61_1	!setpoint 61 tientallen
	STRD	STP61_2	!setpoint 61 honderdtallen
	STRD	STP61_3	!setpoint 61 duizendtallen

	ANDNT	000.1
	NOP	1

L01373	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01393

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP62_0	!setpoint 62 eenheden
	STRD	STP62_1	!setpoint 62 tientallen
	STRD	STP62_2	!setpoint 62 honderdtallen
	STRD	STP62_3	!setpoint 62 duizendtallen

	ANDNT	000.1
	NOP	1

L01393	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01413

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP63_0	!setpoint 63 eenheden
	STRD	STP63_1	!setpoint 63 tientallen
	STRD	STP63_2	!setpoint 63 honderdtallen
	STRD	STP63_3	!setpoint 63 duizendtallen

	ANDNT	000.1
	NOP	1

L01413	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01433

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP64_0	!setpoint 64 eenheden
	STRD	STP64_1	!setpoint 64 tientallen
	STRD	STP64_2	!setpoint 64 honderdtallen
	STRD	STP64_3	!setpoint 64 duizendtallen

	ANDNT	000.1
	NOP	1

L01433	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01453

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP65_0	!setpoint 65 eenheden
	STRD	STP65_1	!setpoint 65 tientallen
	STRD	STP65_2	!setpoint 65 honderdtallen
	STRD	STP65_3	!setpoint 65 duizendtallen

	ANDNT	000.1
	NOP	1

L01453	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01473

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP66_0	!setpoint 66 eenheden
	STRD	STP66_1	!setpoint 66 tientallen
	STRD	STP66_2	!setpoint 66 honderdtallen
	STRD	STP66_3	!setpoint 66 duizendtallen

	ANDNT	000.1
	NOP	1

L01473	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01493

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP67_0	!setpoint 67 eenheden
	STRD	STP67_1	!setpoint 67 tientallen
	STRD	STP67_2	!setpoint 67 honderdtallen
	STRD	STP67_3	!setpoint 67 duizendtallen

	ANDNT	000.1
	NOP	1

L01493	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01513

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP68_0	!setpoint 68 eenheden
	STRD	STP68_1	!setpoint 68 tientallen
	STRD	STP68_2	!setpoint 68 honderdtallen
	STRD	STP68_3	!setpoint 68 duizendtallen

	ANDNT	000.1
	NOP	1

L01513	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1506	!constante 6
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01533

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP69_0	!setpoint 69 eenheden
	STRD	STP69_1	!setpoint 69 tientallen
	STRD	STP69_2	!setpoint 69 honderdtallen
	STRD	STP69_3	!setpoint 69 duizendtallen

	ANDNT	000.1
	NOP	1

L01533	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01553

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP70_0	!setpoint 70 eenheden
	STRD	STP70_1	!setpoint 70 tientallen
	STRD	STP70_2	!setpoint 70 honderdtallen
	STRD	STP70_3	!setpoint 70 duizendtallen

	ANDNT	000.1
	NOP	1

L01553	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01573

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP71_0	!setpoint 71 eenheden
	STRD	STP71_1	!setpoint 71 tientallen
	STRD	STP71_2	!setpoint 71 honderdtallen
	STRD	STP71_3	!setpoint 71 duizendtallen

	ANDNT	000.1
	NOP	1

L01573	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01593

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP72_0	!setpoint 72 eenheden
	STRD	STP72_1	!setpoint 72 tientallen
	STRD	STP72_2	!setpoint 72 honderdtallen
	STRD	STP72_3	!setpoint 72 duizendtallen

	ANDNT	000.1
	NOP	1

L01593	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01613

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP73_0	!setpoint 73 eenheden
	STRD	STP73_1	!setpoint 73 tientallen
	STRD	STP73_2	!setpoint 73 honderdtallen
	STRD	STP73_3	!setpoint 73 duizendtallen

	ANDNT	000.1
	NOP	1

L01613	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01633

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP74_0	!setpoint 74 eenheden
	STRD	STP74_1	!setpoint 74 tientallen
	STRD	STP74_2	!setpoint 74 honderdtallen
	STRD	STP74_3	!setpoint 74 duizendtallen

	ANDNT	000.1
	NOP	1

L01633	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01653

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP75_0	!setpoint 75 eenheden
	STRD	STP75_1	!setpoint 75 tientallen
	STRD	STP75_2	!setpoint 75 honderdtallen
	STRD	STP75_3	!setpoint 75 duizendtallen

	ANDNT	000.1
	NOP	1

L01653	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01673

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP76_0	!setpoint 76 eenheden
	STRD	STP76_1	!setpoint 76 tientallen
	STRD	STP76_2	!setpoint 76 honderdtallen
	STRD	STP76_3	!setpoint 76 duizendtallen

	ANDNT	000.1
	NOP	1

L01673	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01693

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP77_0	!setpoint 77 eenheden
	STRD	STP77_1	!setpoint 77 tientallen
	STRD	STP77_2	!setpoint 77 honderdtallen
	STRD	STP77_3	!setpoint 77 duizendtallen

	ANDNT	000.1
	NOP	1

L01693	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01713

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP78_0	!setpoint 78 eenheden
	STRD	STP78_1	!setpoint 78 tientallen
	STRD	STP78_2	!setpoint 78 honderdtallen
	STRD	STP78_3	!setpoint 78 duizendtallen

	ANDNT	000.1
	NOP	1

L01713	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1507	!constante 7
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01733

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP79_0	!setpoint 79 eenheden
	STRD	STP79_1	!setpoint 79 tientallen
	STRD	STP79_2	!setpoint 79 honderdtallen
	STRD	STP79_3	!setpoint 79 duizendtallen

	ANDNT	000.1
	NOP	1

L01733	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01753

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP80_0	!setpoint 80 eenheden
	STRD	STP80_1	!setpoint 80 tientallen
	STRD	STP80_2	!setpoint 80 honderdtallen
	STRD	STP80_3	!setpoint 80 duizendtallen

	ANDNT	000.1
	NOP	1

L01753	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01773

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP81_0	!setpoint 81 eenheden
	STRD	STP81_1	!setpoint 81 tientallen
	STRD	STP81_2	!setpoint 81 honderdtallen
	STRD	STP81_3	!setpoint 81 duizendtallen

	ANDNT	000.1
	NOP	1

L01773	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01793

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP82_0	!setpoint 82 eenheden
	STRD	STP82_1	!setpoint 82 tientallen
	STRD	STP82_2	!setpoint 82 honderdtallen
	STRD	STP82_3	!setpoint 82 duizendtallen

	ANDNT	000.1
	NOP	1

L01793	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01813

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP83_0	!setpoint 83 eenheden
	STRD	STP83_1	!setpoint 83 tientallen
	STRD	STP83_2	!setpoint 83 honderdtallen
	STRD	STP83_3	!setpoint 83 duizendtallen

	ANDNT	000.1
	NOP	1

L01813	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01833

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP84_0	!setpoint 84 eenheden
	STRD	STP84_1	!setpoint 84 tientallen
	STRD	STP84_2	!setpoint 84 honderdtallen
	STRD	STP84_3	!setpoint 84 duizendtallen

	ANDNT	000.1
	NOP	1

L01833	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01853

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP85_0	!setpoint 85 eenheden
	STRD	STP85_1	!setpoint 85 tientallen
	STRD	STP85_2	!setpoint 85 honderdtallen
	STRD	STP85_3	!setpoint 85 duizendtallen

	ANDNT	000.1
	NOP	1

L01853	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01873

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP86_0	!setpoint 86 eenheden
	STRD	STP86_1	!setpoint 86 tientallen
	STRD	STP86_2	!setpoint 86 honderdtallen
	STRD	STP86_3	!setpoint 86 duizendtallen

	ANDNT	000.1
	NOP	1

L01873	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01893

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP87_0	!setpoint 87 eenheden
	STRD	STP87_1	!setpoint 87 tientallen
	STRD	STP87_2	!setpoint 87 honderdtallen
	STRD	STP87_3	!setpoint 87 duizendtallen

	ANDNT	000.1
	NOP	1

L01893	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01913

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP88_0	!setpoint 88 eenheden
	STRD	STP88_1	!setpoint 88 tientallen
	STRD	STP88_2	!setpoint 88 honderdtallen
	STRD	STP88_3	!setpoint 88 duizendtallen

	ANDNT	000.1
	NOP	1

L01913	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1508	!constante 8
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01933

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP89_0	!setpoint 89 eenheden
	STRD	STP89_1	!setpoint 89 tientallen
	STRD	STP89_2	!setpoint 89 honderdtallen
	STRD	STP89_3	!setpoint 89 duizendtallen

	ANDNT	000.1
	NOP	1

L01933	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01953

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP90_0	!setpoint 90 eenheden
	STRD	STP90_1	!setpoint 90 tientallen
	STRD	STP90_2	!setpoint 90 honderdtallen
	STRD	STP90_3	!setpoint 90 duizendtallen

	ANDNT	000.1
	NOP	1

L01953	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01973

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP91_0	!setpoint 91 eenheden
	STRD	STP91_1	!setpoint 91 tientallen
	STRD	STP91_2	!setpoint 91 honderdtallen
	STRD	STP91_3	!setpoint 91 duizendtallen

	ANDNT	000.1
	NOP	1

L01973	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L01993

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP92_0	!setpoint 92 eenheden
	STRD	STP92_1	!setpoint 92 tientallen
	STRD	STP92_2	!setpoint 92 honderdtallen
	STRD	STP92_3	!setpoint 92 duizendtallen

	ANDNT	000.1
	NOP	1

L01993	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L02013

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP93_0	!setpoint 93 eenheden
	STRD	STP93_1	!setpoint 93 tientallen
	STRD	STP93_2	!setpoint 93 honderdtallen
	STRD	STP93_3	!setpoint 93 duizendtallen

	ANDNT	000.1
	NOP	1

L02013	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L02033

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP94_0	!setpoint 94 eenheden
	STRD	STP94_1	!setpoint 94 tientallen
	STRD	STP94_2	!setpoint 94 honderdtallen
	STRD	STP94_3	!setpoint 94 duizendtallen

	ANDNT	000.1
	NOP	1

L02033	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L02053

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP95_0	!setpoint 95 eenheden
	STRD	STP95_1	!setpoint 95 tientallen
	STRD	STP95_2	!setpoint 95 honderdtallen
	STRD	STP95_3	!setpoint 95 duizendtallen

	ANDNT	000.1
	NOP	1

L02053	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L02073

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP96_0	!setpoint 96 eenheden
	STRD	STP96_1	!setpoint 96 tientallen
	STRD	STP96_2	!setpoint 96 honderdtallen
	STRD	STP96_3	!setpoint 96 duizendtallen

	ANDNT	000.1
	NOP	1

L02073	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	JFRF	L02093

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP97_0	!setpoint 97 eenheden
	STRD	STP97_1	!setpoint 97 tientallen
	STRD	STP97_2	!setpoint 97 honderdtallen
	STRD	STP97_3	!setpoint 97 duizendtallen

	ANDNT	000.1
	NOP	1

L02093	AND	000.1
	FTCHD	DWS1_1	!eenheid DWS
	FTCHD	DWS1_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1509	!constante 9
	STRB	RESULT	!F=C

	AND	RESULT	!F=C
	NOP	1

	AND	RESULT	!F=C
	AND	ENTER	!triggerpuls enterdrukkn.
	FTCHD	SETP_0	!ingevoerde setpoint eenheden
	FTCHD	SETP_1	!ingevoerde setpoint tientallen
	FTCHD	SETP_2	!ingevoerde setpoint honderdtallen
	FTCHD	SETP_3	!ingevoerde setpoint duizendtallen
	STRD	STP99_0	!setpoint 99 eenheden
	STRD	STP99_1	!setpoint 99 tientallen
	STRD	STP99_2	!setpoint 99 honderdtallen
	STRD	STP99_3	!setpoint 99 duizendtallen
	NOP	89
!                               DR_DSP
!				******
!
	AND	000.1
	FTCHC	00
	STRD	1500	!constante 0

	AND	000.1
	FTCHC	01
	STRD	1501	!constante 1

	AND	000.1
	FTCHC	02
	STRD	1502	!constante 2

	AND	000.1
	FTCHC	03
	STRD	1503	!constante 3

	AND	000.1
	FTCHC	04
	STRD	1504	!constante 4

	AND	000.1
	FTCHC	05
	STRD	1505	!constante 5

	AND	000.1
	FTCHC	06
	STRD	1506	!constante 6

	AND	000.1
	FTCHC	07
	STRD	1507	!constante 7

	AND	000.1
	FTCHC	08
	STRD	1508	!constante 8

	AND	000.1
	FTCHC	09
	STRD	1509	!constante 9

	ANDNT	LAMPTEST	!lampentest "8"
	JFRF	L04131

	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02251

	AND	RESULT1	!F=C
	FTCHD	DSP00_0	!display 00 eenheden
	FTCHD	DSP00_1	!display 00 tientallen
	FTCHD	DSP00_2	!display 00 honderdtallen
	FTCHD	DSP00_3	!display 00 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02251	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02270

	AND	RESULT1	!F=C
	FTCHD	DSP01_0	!display 01 eenheden
	FTCHD	DSP01_1	!display 01 tientallen
	FTCHD	DSP01_2	!display 01 honderdtallen
	FTCHD	DSP01_3	!display 01 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02270	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02289

	AND	RESULT1	!F=C
	FTCHD	DSP02_0	!display 02 eenheden
	FTCHD	DSP02_1	!display 02 tientallen
	FTCHD	DSP02_2	!display 02 honderdtallen
	FTCHD	DSP02_3	!display 02 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02289	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02308

	AND	RESULT1	!F=C
	FTCHD	DSP03_0	!display 03 eenheden
	FTCHD	DSP03_1	!display 03 tientallen
	FTCHD	DSP03_2	!display 03 honderdtallen
	FTCHD	DSP03_3	!display 03 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02308	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02327

	AND	RESULT1	!F=C
	FTCHD	DSP04_0	!display 04 eenheden
	FTCHD	DSP04_1	!display 04 tientallen
	FTCHD	DSP04_2	!display 04 honderdtallen
	FTCHD	DSP04_3	!display 04 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02327	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02346

	AND	RESULT1	!F=C
	FTCHD	DSP05_0	!display 05 eenheden
	FTCHD	DSP05_1	!display 05 tientallen
	FTCHD	DSP05_2	!display 05 honderdtallen
	FTCHD	DSP05_3	!display 05 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02346	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02365

	AND	RESULT1	!F=C
	FTCHD	DSP06_0	!display 06 eenheden
	FTCHD	DSP06_1	!display 06 tientallen
	FTCHD	DSP06_2	!display 06 honderdtallen
	FTCHD	DSP06_3	!display 06 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02365	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02384

	AND	RESULT1	!F=C
	FTCHD	DSP07_0	!display 07 eenheden
	FTCHD	DSP07_1	!display 07 tientallen
	FTCHD	DSP07_2	!display 07 honderdtallen
	FTCHD	DSP07_3	!display 07 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02384	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02403

	AND	RESULT1	!F=C
	FTCHD	DSP08_0	!display 08 eenheden
	FTCHD	DSP08_1	!display 08 tientallen
	FTCHD	DSP08_2	!display 08 honderdtallen
	FTCHD	DSP08_3	!display 08 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02403	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1500	!constante 0
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02422

	AND	RESULT1	!F=C
	FTCHD	DSP09_0	!display 09 eenheden
	FTCHD	DSP09_1	!display 09 tientallen
	FTCHD	DSP09_2	!display 09 honderdtallen
	FTCHD	DSP09_3	!display 09 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02422	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02441

	AND	RESULT1	!F=C
	FTCHD	DSP10_0	!display 10 eenheden
	FTCHD	DSP10_1	!display 10 tientallen
	FTCHD	DSP10_2	!display 10 honderdtallen
	FTCHD	DSP10_3	!display 10 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02441	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02460

	AND	RESULT1	!F=C
	FTCHD	DSP11_0	!display 11 eenheden
	FTCHD	DSP11_1	!display 11 tientallen
	FTCHD	DSP11_2	!display 11 honderdtallen
	FTCHD	DSP11_3	!display 11 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02460	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02479

	AND	RESULT1	!F=C
	FTCHD	DSP12_0	!display 12 eenheden
	FTCHD	DSP12_1	!display 12 tientallen
	FTCHD	DSP12_2	!display 12 honderdtallen
	FTCHD	DSP12_3	!display 12 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02479	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02498

	AND	RESULT1	!F=C
	FTCHD	DSP13_0	!display 13 eenheden
	FTCHD	DSP13_1	!display 13 tientallen
	FTCHD	DSP13_2	!display 13 honderdtallen
	FTCHD	DSP13_3	!display 13 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02498	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02517

	AND	RESULT1	!F=C
	FTCHD	DSP14_0	!display 14 eenheden
	FTCHD	DSP14_1	!display 14 tientallen
	FTCHD	DSP14_2	!display 14 honderdtallen
	FTCHD	DSP14_3	!display 14 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02517	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02536

	AND	RESULT1	!F=C
	FTCHD	DSP15_0	!display 15 eenheden
	FTCHD	DSP15_1	!display 15 tientallen
	FTCHD	DSP15_2	!display 15 honderdtallen
	FTCHD	DSP15_3	!display 15 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02536	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02555

	AND	RESULT1	!F=C
	FTCHD	DSP16_0	!display 16 eenheden
	FTCHD	DSP16_1	!display 16 tientallen
	FTCHD	DSP16_2	!display 16 honderdtallen
	FTCHD	DSP16_3	!display 16 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02555	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02574

	AND	RESULT1	!F=C
	FTCHD	DSP17_0	!display 17 eenheden
	FTCHD	DSP17_1	!display 17 tientallen
	FTCHD	DSP17_2	!display 17 honderdtallen
	FTCHD	DSP17_3	!display 17 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02574	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02593

	AND	RESULT1	!F=C
	FTCHD	DSP18_0	!display 18 eenheden
	FTCHD	DSP18_1	!display 18 tientallen
	FTCHD	DSP18_2	!display 18 honderdtallen
	FTCHD	DSP18_3	!display 18 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02593	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1501	!constante 1
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02612

	AND	RESULT1	!F=C
	FTCHD	DSP19_0	!display 19 eenheden
	FTCHD	DSP19_1	!display 19 tientallen
	FTCHD	DSP19_2	!display 19 honderdtallen
	FTCHD	DSP19_3	!display 19 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02612	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02631

	AND	RESULT1	!F=C
	FTCHD	DSP20_0	!display 20 eenheden
	FTCHD	DSP20_1	!display 20 tientallen
	FTCHD	DSP20_2	!display 20 honderdtallen
	FTCHD	DSP20_3	!display 20 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02631	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02650

	AND	RESULT1	!F=C
	FTCHD	DSP21_0	!display 21 eenheden
	FTCHD	DSP21_1	!display 21 tientallen
	FTCHD	DSP21_2	!display 21 honderdtallen
	FTCHD	DSP21_3	!display 21 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02650	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02669

	AND	RESULT1	!F=C
	FTCHD	DSP22_0	!display 22 eenheden
	FTCHD	DSP22_1	!display 22 tientallen
	FTCHD	DSP22_2	!display 22 honderdtallen
	FTCHD	DSP22_3	!display 22 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02669	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02688

	AND	RESULT1	!F=C
	FTCHD	DSP23_0	!display 23 eenheden
	FTCHD	DSP23_1	!display 23 tientallen
	FTCHD	DSP23_2	!display 23 honderdtallen
	FTCHD	DSP23_3	!display 23 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02688	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02707

	AND	RESULT1	!F=C
	FTCHD	DSP24_0	!display 24 eenheden
	FTCHD	DSP24_1	!display 24 tientallen
	FTCHD	DSP24_2	!display 24 honderdtallen
	FTCHD	DSP24_3	!display 24 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02707	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02726

	AND	RESULT1	!F=C
	FTCHD	DSP25_0	!display 25 eenheden
	FTCHD	DSP25_1	!display 25 tientallen
	FTCHD	DSP25_2	!display 25 honderdtallen
	FTCHD	DSP25_3	!display 25 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02726	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02745

	AND	RESULT1	!F=C
	FTCHD	DSP26_0	!display 26 eenheden
	FTCHD	DSP26_1	!display 26 tientallen
	FTCHD	DSP26_2	!display 26 honderdtallen
	FTCHD	DSP26_3	!display 26 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02745	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02764

	AND	RESULT1	!F=C
	FTCHD	DSP27_0	!display 27 eenheden
	FTCHD	DSP27_1	!display 27 tientallen
	FTCHD	DSP27_2	!display 27 honderdtallen
	FTCHD	DSP27_3	!display 27 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02764	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02783

	AND	RESULT1	!F=C
	FTCHD	DSP28_0	!display 28 eenheden
	FTCHD	DSP28_1	!display 28 tientallen
	FTCHD	DSP28_2	!display 28 honderdtallen
	FTCHD	DSP28_3	!display 28 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02783	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1502	!constante 2
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02802

	AND	RESULT1	!F=C
	FTCHD	DSP29_0	!display 29 eenheden
	FTCHD	DSP29_1	!display 29 tientallen
	FTCHD	DSP29_2	!display 29 honderdtallen
	FTCHD	DSP29_3	!display 29 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02802	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02821

	AND	RESULT1	!F=C
	FTCHD	DSP30_0	!display 30 eenheden
	FTCHD	DSP30_1	!display 30 tientallen
	FTCHD	DSP30_2	!display 30 honderdtallen
	FTCHD	DSP30_3	!display 30 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02821	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02840

	AND	RESULT1	!F=C
	FTCHD	DSP31_0	!display 31 eenheden
	FTCHD	DSP31_1	!display 31 tientallen
	FTCHD	DSP31_2	!display 31 honderdtallen
	FTCHD	DSP31_3	!display 31 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02840	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02859

	AND	RESULT1	!F=C
	FTCHD	DSP32_0	!display 32 eenheden
	FTCHD	DSP32_1	!display 32 tientallen
	FTCHD	DSP32_2	!display 32 honderdtallen
	FTCHD	DSP32_3	!display 32 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02859	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02878

	AND	RESULT1	!F=C
	FTCHD	DSP33_0	!display 33 eenheden
	FTCHD	DSP33_1	!display 33 tientallen
	FTCHD	DSP33_2	!display 33 honderdtallen
	FTCHD	DSP33_3	!display 33 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02878	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02897

	AND	RESULT1	!F=C
	FTCHD	DSP34_0	!display 34 eenheden
	FTCHD	DSP34_1	!display 34 tientallen
	FTCHD	DSP34_2	!display 34 honderdtallen
	FTCHD	DSP34_3	!display 34 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02897	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02916

	AND	RESULT1	!F=C
	FTCHD	DSP35_0	!display 35 eenheden
	FTCHD	DSP35_1	!display 35 tientallen
	FTCHD	DSP35_2	!display 35 honderdtallen
	FTCHD	DSP35_3	!display 35 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02916	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02935

	AND	RESULT1	!F=C
	FTCHD	DSP36_0	!display 36 eenheden
	FTCHD	DSP36_1	!display 36 tientallen
	FTCHD	DSP36_2	!display 36 honderdtallen
	FTCHD	DSP36_3	!display 36 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02935	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02954

	AND	RESULT1	!F=C
	FTCHD	DSP37_0	!display 37 eenheden
	FTCHD	DSP37_1	!display 37 tientallen
	FTCHD	DSP37_2	!display 37 honderdtallen
	FTCHD	DSP37_3	!display 37 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02954	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02973

	AND	RESULT1	!F=C
	FTCHD	DSP38_0	!display 38 eenheden
	FTCHD	DSP38_1	!display 38 tientallen
	FTCHD	DSP38_2	!display 38 honderdtallen
	FTCHD	DSP38_3	!display 38 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02973	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1503	!constante 3
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L02992

	AND	RESULT1	!F=C
	FTCHD	DSP39_0	!display 39 eenheden
	FTCHD	DSP39_1	!display 39 tientallen
	FTCHD	DSP39_2	!display 39 honderdtallen
	FTCHD	DSP39_3	!display 39 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L02992	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03011

	AND	RESULT1	!F=C
	FTCHD	DSP40_0	!display 40 eenheden
	FTCHD	DSP40_1	!display 40 tientallen
	FTCHD	DSP40_2	!display 40 honderdtallen
	FTCHD	DSP40_3	!display 40 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03011	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03030

	AND	RESULT1	!F=C
	FTCHD	DSP41_0	!display 41 eenheden
	FTCHD	DSP41_1	!display 41 tientallen
	FTCHD	DSP41_2	!display 41 honderdtallen
	FTCHD	DSP41_3	!display 41 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03030	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03049

	AND	RESULT1	!F=C
	FTCHD	DSP42_0	!display 42 eenheden
	FTCHD	DSP42_1	!display 42 tientallen
	FTCHD	DSP42_2	!display 42 honderdtallen
	FTCHD	DSP42_3	!display 42 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03049	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03068

	AND	RESULT1	!F=C
	FTCHD	DSP43_0	!display 43 eenheden
	FTCHD	DSP43_1	!display 43 tientallen
	FTCHD	DSP43_2	!display 43 honderdtallen
	FTCHD	DSP43_3	!display 43 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03068	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03087

	AND	RESULT1	!F=C
	FTCHD	DSP44_0	!display 44 eenheden
	FTCHD	DSP44_1	!display 44 tientallen
	FTCHD	DSP44_2	!display 44 honderdtallen
	FTCHD	DSP44_3	!display 44 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03087	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03106

	AND	RESULT1	!F=C
	FTCHD	DSP45_0	!display 45 eenheden
	FTCHD	DSP45_1	!display 45 tientallen
	FTCHD	DSP45_2	!display 45 honderdtallen
	FTCHD	DSP45_3	!display 45 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03106	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03125

	AND	RESULT1	!F=C
	FTCHD	DSP46_0	!display 46 eenheden
	FTCHD	DSP46_1	!display 46 tientallen
	FTCHD	DSP46_2	!display 46 honderdtallen
	FTCHD	DSP46_3	!display 46 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03125	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03144

	AND	RESULT1	!F=C
	FTCHD	DSP47_0	!display 47 eenheden
	FTCHD	DSP47_1	!display 47 tientallen
	FTCHD	DSP47_2	!display 47 honderdtallen
	FTCHD	DSP47_3	!display 47 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03144	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03163

	AND	RESULT1	!F=C
	FTCHD	DSP48_0	!display 48 eenheden
	FTCHD	DSP48_1	!display 48 tientallen
	FTCHD	DSP48_2	!display 48 honderdtallen
	FTCHD	DSP48_3	!display 48 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03163	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1504	!constante 4
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03182

	AND	RESULT1	!F=C
	FTCHD	DSP49_0	!display 49 eenheden
	FTCHD	DSP49_1	!display 49 tientallen
	FTCHD	DSP49_2	!display 49 honderdtallen
	FTCHD	DSP49_3	!display 49 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03182	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03201

	AND	RESULT1	!F=C
	FTCHD	DSP50_0	!display 50 eenheden
	FTCHD	DSP50_1	!display 50 tientallen
	FTCHD	DSP50_2	!display 50 honderdtallen
	FTCHD	DSP50_3	!display 50 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03201	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03220

	AND	RESULT1	!F=C
	FTCHD	DSP51_0	!display 51 eenheden
	FTCHD	DSP51_1	!display 51 tientallen
	FTCHD	DSP51_2	!display 51 honderdtallen
	FTCHD	DSP51_3	!display 51 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03220	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03239

	AND	RESULT1	!F=C
	FTCHD	DSP52_0	!display 52 eenheden
	FTCHD	DSP52_1	!display 52 tientallen
	FTCHD	DSP52_2	!display 52 honderdtallen
	FTCHD	DSP52_3	!display 52 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03239	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03258

	AND	RESULT1	!F=C
	FTCHD	DSP53_0	!display 53 eenheden
	FTCHD	DSP53_1	!display 53 tientallen
	FTCHD	DSP53_2	!display 53 honderdtallen
	FTCHD	DSP53_3	!display 53 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03258	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03277

	AND	RESULT1	!F=C
	FTCHD	DSP54_0	!display 54 eenheden
	FTCHD	DSP54_1	!display 54 tientallen
	FTCHD	DSP54_2	!display 54 honderdtallen
	FTCHD	DSP54_3	!display 54 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03277	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03296

	AND	RESULT1	!F=C
	FTCHD	DSP55_0	!display 55 eenheden
	FTCHD	DSP55_1	!display 55 tientallen
	FTCHD	DSP55_2	!display 55 honderdtallen
	FTCHD	DSP55_3	!display 55 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03296	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03315

	AND	RESULT1	!F=C
	FTCHD	DSP56_0	!display 56 eenheden
	FTCHD	DSP56_1	!display 56 tientallen
	FTCHD	DSP56_2	!display 56 honderdtallen
	FTCHD	DSP56_3	!display 56 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03315	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03334

	AND	RESULT1	!F=C
	FTCHD	DSP57_0	!display 57 eenheden
	FTCHD	DSP57_1	!display 57 tientallen
	FTCHD	DSP57_2	!display 57 honderdtallen
	FTCHD	DSP57_3	!display 57 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03334	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03353

	AND	RESULT1	!F=C
	FTCHD	DSP58_0	!display 58 eenheden
	FTCHD	DSP58_1	!display 58 tientallen
	FTCHD	DSP58_2	!display 58 honderdtallen
	FTCHD	DSP58_3	!display 58 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03353	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1505	!constante 5
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03372

	AND	RESULT1	!F=C
	FTCHD	DSP59_0	!display 59 eenheden
	FTCHD	DSP59_1	!display 59 tientallen
	FTCHD	DSP59_2	!display 59 honderdtallen
	FTCHD	DSP59_3	!display 59 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03372	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03391

	AND	RESULT1	!F=C
	FTCHD	DSP60_0	!display 60 eenheden
	FTCHD	DSP60_1	!display 60 tientallen
	FTCHD	DSP60_2	!display 60 honderdtallen
	FTCHD	DSP60_3	!display 60 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03391	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03410

	AND	RESULT1	!F=C
	FTCHD	DSP61_0	!display 61 eenheden
	FTCHD	DSP61_1	!display 61 tientallen
	FTCHD	DSP61_2	!display 61 honderdtallen
	FTCHD	DSP61_3	!display 61 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03410	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03429

	AND	RESULT1	!F=C
	FTCHD	DSP62_0	!display 62 eenheden
	FTCHD	DSP62_1	!display 62 tientallen
	FTCHD	DSP62_2	!display 62 honderdtallen
	FTCHD	DSP62_3	!display 62 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03429	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03448

	AND	RESULT1	!F=C
	FTCHD	DSP63_0	!display 63 eenheden
	FTCHD	DSP63_1	!display 63 tientallen
	FTCHD	DSP63_2	!display 63 honderdtallen
	FTCHD	DSP63_3	!display 63 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03448	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03467

	AND	RESULT1	!F=C
	FTCHD	DSP64_0	!display 64 eenheden
	FTCHD	DSP64_1	!display 64 tientallen
	FTCHD	DSP64_2	!display 64 honderdtallen
	FTCHD	DSP64_3	!display 64 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03467	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03486

	AND	RESULT1	!F=C
	FTCHD	DSP65_0	!display 65 eenheden
	FTCHD	DSP65_1	!display 65 tientallen
	FTCHD	DSP65_2	!display 65 honderdtallen
	FTCHD	DSP65_3	!display 65 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03486	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03505

	AND	RESULT1	!F=C
	FTCHD	DSP66_0	!display 66 eenheden
	FTCHD	DSP66_1	!display 66 tientallen
	FTCHD	DSP66_2	!display 66 honderdtallen
	FTCHD	DSP66_3	!display 66 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03505	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03524

	AND	RESULT1	!F=C
	FTCHD	DSP67_0	!display 67 eenheden
	FTCHD	DSP67_1	!display 67 tientallen
	FTCHD	DSP67_2	!display 67 honderdtallen
	FTCHD	DSP67_3	!display 67 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03524	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03543

	AND	RESULT1	!F=C
	FTCHD	DSP68_0	!display 68 eenheden
	FTCHD	DSP68_1	!display 68 tientallen
	FTCHD	DSP68_2	!display 68 honderdtallen
	FTCHD	DSP68_3	!display 68 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03543	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1506	!constante 6
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03562

	AND	RESULT1	!F=C
	FTCHD	DSP69_0	!display 69 eenheden
	FTCHD	DSP69_1	!display 69 tientallen
	FTCHD	DSP69_2	!display 69 honderdtallen
	FTCHD	DSP69_3	!display 69 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03562	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03581

	AND	RESULT1	!F=C
	FTCHD	DSP70_0	!display 70 eenheden
	FTCHD	DSP70_1	!display 70 tientallen
	FTCHD	DSP70_2	!display 70 honderdtallen
	FTCHD	DSP70_3	!display 70 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03581	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03600

	AND	RESULT1	!F=C
	FTCHD	DSP71_0	!display 71 eenheden
	FTCHD	DSP71_1	!display 71 tientallen
	FTCHD	DSP71_2	!display 71 honderdtallen
	FTCHD	DSP71_3	!display 71 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03600	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03619

	AND	RESULT1	!F=C
	FTCHD	DSP72_0	!display 72 eenheden
	FTCHD	DSP72_1	!display 72 tientallen
	FTCHD	DSP72_2	!display 72 honderdtallen
	FTCHD	DSP72_3	!display 72 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03619	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03638

	AND	RESULT1	!F=C
	FTCHD	DSP73_0	!display 73 eenheden
	FTCHD	DSP73_1	!display 73 tientallen
	FTCHD	DSP73_2	!display 73 honderdtallen
	FTCHD	DSP73_3	!display 73 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03638	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03657

	AND	RESULT1	!F=C
	FTCHD	DSP74_0	!display 74 eenheden
	FTCHD	DSP74_1	!display 74 tientallen
	FTCHD	DSP74_2	!display 74 honderdtallen
	FTCHD	DSP74_3	!display 74 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03657	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03676

	AND	RESULT1	!F=C
	FTCHD	DSP75_0	!display 75 eenheden
	FTCHD	DSP75_1	!display 75 tientallen
	FTCHD	DSP75_2	!display 75 honderdtallen
	FTCHD	DSP75_3	!display 75 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03676	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03695

	AND	RESULT1	!F=C
	FTCHD	DSP76_0	!display 76 eenheden
	FTCHD	DSP76_1	!display 76 tientallen
	FTCHD	DSP76_2	!display 76 honderdtallen
	FTCHD	DSP76_3	!display 76 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03695	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03714

	AND	RESULT1	!F=C
	FTCHD	DSP77_0	!display 77 eenheden
	FTCHD	DSP77_1	!display 77 tientallen
	FTCHD	DSP77_2	!display 77 honderdtallen
	FTCHD	DSP77_3	!display 77 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03714	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03733

	AND	RESULT1	!F=C
	FTCHD	DSP78_0	!display 78 eenheden
	FTCHD	DSP78_1	!display 78 tientallen
	FTCHD	DSP78_2	!display 78 honderdtallen
	FTCHD	DSP78_3	!display 78 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03733	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1507	!constante 7
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03752

	AND	RESULT1	!F=C
	FTCHD	DSP79_0	!display 79 eenheden
	FTCHD	DSP79_1	!display 79 tientallen
	FTCHD	DSP79_2	!display 79 honderdtallen
	FTCHD	DSP79_3	!display 79 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03752	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03771

	AND	RESULT1	!F=C
	FTCHD	DSP80_0	!display 80 eenheden
	FTCHD	DSP80_1	!display 80 tientallen
	FTCHD	DSP80_2	!display 80 honderdtallen
	FTCHD	DSP80_3	!display 80 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03771	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03790

	AND	RESULT1	!F=C
	FTCHD	DSP81_0	!display 81 eenheden
	FTCHD	DSP81_1	!display 81 tientallen
	FTCHD	DSP81_2	!display 81 honderdtallen
	FTCHD	DSP81_3	!display 81 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03790	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03809

	AND	RESULT1	!F=C
	FTCHD	DSP82_0	!display 82 eenheden
	FTCHD	DSP82_1	!display 82 tientallen
	FTCHD	DSP82_2	!display 82 honderdtallen
	FTCHD	DSP82_3	!display 82 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03809	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03828

	AND	RESULT1	!F=C
	FTCHD	DSP83_0	!display 83 eenheden
	FTCHD	DSP83_1	!display 83 tientallen
	FTCHD	DSP83_2	!display 83 honderdtallen
	FTCHD	DSP83_3	!display 83 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03828	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03847

	AND	RESULT1	!F=C
	FTCHD	DSP84_0	!display 84 eenheden
	FTCHD	DSP84_1	!display 84 tientallen
	FTCHD	DSP84_2	!display 84 honderdtallen
	FTCHD	DSP84_3	!display 84 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03847	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03866

	AND	RESULT1	!F=C
	FTCHD	DSP85_0	!display 85 eenheden
	FTCHD	DSP85_1	!display 85 tientallen
	FTCHD	DSP85_2	!display 85 honderdtallen
	FTCHD	DSP85_3	!display 85 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03866	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03885

	AND	RESULT1	!F=C
	FTCHD	DSP86_0	!display 86 eenheden
	FTCHD	DSP86_1	!display 86 tientallen
	FTCHD	DSP86_2	!display 86 honderdtallen
	FTCHD	DSP86_3	!display 86 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03885	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03904

	AND	RESULT1	!F=C
	FTCHD	DSP87_0	!display 87 eenheden
	FTCHD	DSP87_1	!display 87 tientallen
	FTCHD	DSP87_2	!display 87 honderdtallen
	FTCHD	DSP87_3	!display 87 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03904	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03923

	AND	RESULT1	!F=C
	FTCHD	DSP88_0	!display 88 eenheden
	FTCHD	DSP88_1	!display 88 tientallen
	FTCHD	DSP88_2	!display 88 honderdtallen
	FTCHD	DSP88_3	!display 88 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03923	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1508	!constante 8
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03942

	AND	RESULT1	!F=C
	FTCHD	DSP89_0	!display 89 eenheden
	FTCHD	DSP89_1	!display 89 tientallen
	FTCHD	DSP89_2	!display 89 honderdtallen
	FTCHD	DSP89_3	!display 89 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03942	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1500	!constante 0
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03961

	AND	RESULT1	!F=C
	FTCHD	DSP90_0	!display 90 eenheden
	FTCHD	DSP90_1	!display 90 tientallen
	FTCHD	DSP90_2	!display 90 honderdtallen
	FTCHD	DSP90_3	!display 90 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03961	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1501	!constante 1
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03980

	AND	RESULT1	!F=C
	FTCHD	DSP91_0	!display 91 eenheden
	FTCHD	DSP91_1	!display 91 tientallen
	FTCHD	DSP91_2	!display 91 honderdtallen
	FTCHD	DSP91_3	!display 91 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03980	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1502	!constante 2
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L03999

	AND	RESULT1	!F=C
	FTCHD	DSP92_0	!display 92 eenheden
	FTCHD	DSP92_1	!display 92 tientallen
	FTCHD	DSP92_2	!display 92 honderdtallen
	FTCHD	DSP92_3	!display 92 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L03999	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1503	!constante 3
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04018

	AND	RESULT1	!F=C
	FTCHD	DSP93_0	!display 93 eenheden
	FTCHD	DSP93_1	!display 93 tientallen
	FTCHD	DSP93_2	!display 93 honderdtallen
	FTCHD	DSP93_3	!display 93 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04018	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1504	!constante 4
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04037

	AND	RESULT1	!F=C
	FTCHD	DSP94_0	!display 94 eenheden
	FTCHD	DSP94_1	!display 94 tientallen
	FTCHD	DSP94_2	!display 94 honderdtallen
	FTCHD	DSP94_3	!display 94 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04037	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1505	!constante 5
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04056

	AND	RESULT1	!F=C
	FTCHD	DSP95_0	!display 95 eenheden
	FTCHD	DSP95_1	!display 95 tientallen
	FTCHD	DSP95_2	!display 95 honderdtallen
	FTCHD	DSP95_3	!display 95 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04056	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1506	!constante 6
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04075

	AND	RESULT1	!F=C
	FTCHD	DSP96_0	!display 96 eenheden
	FTCHD	DSP96_1	!display 96 tientallen
	FTCHD	DSP96_2	!display 96 honderdtallen
	FTCHD	DSP96_3	!display 96 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04075	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1507	!constante 7
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04094

	AND	RESULT1	!F=C
	FTCHD	DSP97_0	!display 97 eenheden
	FTCHD	DSP97_1	!display 97 tientallen
	FTCHD	DSP97_2	!display 97 honderdtallen
	FTCHD	DSP97_3	!display 97 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04094	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1508	!constante 8
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04113

	AND	RESULT1	!F=C
	FTCHD	DSP98_0	!display 98 eenheden
	FTCHD	DSP98_1	!display 98 tientallen
	FTCHD	DSP98_2	!display 98 honderdtallen
	FTCHD	DSP98_3	!display 98 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.

	ANDNT	000.1
	JFRF	L04130

L04113	AND	000.1
	FTCHD	DWS2_1	!eenheid DWS
	FTCHD	DWS2_2	!tiental DWS
	COMP	1509	!constante 9
	COMP	1509	!constante 9
	STRB	RESULT1	!F=C

	AND	RESULT1	!F=C
	JFRF	L04130

	AND	RESULT1	!F=C
	FTCHD	DSP99_0	!display 99 eenheden
	FTCHD	DSP99_1	!display 99 tientallen
	FTCHD	DSP99_2	!display 99 honderdtallen
	FTCHD	DSP99_3	!display 99 duizendtallen
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.
L04130	NOP	1

L04131	AND	LAMPTEST	!lampentest "8"
	FTCHC	08
	FTCHC	08
	FTCHC	08
	FTCHC	08
	STRD	DISPL_0	!display aansturing eenh.
	STRD	DISPL_1	!display aansturing tiental.
	STRD	DISPL_2	!display aansturing honderdt.
	STRD	DISPL_3	!display aansturing duizendt.
	NOP	60
!                               DR_KRT1
!				*******
!
!
!	aanstuurcode storing 01 in lichtkrant laden
!
	AND	VERGR01
	AND	FASE01
	FTCHC	01
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 02 in lichtkrant laden
!
	AND	VERGR02	!stuurlucht gestoord
	AND	FASE02
	FTCHC	02
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 03 in lichtkrant laden
!
	AND	VERGR03	!stuurspanning gestoord
	AND	FASE03
	FTCHC	03
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 04 in lichtkrant laden
!
	AND	VERGR04
	AND	FASE04
	FTCHC	04
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 05 in lichtkrant laden
!
	AND	VERGR05	!vuilwater tank leeg
	AND	FASE05
	FTCHC	05
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 06 in lichtkrant laden
!
	AND	VERGR06
	AND	FASE06
	FTCHC	06
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 07 in lichtkrant laden
!
	AND	VERGR07
	AND	FASE07
	FTCHC	07
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 08 in lichtkrant laden
!
	AND	VERGR08
	AND	FASE08
	FTCHC	08
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 09 in lichtkrant laden
!
	AND	VERGR09
	AND	FASE09
	FTCHC	09
	FTCHC	05
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 10 in lichtkrant laden
!
	AND	VERGR10
	AND	FASE10
	FTCHC	00
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 11 in lichtkrant laden
!
	AND	VERGR11
	AND	FASE11
	FTCHC	01
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 12 in lichtkrant laden
!
	AND	VERGR12
	AND	FASE12
	FTCHC	02
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 13 in lichtkrant laden
!
	AND	VERGR13
	AND	FASE13
	FTCHC	03
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 14 in lichtkrant laden
!
	AND	VERGR14
	AND	FASE14
	FTCHC	04
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 15 in lichtkrant laden
!
	AND	VERGR15
	AND	FASE15
	FTCHC	05
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 16 in lichtkrant laden
!
	AND	VERGR16
	AND	FASE16
	FTCHC	06
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 17 in lichtkrant laden
!
	AND	VERGR17
	AND	FASE17
	FTCHC	07
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 18 in lichtkrant laden
!
	AND	VERGR18
	AND	FASE18
	FTCHC	08
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 19 in lichtkrant laden
!
	AND	VERGR19
	AND	FASE19
	FTCHC	09
	FTCHC	06
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 20 in lichtkrant laden
!
	AND	VERGR20
	AND	FASE20
	FTCHC	00
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 21 in lichtkrant laden
!
	AND	VERGR21
	AND	FASE21
	FTCHC	01
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 22 in lichtkrant laden
!
	AND	VERGR22
	AND	FASE22
	FTCHC	02
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 23 in lichtkrant laden
!
	AND	VERGR23
	AND	FASE23
	FTCHC	03
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 24 in lichtkrant laden
!
	AND	VERGR24
	AND	FASE24
	FTCHC	04
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 25 in lichtkrant laden
!
	AND	VERGR25
	AND	FASE25
	FTCHC	05
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 26 in lichtkrant laden
!
	AND	VERGR26
	AND	FASE26
	FTCHC	06
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 27 in lichtkrant laden
!
	AND	VERGR27
	AND	FASE27
	FTCHC	07
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 28 in lichtkrant laden
!
	AND	VERGR28
	AND	FASE28
	FTCHC	08
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 29 in lichtkrant laden
!
	AND	VERGR29
	AND	FASE29
	FTCHC	09
	FTCHC	07
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 30 in lichtkrant laden
!
	AND	VERGR30
	AND	FASE30
	FTCHC	00
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 31 in lichtkrant laden
!
	AND	VERGR31
	AND	FASE31
	FTCHC	01
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 32 in lichtkrant laden
!
	AND	VERGR32
	AND	FASE32
	FTCHC	02
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 33 in lichtkrant laden
!
	AND	VERGR33
	AND	FASE33
	FTCHC	03
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 34 in lichtkrant laden
!
	AND	VERGR34
	AND	FASE34
	FTCHC	04
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 35 in lichtkrant laden
!
	AND	VERGR35
	AND	FASE35
	FTCHC	05
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 36 in lichtkrant laden
!
	AND	VERGR36
	AND	FASE36
	FTCHC	06
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 37 in lichtkrant laden
!
	AND	VERGR37	!hoge druk alarm P10
	AND	FASE37
	FTCHC	07
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 38 in lichtkrant laden
!
	AND	VERGR38
	AND	FASE38
	FTCHC	08
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 39 in lichtkrant laden
!
	AND	VERGR39
	AND	FASE39
	FTCHC	09
	FTCHC	08
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 40 in lichtkrant laden
!
	AND	VERGR40
	AND	FASE40
	FTCHC	00
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 41 in lichtkrant laden
!
	AND	VERGR41
	AND	FASE41
	FTCHC	01
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 42 in lichtkrant laden
!
	AND	VERGR42
	AND	FASE42
	FTCHC	02
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 43 in lichtkrant laden
!
	AND	VERGR43	!druk vuilproceswater
	AND	FASE43
	FTCHC	03
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 44 in lichtkrant laden
!
	AND	VERGR44	!rho proceswater
	AND	FASE44
	FTCHC	04
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 45 in lichtkrant laden
!
	AND	VERGR45	!lage flow alarm vuilproceswater
	AND	FASE45
	FTCHC	05
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 46 in lichtkrant laden
!
	AND	VERGR46	!regeneratie cmf niet op tijd gevuld
	AND	FASE46
	FTCHC	06
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 47 in lichtkrant laden
!
	AND	VERGR47	!regeneratie cmf niet op tijd geledigd
	AND	FASE47
	FTCHC	07
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 48 in lichtkrant laden
!
	AND	VERGR48
	AND	FASE48
	FTCHC	08
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 49 in lichtkrant laden
!
	AND	VERGR49
	AND	FASE49
	FTCHC	09
	FTCHC	09
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 50 in lichtkrant laden
!
	AND	VERGR50
	AND	FASE50
	FTCHC	00
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 51 in lichtkrant laden
!
	AND	VERGR51
	AND	FASE51
	FTCHC	01
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 52 in lichtkrant laden
!
	AND	VERGR52
	AND	FASE52
	FTCHC	02
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 53 in lichtkrant laden
!
	AND	VERGR53
	AND	FASE53
	FTCHC	03
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 54 in lichtkrant laden
!
	AND	VERGR54
	AND	FASE54
	FTCHC	04
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 55 in lichtkrant laden
!
	AND	VERGR55
	AND	FASE55
	FTCHC	05
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 56 in lichtkrant laden
!
	AND	VERGR56
	AND	FASE56
	FTCHC	06
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 57 in lichtkrant laden
!
	AND	VERGR57
	AND	FASE57
	FTCHC	07
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 58 in lichtkrant laden
!
	AND	VERGR58
	AND	FASE58
	FTCHC	08
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 59 in lichtkrant laden
!
	AND	VERGR59
	AND	FASE59
	FTCHC	09
	FTCHC	00
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 60 in lichtkrant laden
!
	AND	VERGR60
	AND	FASE60
	FTCHC	00
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 61 in lichtkrant laden
!
	AND	VERGR61
	AND	FASE61
	FTCHC	01
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 62 in lichtkrant laden
!
	AND	VERGR62
	AND	FASE62
	FTCHC	02
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 63 in lichtkrant laden
!
	AND	VERGR63
	AND	FASE63
	FTCHC	03
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 64 in lichtkrant laden
!
	AND	VERGR64
	AND	FASE64
	FTCHC	04
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 65 in lichtkrant laden
!
	AND	VERGR65
	AND	FASE65
	FTCHC	05
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 66 in lichtkrant laden
!
	AND	VERGR66
	AND	FASE66
	FTCHC	06
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 67 in lichtkrant laden
!
	AND	VERGR67
	AND	FASE67
	FTCHC	07
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 68 in lichtkrant laden
!
	AND	VERGR68
	AND	FASE68
	FTCHC	08
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 69 in lichtkrant laden
!
	AND	VERGR69
	AND	FASE69
	FTCHC	09
	FTCHC	01
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 70 in lichtkrant laden
!
	AND	VERGR70
	AND	FASE70
	FTCHC	00
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 71 in lichtkrant laden
!
	AND	VERGR71
	AND	FASE71
	FTCHC	01
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 72 in lichtkrant laden
!
	AND	VERGR72
	AND	FASE72
	FTCHC	02
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 73 in lichtkrant laden
!
	AND	VERGR73
	AND	FASE73
	FTCHC	03
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 74 in lichtkrant laden
!
	AND	VERGR74
	AND	FASE74
	FTCHC	04
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 75 in lichtkrant laden
!
	AND	VERGR75
	AND	FASE75
	FTCHC	05
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 76 in lichtkrant laden
!
	AND	VERGR76
	AND	FASE76
	FTCHC	06
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 77 in lichtkrant laden
!
	AND	VERGR77
	AND	FASE77
	FTCHC	07
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	aanstuurcode storing 78 in lichtkrant laden
!
	AND	VERGR78
	AND	FASE78
	FTCHC	08
	FTCHC	02
	FTCHC	01
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
!
!	kijken of er nog een alarm aanwezig is
!
	OR	VERGR01
	OR	VERGR02	!stuurlucht gestoord
	OR	VERGR03	!stuurspanning gestoord
	OR	VERGR04
	OR	VERGR05	!vuilwater tank leeg
	OR	VERGR06
	OR	VERGR07
	OR	VERGR08
	OR	VERGR09
	OR	VERGR10
	OR	VERGR11
	OR	VERGR12
	OR	VERGR13
	OR	VERGR14
	OR	VERGR15
	OR	VERGR16
	OR	VERGR17
	OR	VERGR18
	OR	VERGR19
	OR	VERGR20
	OR	VERGR21
	OR	VERGR22
	OR	VERGR23
	OR	VERGR24
	OR	VERGR25
	OR	VERGR26
	OR	VERGR27
	OR	VERGR28
	OR	VERGR29
	OR	VERGR30
	OR	VERGR31
	OR	VERGR32
	OR	VERGR33
	OR	VERGR34
	OR	VERGR35
	OR	VERGR36
	OR	VERGR37	!hoge druk alarm P10
	OR	VERGR38
	OR	VERGR39
	OR	VERGR40
	OR	VERGR41
	OR	VERGR42
	OR	VERGR43	!druk vuilproceswater
	OR	VERGR44	!rho proceswater
	OR	VERGR45	!lage flow alarm vuilproceswater
	OR	VERGR46	!regeneratie cmf niet op tijd gevuld
	OR	VERGR47	!regeneratie cmf niet op tijd geledigd
	OR	VERGR48
	OR	VERGR49
	OR	VERGR50
	OR	VERGR51
	OR	VERGR52
	OR	VERGR53
	OR	VERGR54
	OR	VERGR55
	OR	VERGR56
	OR	VERGR57
	OR	VERGR58
	OR	VERGR59
	OR	VERGR60
	OR	VERGR61
	OR	VERGR62
	OR	VERGR63
	OR	VERGR64
	OR	VERGR65
	OR	VERGR66
	OR	VERGR67
	OR	VERGR68
	OR	VERGR69
	OR	VERGR70
	OR	VERGR71
	OR	VERGR72
	OR	VERGR73
	OR	VERGR74
	OR	VERGR75
	OR	VERGR76
	OR	VERGR77
	OR	VERGR78
  EQL ST_AANW !storing aanwezig ?
!
!	indien geen storing, clear storingsbuffer
!
  ANDNT ST_AANW !storing aanwezig ?
	FTCHC	00
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+

  ANDNT ST_AANW !storing aanwezig ?
	AND	BDR0B00	!start bedrijf fasen 1 t/m 6
	FTCHC	01
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+

  ANDNT ST_AANW !storing aanwezig ?
  AND BDR0I01 !bedrijfskeuze schak. "STAND_BY"
  ORNT  ST_AANW !storing aanwezig ?
  AND WZC0B13 !wizconcommando STAND_BY + KEUZESCHAK.=SU
	FTCHC	02
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+

  ANDNT ST_AANW !storing aanwezig ?
	AND	REG0B00	!start regen. fasen 8 t/m 33.1
	FTCHC	03
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+

  ANDNT ST_AANW !storing aanwezig ?
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	AND	REG0B42	!regeneratieaanvraag
	FTCHC	04
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+

  ANDNT ST_AANW !storing aanwezig ?
	ANDNT	REG0B00	!start regen. fasen 8 t/m 33.1
	AND	REG0B42	!regeneratieaanvraag
	ANDNT	ALM0B25	!regeneratieaanvraag (claxon)
	ANDNT	CA07
	AND	REG0B46	!openen commando V10.4
  ORNT  ST_AANW !storing aanwezig ?
	AND	WZC0B15	!wizconcommando SPUIEN + KEUZESCHAK.=SUPE
	FTCHC	05
	FTCHC	00
	FTCHC	00
	STRD	ST1BUF1	!+
	STRD	ST2BUF1	!storingscode lichtkrant
	STRD	ST3BUF1	!+
	NOP	41
!                               DR_KRT2
!				*******
!
  AND ST_AANW !storing aanwezig ?
	AND	STAPDRKN	!doorstappen lichtkrant
	TRIG	STAP	!triggerpuls
	EQL	DOORSTAP	!fasedoorstappuls door drukknop

	OR	FASESPRG	!fase overspringen
	OR	TIMER01
	OR	DOORSTAP	!fasedoorstappuls door drukknop
  EQL STAP_1  !fasedoorstappuls

	AND	FASE78
  AND STAP_1  !fasedoorstappuls
	SET0	FASE78

	AND	FASE77
  AND STAP_1  !fasedoorstappuls
	SET1	FASE78
	SET0	FASE77

	AND	FASE76
  AND STAP_1  !fasedoorstappuls
	SET1	FASE77
	SET0	FASE76

	AND	FASE75
  AND STAP_1  !fasedoorstappuls
	SET1	FASE76
	SET0	FASE75

	AND	FASE74
  AND STAP_1  !fasedoorstappuls
	SET1	FASE75
	SET0	FASE74

	AND	FASE73
  AND STAP_1  !fasedoorstappuls
	SET1	FASE74
	SET0	FASE73

	AND	FASE72
  AND STAP_1  !fasedoorstappuls
	SET1	FASE73
	SET0	FASE72

	AND	FASE71
  AND STAP_1  !fasedoorstappuls
	SET1	FASE72
	SET0	FASE71

	AND	FASE70
  AND STAP_1  !fasedoorstappuls
	SET1	FASE71
	SET0	FASE70

	AND	FASE69
  AND STAP_1  !fasedoorstappuls
	SET1	FASE70
	SET0	FASE69

	AND	FASE68
  AND STAP_1  !fasedoorstappuls
	SET1	FASE69
	SET0	FASE68

	AND	FASE67
  AND STAP_1  !fasedoorstappuls
	SET1	FASE68
	SET0	FASE67

	AND	FASE66
  AND STAP_1  !fasedoorstappuls
	SET1	FASE67
	SET0	FASE66

	AND	FASE65
  AND STAP_1  !fasedoorstappuls
	SET1	FASE66
	SET0	FASE65

	AND	FASE64
  AND STAP_1  !fasedoorstappuls
	SET1	FASE65
	SET0	FASE64

	AND	FASE63
  AND STAP_1  !fasedoorstappuls
	SET1	FASE64
	SET0	FASE63

	AND	FASE62
  AND STAP_1  !fasedoorstappuls
	SET1	FASE63
	SET0	FASE62

	AND	FASE61
  AND STAP_1  !fasedoorstappuls
	SET1	FASE62
	SET0	FASE61

	AND	FASE60
  AND STAP_1  !fasedoorstappuls
	SET1	FASE61
	SET0	FASE60

	AND	FASE59
  AND STAP_1  !fasedoorstappuls
	SET1	FASE60
	SET0	FASE59

	AND	FASE58
  AND STAP_1  !fasedoorstappuls
	SET1	FASE59
	SET0	FASE58

	AND	FASE57
  AND STAP_1  !fasedoorstappuls
	SET1	FASE58
	SET0	FASE57

	AND	FASE56
  AND STAP_1  !fasedoorstappuls
	SET1	FASE57
	SET0	FASE56

	AND	FASE55
  AND STAP_1  !fasedoorstappuls
	SET1	FASE56
	SET0	FASE55

	AND	FASE54
  AND STAP_1  !fasedoorstappuls
	SET1	FASE55
	SET0	FASE54

	AND	FASE53
  AND STAP_1  !fasedoorstappuls
	SET1	FASE54
	SET0	FASE53

	AND	FASE52
  AND STAP_1  !fasedoorstappuls
	SET1	FASE53
	SET0	FASE52

	AND	FASE51
  AND STAP_1  !fasedoorstappuls
	SET1	FASE52
	SET0	FASE51

	AND	FASE50
  AND STAP_1  !fasedoorstappuls
	SET1	FASE51
	SET0	FASE50

	AND	FASE49
  AND STAP_1  !fasedoorstappuls
	SET1	FASE50
	SET0	FASE49

	AND	FASE48
  AND STAP_1  !fasedoorstappuls
	SET1	FASE49
	SET0	FASE48

	AND	FASE47
  AND STAP_1  !fasedoorstappuls
	SET1	FASE48
	SET0	FASE47

	AND	FASE46
  AND STAP_1  !fasedoorstappuls
	SET1	FASE47
	SET0	FASE46

	AND	FASE45
  AND STAP_1  !fasedoorstappuls
	SET1	FASE46
	SET0	FASE45

	AND	FASE44
  AND STAP_1  !fasedoorstappuls
	SET1	FASE45
	SET0	FASE44

	AND	FASE43
  AND STAP_1  !fasedoorstappuls
	SET1	FASE44
	SET0	FASE43

	AND	FASE42
  AND STAP_1  !fasedoorstappuls
	SET1	FASE43
	SET0	FASE42

	AND	FASE41
  AND STAP_1  !fasedoorstappuls
	SET1	FASE42
	SET0	FASE41

	AND	FASE40
  AND STAP_1  !fasedoorstappuls
	SET1	FASE41
	SET0	FASE40

	AND	FASE39
  AND STAP_1  !fasedoorstappuls
	SET1	FASE40
	SET0	FASE39

	AND	FASE38
  AND STAP_1  !fasedoorstappuls
	SET1	FASE39
	SET0	FASE38

	AND	FASE37
  AND STAP_1  !fasedoorstappuls
	SET1	FASE38
	SET0	FASE37

	AND	FASE36
  AND STAP_1  !fasedoorstappuls
	SET1	FASE37
	SET0	FASE36

	AND	FASE35
  AND STAP_1  !fasedoorstappuls
	SET1	FASE36
	SET0	FASE35

	AND	FASE34
  AND STAP_1  !fasedoorstappuls
	SET1	FASE35
	SET0	FASE34

	AND	FASE33
  AND STAP_1  !fasedoorstappuls
	SET1	FASE34
	SET0	FASE33

	AND	FASE32
  AND STAP_1  !fasedoorstappuls
	SET1	FASE33
	SET0	FASE32

	AND	FASE31
  AND STAP_1  !fasedoorstappuls
	SET1	FASE32
	SET0	FASE31

	AND	FASE30
  AND STAP_1  !fasedoorstappuls
	SET1	FASE31
	SET0	FASE30

	AND	FASE29
  AND STAP_1  !fasedoorstappuls
	SET1	FASE30
	SET0	FASE29

	AND	FASE28
  AND STAP_1  !fasedoorstappuls
	SET1	FASE29
	SET0	FASE28

	AND	FASE27
  AND STAP_1  !fasedoorstappuls
	SET1	FASE28
	SET0	FASE27

	AND	FASE26
  AND STAP_1  !fasedoorstappuls
	SET1	FASE27
	SET0	FASE26

	AND	FASE25
  AND STAP_1  !fasedoorstappuls
	SET1	FASE26
	SET0	FASE25

	AND	FASE24
  AND STAP_1  !fasedoorstappuls
	SET1	FASE25
	SET0	FASE24

	AND	FASE23
  AND STAP_1  !fasedoorstappuls
	SET1	FASE24
	SET0	FASE23

	AND	FASE22
  AND STAP_1  !fasedoorstappuls
	SET1	FASE23
	SET0	FASE22

	AND	FASE21
  AND STAP_1  !fasedoorstappuls
	SET1	FASE22
	SET0	FASE21

	AND	FASE20
  AND STAP_1  !fasedoorstappuls
	SET1	FASE21
	SET0	FASE20

	AND	FASE19
  AND STAP_1  !fasedoorstappuls
	SET1	FASE20
	SET0	FASE19

	AND	FASE18
  AND STAP_1  !fasedoorstappuls
	SET1	FASE19
	SET0	FASE18

	AND	FASE17
  AND STAP_1  !fasedoorstappuls
	SET1	FASE18
	SET0	FASE17

	AND	FASE16
  AND STAP_1  !fasedoorstappuls
	SET1	FASE17
	SET0	FASE16

	AND	FASE15
  AND STAP_1  !fasedoorstappuls
	SET1	FASE16
	SET0	FASE15

	AND	FASE14
  AND STAP_1  !fasedoorstappuls
	SET1	FASE15
	SET0	FASE14

	AND	FASE13
  AND STAP_1  !fasedoorstappuls
	SET1	FASE14
	SET0	FASE13

	AND	FASE12
  AND STAP_1  !fasedoorstappuls
	SET1	FASE13
	SET0	FASE12

	AND	FASE11
  AND STAP_1  !fasedoorstappuls
	SET1	FASE12
	SET0	FASE11

	AND	FASE10
  AND STAP_1  !fasedoorstappuls
	SET1	FASE11
	SET0	FASE10

	AND	FASE09
  AND STAP_1  !fasedoorstappuls
	SET1	FASE10
	SET0	FASE09

	AND	FASE08
  AND STAP_1  !fasedoorstappuls
	SET1	FASE09
	SET0	FASE08

	AND	FASE07
  AND STAP_1  !fasedoorstappuls
	SET1	FASE08
	SET0	FASE07

	AND	FASE06
  AND STAP_1  !fasedoorstappuls
	SET1	FASE07
	SET0	FASE06

	AND	FASE05
  AND STAP_1  !fasedoorstappuls
	SET1	FASE06
	SET0	FASE05

	AND	FASE04
  AND STAP_1  !fasedoorstappuls
	SET1	FASE05
	SET0	FASE04

	AND	FASE03
  AND STAP_1  !fasedoorstappuls
	SET1	FASE04
	SET0	FASE03

	AND	FASE02
  AND STAP_1  !fasedoorstappuls
	SET1	FASE03
	SET0	FASE02

	AND	FASE01
  AND STAP_1  !fasedoorstappuls
	SET1	FASE02
	SET0	FASE01

	ANDNT	FASE78
	TRIG	PULS78	!triggerpuls einde fase 78
	EQL	STAP01	!doorstappuls fase 78 naar fase 01

  AND ST_AANW !storing aanwezig ?
  AND STAP_1  !fasedoorstappuls
	AND	STAP01	!doorstappuls fase 78 naar fase 01
	TRIG	STAPPULS	!triggerpuls rondstap
	EQL	RONDSTAP	!stap van fase 78 naar fase 01

  AND ST_AANW !storing aanwezig ?
	TRIG	STARTP	!triggerpuls start
	EQL	START	!start storingcode's naar lichtkrant

	AND	RONDSTAP	!stap van fase 78 naar fase 01
	OR	START	!start storingcode's naar lichtkrant
	SET1	FASE01

  AND STAP_1  !fasedoorstappuls
	AND	TIMER01
	OR	START	!start storingcode's naar lichtkrant
	FTCHC	02
	FTCHC	00
	FTCHC	00
	FTCHC	00
	STRD	DSP99_0	!display 99 eenheden
	STRD	DSP99_1	!display 99 tientallen
	STRD	DSP99_2	!display 99 honderdtallen
	STRD	DSP99_3	!display 99 duizendtallen
	SET0	TIMER01
  EQLNT STAP_1  !fasedoorstappuls

	AND	KNIPPER
	ANDNT	TIMER01
  AND ST_AANW !storing aanwezig ?
	TRIG	TRIGTIM	!triggerpuls timer01
	CNTD	DSP99_0	!display 99 eenheden
	CNTD	DSP99_1	!display 99 tientallen
	CNTD	DSP99_2	!display 99 honderdtallen
	CNTD	DSP99_3	!display 99 duizendtallen
	STRB	TIMER01

	AND	FASE01
	ANDNT	VERGR01
	EQL	VRIJG01	!vrijgave fase

	AND	FASE02
	ANDNT	VERGR02	!stuurlucht gestoord
	EQL	VRIJG02	!vrijgave fase

	AND	FASE03
	ANDNT	VERGR03	!stuurspanning gestoord
	EQL	VRIJG03	!vrijgave fase

	AND	FASE04
	ANDNT	VERGR04
	EQL	VRIJG04	!vrijgave fase

	AND	FASE05
	ANDNT	VERGR05	!vuilwater tank leeg
	EQL	VRIJG05	!vrijgave fase

	AND	FASE06
	ANDNT	VERGR06
	EQL	VRIJG06	!vrijgave fase

	AND	FASE07
	ANDNT	VERGR07
	EQL	VRIJG07	!vrijgave fase

	AND	FASE08
	ANDNT	VERGR08
	EQL	VRIJG08	!vrijgave fase

	AND	FASE09
	ANDNT	VERGR09
	EQL	VRIJG09	!vrijgave fase

	AND	FASE10
	ANDNT	VERGR10
	EQL	VRIJG10	!vrijgave fase

	AND	FASE11
	ANDNT	VERGR11
	EQL	VRIJG11	!vrijgave fase

	AND	FASE12
	ANDNT	VERGR12
	EQL	VRIJG12	!vrijgave fase

	AND	FASE13
	ANDNT	VERGR13
	EQL	VRIJG13	!vrijgave fase

	AND	FASE14
	ANDNT	VERGR14
	EQL	VRIJG14	!vrijgave fase

	AND	FASE15
	ANDNT	VERGR15
	EQL	VRIJG15	!vrijgave fase

	AND	FASE16
	ANDNT	VERGR16
	EQL	VRIJG16	!vrijgave fase

	AND	FASE17
	ANDNT	VERGR17
	EQL	VRIJG17	!vrijgave fase

	AND	FASE18
	ANDNT	VERGR18
	EQL	VRIJG18	!vrijgave fase

	AND	FASE19
	ANDNT	VERGR19
	EQL	VRIJG19	!vrijgave fase

	AND	FASE20
	ANDNT	VERGR20
	EQL	VRIJG20	!vrijgave fase

	AND	FASE21
	ANDNT	VERGR21
	EQL	VRIJG21	!vrijgave fase

	AND	FASE22
	ANDNT	VERGR22
	EQL	VRIJG22	!vrijgave fase

	AND	FASE23
	ANDNT	VERGR23
	EQL	VRIJG23	!vrijgave fase

	AND	FASE24
	ANDNT	VERGR24
	EQL	VRIJG24	!vrijgave fase

	AND	FASE25
	ANDNT	VERGR25
	EQL	VRIJG25	!vrijgave fase

	AND	FASE26
	ANDNT	VERGR26
	EQL	VRIJG26	!vrijgave fase

	AND	FASE27
	ANDNT	VERGR27
	EQL	VRIJG27	!vrijgave fase

	AND	FASE28
	ANDNT	VERGR28
	EQL	VRIJG28	!vrijgave fase

	AND	FASE29
	ANDNT	VERGR29
	EQL	VRIJG29	!vrijgave fase

	AND	FASE30
	ANDNT	VERGR30
	EQL	VRIJG30	!vrijgave fase

	AND	FASE31
	ANDNT	VERGR31
	EQL	VRIJG31	!vrijgave fase

	AND	FASE32
	ANDNT	VERGR32
	EQL	VRIJG32	!vrijgave fase

	AND	FASE33
	ANDNT	VERGR33
	EQL	VRIJG33	!vrijgave fase

	AND	FASE34
	ANDNT	VERGR34
	EQL	VRIJG34	!vrijgave fase

	AND	FASE35
	ANDNT	VERGR35
	EQL	VRIJG35	!vrijgave fase

	AND	FASE36
	ANDNT	VERGR36
	EQL	VRIJG36	!vrijgave fase

	AND	FASE37
	ANDNT	VERGR37	!hoge druk alarm P10
	EQL	VRIJG37	!vrijgave fase

	AND	FASE38
	ANDNT	VERGR38
	EQL	VRIJG38	!vrijgave fase

	AND	FASE39
	ANDNT	VERGR39
	EQL	VRIJG39	!vrijgave fase

	AND	FASE40
	ANDNT	VERGR40
	EQL	VRIJG40	!vrijgave fase

	AND	FASE41
	ANDNT	VERGR41
	EQL	VRIJG41	!vrijgave fase

	AND	FASE42
	ANDNT	VERGR42
	EQL	VRIJG42	!vrijgave fase

	AND	FASE43
	ANDNT	VERGR43	!druk vuilproceswater
	EQL	VRIJG43	!vrijgave fase

	AND	FASE44
	ANDNT	VERGR44	!rho proceswater
	EQL	VRIJG44	!vrijgave fase

	AND	FASE45
	ANDNT	VERGR45	!lage flow alarm vuilproceswater
	EQL	VRIJG45	!vrijgave fase

	AND	FASE46
	ANDNT	VERGR46	!regeneratie cmf niet op tijd gevuld
	EQL	VRIJG46	!vrijgave fase

	AND	FASE47
	ANDNT	VERGR47	!regeneratie cmf niet op tijd geledigd
	EQL	VRIJG47	!vrijgave fase

	AND	FASE48
	ANDNT	VERGR48
	EQL	VRIJG48	!vrijgave fase

	AND	FASE49
	ANDNT	VERGR49
	EQL	VRIJG49	!vrijgave fase

	AND	FASE50
	ANDNT	VERGR50
	EQL	VRIJG50	!vrijgave fase

	AND	FASE51
	ANDNT	VERGR51
	EQL	VRIJG51	!vrijgave fase

	AND	FASE52
	ANDNT	VERGR52
	EQL	VRIJG52	!vrijgave fase

	AND	FASE53
	ANDNT	VERGR53
	EQL	VRIJG53	!vrijgave fase

	AND	FASE54
	ANDNT	VERGR54
	EQL	VRIJG54	!vrijgave fase

	AND	FASE55
	ANDNT	VERGR55
	EQL	VRIJG55	!vrijgave fase

	AND	FASE56
	ANDNT	VERGR56
	EQL	VRIJG56	!vrijgave fase

	AND	FASE57
	ANDNT	VERGR57
	EQL	VRIJG57	!vrijgave fase

	AND	FASE58
	ANDNT	VERGR58
	EQL	VRIJG58	!vrijgave fase

	AND	FASE59
	ANDNT	VERGR59
	EQL	VRIJG59	!vrijgave fase

	AND	FASE60
	ANDNT	VERGR60
	EQL	VRIJG60	!vrijgave fase

	AND	FASE61
	ANDNT	VERGR61
	EQL	VRIJG61	!vrijgave fase

	AND	FASE62
	ANDNT	VERGR62
	EQL	VRIJG62	!vrijgave fase

	AND	FASE63
	ANDNT	VERGR63
	EQL	VRIJG63	!vrijgave fase

	AND	FASE64
	ANDNT	VERGR64
	EQL	VRIJG64	!vrijgave fase

	AND	FASE65
	ANDNT	VERGR65
	EQL	VRIJG65	!vrijgave fase

	AND	FASE66
	ANDNT	VERGR66
	EQL	VRIJG66	!vrijgave fase

	AND	FASE67
	ANDNT	VERGR67
	EQL	VRIJG67	!vrijgave fase

	AND	FASE68
	ANDNT	VERGR68
	EQL	VRIJG68	!vrijgave fase

	AND	FASE69
	ANDNT	VERGR69
	EQL	VRIJG69	!vrijgave fase

	AND	FASE70
	ANDNT	VERGR70
	EQL	VRIJG70	!vrijgave fase

	AND	FASE71
	ANDNT	VERGR71
	EQL	VRIJG71	!vrijgave fase

	AND	FASE72
	ANDNT	VERGR72
	EQL	VRIJG72	!vrijgave fase

	AND	FASE73
	ANDNT	VERGR73
	EQL	VRIJG73	!vrijgave fase

	AND	FASE74
	ANDNT	VERGR74
	EQL	VRIJG74	!vrijgave fase

	AND	FASE75
	ANDNT	VERGR75
	EQL	VRIJG75	!vrijgave fase

	AND	FASE76
	ANDNT	VERGR76
	EQL	VRIJG76	!vrijgave fase

	AND	FASE77
	ANDNT	VERGR77
	EQL	VRIJG77	!vrijgave fase

	AND	FASE78
	ANDNT	VERGR78
	EQL	VRIJG78	!vrijgave fase

	OR	VRIJG01	!vrijgave fase
	OR	VRIJG02	!vrijgave fase
	OR	VRIJG03	!vrijgave fase
	OR	VRIJG04	!vrijgave fase
	OR	VRIJG05	!vrijgave fase
	OR	VRIJG06	!vrijgave fase
	OR	VRIJG07	!vrijgave fase
	OR	VRIJG08	!vrijgave fase
	OR	VRIJG09	!vrijgave fase
	OR	VRIJG10	!vrijgave fase
	OR	VRIJG11	!vrijgave fase
	OR	VRIJG12	!vrijgave fase
	OR	VRIJG13	!vrijgave fase
	OR	VRIJG14	!vrijgave fase
	OR	VRIJG15	!vrijgave fase
	OR	VRIJG16	!vrijgave fase
	OR	VRIJG17	!vrijgave fase
	OR	VRIJG18	!vrijgave fase
	OR	VRIJG19	!vrijgave fase
	OR	VRIJG20	!vrijgave fase
	OR	VRIJG21	!vrijgave fase
	OR	VRIJG22	!vrijgave fase
	OR	VRIJG23	!vrijgave fase
	OR	VRIJG24	!vrijgave fase
	OR	VRIJG25	!vrijgave fase
	OR	VRIJG26	!vrijgave fase
	OR	VRIJG27	!vrijgave fase
	OR	VRIJG28	!vrijgave fase
	OR	VRIJG29	!vrijgave fase
	OR	VRIJG30	!vrijgave fase
	OR	VRIJG31	!vrijgave fase
	OR	VRIJG32	!vrijgave fase
	OR	VRIJG33	!vrijgave fase
	OR	VRIJG34	!vrijgave fase
	OR	VRIJG35	!vrijgave fase
	OR	VRIJG36	!vrijgave fase
	OR	VRIJG37	!vrijgave fase
	OR	VRIJG38	!vrijgave fase
	OR	VRIJG39	!vrijgave fase
	OR	VRIJG40	!vrijgave fase
	OR	VRIJG41	!vrijgave fase
	OR	VRIJG42	!vrijgave fase
	OR	VRIJG43	!vrijgave fase
	OR	VRIJG44	!vrijgave fase
	OR	VRIJG45	!vrijgave fase
	OR	VRIJG46	!vrijgave fase
	OR	VRIJG47	!vrijgave fase
	OR	VRIJG48	!vrijgave fase
	OR	VRIJG49	!vrijgave fase
	OR	VRIJG50	!vrijgave fase
	OR	VRIJG51	!vrijgave fase
	OR	VRIJG52	!vrijgave fase
	OR	VRIJG53	!vrijgave fase
	OR	VRIJG54	!vrijgave fase
	OR	VRIJG55	!vrijgave fase
	OR	VRIJG56	!vrijgave fase
	OR	VRIJG57	!vrijgave fase
	OR	VRIJG58	!vrijgave fase
	OR	VRIJG59	!vrijgave fase
	OR	VRIJG60	!vrijgave fase
	OR	VRIJG61	!vrijgave fase
	OR	VRIJG62	!vrijgave fase
	OR	VRIJG63	!vrijgave fase
	OR	VRIJG64	!vrijgave fase
	OR	VRIJG65	!vrijgave fase
	OR	VRIJG66	!vrijgave fase
	OR	VRIJG67	!vrijgave fase
	OR	VRIJG68	!vrijgave fase
	OR	VRIJG69	!vrijgave fase
	OR	VRIJG70	!vrijgave fase
	OR	VRIJG71	!vrijgave fase
	OR	VRIJG72	!vrijgave fase
	OR	VRIJG73	!vrijgave fase
	OR	VRIJG74	!vrijgave fase
	OR	VRIJG75	!vrijgave fase
	OR	VRIJG76	!vrijgave fase
	OR	VRIJG77	!vrijgave fase
	OR	VRIJG78	!vrijgave fase
	EQL	FASESPRG	!fase overspringen

  ANDNT ST_AANW !storing aanwezig ?
	FTCHC	00
	STRD	0055
	STRD	0056
	STRD	0057
	STRD	0058
	STRD	0059
	STRD	0060
	STRD	0061
	STRD	0062
	STRD	0063
	STRD	0064
	STRD	0065
	STRD	0066
	STRD	0067
	STRD	0068
	STRD	0069
	STRD	0070
	STRD	0071
	STRD	0072
	STRD	0073
	STRD	0074
	NOP	110
!                               DR_DISPL
!				********
!
	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B05	!bedrijfsfase 5
  OR  FASE_7  !fase 7
	OR	REG0B09	!regeneratiefase 9
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B13	!regeneratiefase 13
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B17	!regeneratiefase 17
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B23	!regeneratiefase 23
	OR	REG0B25	!regeneratiefase 25
	OR	REG0B27	!regeneratiefase 27
	OR	REG0B29	!regeneratiefase 29
	OR	REG0B31	!regeneratiefase 31
	OR	REG0B33	!regeneratiefase 33
	OR	REG0B61
	OR	REG0B63
	OR	REG0B65
	EQL	DSP0L01

	OR	BDR0B02
	OR	BDR0B03
	OR	BDR0B06
  OR  FASE_7
	OR	REG0B12
	OR	REG0B13
	OR	REG0B16
	OR	REG0B17
	OR	REG0B22
	OR	REG0B23
	OR	REG0B26
	OR	REG0B27
	OR	REG0B32
	OR	REG0B33
	OR	REG0B62
	OR	REG0B63
	EQL	DSP0L02

	OR	BDR0B04
	OR	BDR0B05
	OR	BDR0B06
  OR  FASE_7
	OR	REG0B14
	OR	REG0B15
	OR	REG0B16
	OR	REG0B17
	OR	REG0B24
	OR	REG0B25
	OR	REG0B26
	OR	REG0B27
	OR	REG0B34
	OR	REG0B64
	OR	REG0B65
	EQL	DSP0L04

	OR	REG0B08
	OR	REG0B09
	OR	REG0B18
	OR	REG0B19
	OR	REG0B28
	OR	REG0B29
	OR	REG0B88
	EQL	DSP0L08

	OR	REG0B10
	OR	REG0B11
	OR	REG0B12
	OR	REG0B13
	OR	REG0B14
	OR	REG0B15
	OR	REG0B16
	OR	REG0B17
	OR	REG0B18
	OR	REG0B19
	OR	REG0B30
	OR	REG0B31
	OR	REG0B32
	OR	REG0B33
	OR	REG0B34
	EQL	DSP0L10

	OR	REG0B20
	OR	REG0B21
	OR	REG0B22
	OR	REG0B23
	OR	REG0B24
	OR	REG0B25
	OR	REG0B26
	OR	REG0B27
	OR	REG0B28
	OR	REG0B29
	OR	REG0B30
	OR	REG0B31
	OR	REG0B32
	OR	REG0B33
	OR	REG0B34
	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
	EQL	DSP0L20

	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
	EQL	DSP0L40

	OR	REG0B88
	EQL	DSP0L80

	AND	DSP0L01
  ANDNT FASE_7
  OR  FASE_7
	EQL	DISPL01

	AND	DSP0L02
  ANDNT FASE_7
  OR  FASE_7
	EQL	DISPL02

	AND	DSP0L04
  ANDNT FASE_7
  OR  FASE_7
	EQL	DISPL04

	AND	DSP0L08
  ANDNT FASE_7
	EQL	DISPL08

	AND	DSP0L10
  ANDNT FASE_7
	EQL	DISPL10

	AND	DSP0L20
  ANDNT FASE_7
	EQL	DISPL20

	AND	DSP0L40
  ANDNT FASE_7
	EQL	DISPL40

	AND	DSP0L80
  ANDNT FASE_7
	EQL	DISPL80

!
!	lampentest 2 decaden display
!
	AND	LAMPTEST
	FTCHC	08
	FTCHC	08
	STRD	DSP1
	STRD	DSP2
	NOP	59
!                               DR_VEN
!				******
!
	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B02	!bedrijfsfase 2
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B04	!bedrijfsfase 4
	OR	BDR0B05	!bedrijfsfase 5
	OR	BDR0B06	!bedrijfsfase 6
	OR	REG0B88	!aanloopfase 88
  EQL DUMP_1

	AND	REG0B33	!regeneratiefase 33
  AND R_VOORW !regeneratievoorw. OK
  EQL DUMP_2

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_1
  EQL DUMP_3

  OR  DUMP_2
  OR  DUMP_3
	EQL	V10_1
	EQL	V10_2
	EQL	V10_3

	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B05	!bedrijfsfase 5
  EQL DUMP_4

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_4
	EQL	V9_1

	OR	REG0B08	!regeneratiefase 8
	OR	REG0B09	!regeneratiefase 9
	OR	REG0B10	!regeneratiefase 10
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B12	!regeneratiefase 12
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B17	!regeneratiefase 17
	OR	REG0B18	!regeneratiefase 18
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B22	!regeneratiefase 22
	OR	REG0B25	!regeneratiefase 25
	OR	REG0B26	!regeneratiefase 26
	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
  EQL DUMP_5
!
! timer 40 t.b.v. afsluiters V1.3, V3.3, V5.3 tijdens fase 32
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	REG0B32	!regeneratiefase 32
  ANDNT TIMER_40
	CNTD	DSP40_0	!display 40 eenheden
	CNTD	DSP40_1	!display 40 tientallen
	CNTD	DSP40_2	!display 40 honderdtallen
	CNTD	DSP40_3	!display 40 duizendtallen
  STRB  TIMER_40

	ANDNT	REG0B32	!regeneratiefase 32
	FTCHD	STP40_0	!setpoint 40 eenheden
	FTCHD	STP40_1	!setpoint 40 tientallen
	FTCHD	STP40_2	!setpoint 40 honderdtallen
	FTCHD	STP40_3	!setpoint 40 duizendtallen
	STRD	DSP40_0	!display 40 eenheden
	STRD	DSP40_1	!display 40 tientallen
	STRD	DSP40_2	!display 40 honderdtallen
	STRD	DSP40_3	!display 40 duizendtallen
  SET0  TIMER_40

  ANDNT TIMER_40
	AND	REG0B32	!regeneratiefase 32
  EQL DUMP_6

  OR  DUMP_5
  OR  DUMP_6
  EQL DUMP_7

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_7
	OR	REG0B53	!handmatig vullen CMF
	OR	REG0B54	!handmatig ledigen CMF
	EQL	V1_3
	EQL	V3_3
	EQL	V5_3

	OR	REG0B08	!regeneratiefase 8
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B13	!regeneratiefase 13
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B18	!regeneratiefase 18
	OR	REG0B20	!regeneratiefase 20
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B24	!regeneratiefase 24
	OR	REG0B25	!regeneratiefase 25
	OR	REG0B27	!regeneratiefase 27
	OR	REG0B29	!regeneratiefase 29
	OR	REG0B31	!regeneratiefase 31
	OR	REG0B32	!regeneratiefase 32
	OR	REG0B60
	OR	REG0B63
  EQL DUMP_8
!
! timer 41 t.b.v. afsluiters V12.1, V12.2, V12.3 tijdens fase 7
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND FASE_7  !fase 7
  ANDNT TIMER_41
	CNTD	DSP41_0	!display 41 eenheden
	CNTD	DSP41_1	!display 41 tientallen
	CNTD	DSP41_2	!display 41 honderdtallen
	CNTD	DSP41_3	!display 41 duizendtallen
  STRB  TIMER_41

  ANDNT FASE_7  !fase 7
	FTCHD	STP41_0	!setpoint 41 eenheden
	FTCHD	STP41_1	!setpoint 41 tientallen
	FTCHD	STP41_2	!setpoint 41 honderdtallen
	FTCHD	STP41_3	!setpoint 41 duizendtallen
	STRD	DSP41_0	!display 41 eenheden
	STRD	DSP41_1	!display 41 tientallen
	STRD	DSP41_2	!display 41 honderdtallen
	STRD	DSP41_3	!display 41 duizendtallen
  SET0  TIMER_41

  ANDNT TIMER_41
  AND FASE_7  !fase 7
  EQL DUMP_9

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_8
  EQL DUMP_10

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_9
  EQL DUMP_11

  OR  DUMP_10
  OR  DUMP_11
	OR	REG0B54	!handmatig ledigen CMF
  OR  TIMER_61  !pauzetijd aansturing afsl. V12.1
	EQL	V12_1

  OR  DUMP_10
  OR  DUMP_11
	OR	REG0B54	!handmatig ledigen CMF
	EQL	V12_2
	EQL	V12_3

	OR	REG0B09	!regeneratiefase 9
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B61
	OR	REG0B64
  EQL DUMP_12

  AND DUMP_12
  AND R_VOORW !regeneratievoorw. OK
	EQL	V11_1
  EQL POMP_P11

	OR	REG0B13	!regeneratiefase 13
	OR	REG0B20	!regeneratiefase 20
	OR	REG0B24	!regeneratiefase 24
	OR	REG0B27	!regeneratiefase 27
	OR	REG0B29	!regeneratiefase 29
	OR	REG0B31	!regeneratiefase 31
	OR	REG0B32	!regeneratiefase 32
  EQL DUMP_13

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_13
	EQL	V9_2

	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B02	!bedrijfsfase 2
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B04	!bedrijfsfase 4
	OR	BDR0B05	!bedrijfsfase 5
	OR	BDR0B06	!bedrijfsfase 6
	OR	REG0B88	!aanloopfase 88
  EQL DUMP_14

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_14
  EQL DUMP_15

  AND R_VOORW !regeneratievoorw. OK
	AND	REG0B33	!regeneratiefase 33
  EQL DUMP_16

  AND DUMP_15
  OR  DUMP_16
  EQL POMP_P10
!
! timer 42 vertraging afsluiter V1.2 tijdens fase 1
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B01	!bedrijfsfase 1
  ANDNT TIMER_42
	CNTD	DSP42_0	!display 42 eenheden
	CNTD	DSP42_1	!display 42 tientallen
	CNTD	DSP42_2	!display 42 honderdtallen
	CNTD	DSP42_3	!display 42 duizendtallen
  STRB  TIMER_42

	ANDNT	BDR0B01	!bedrijfsfase 1
	FTCHD	STP42_0	!setpoint 42 eenheden
	FTCHD	STP42_1	!setpoint 42 tientallen
	FTCHD	STP42_2	!setpoint 42 honderdtallen
	FTCHD	STP42_3	!setpoint 42 duizendtallen
	STRD	DSP42_0	!display 42 eenheden
	STRD	DSP42_1	!display 42 tientallen
	STRD	DSP42_2	!display 42 honderdtallen
	STRD	DSP42_3	!display 42 duizendtallen
  SET0  TIMER_42
!
! timer 43 vertraging afsluiter V3.2 tijdens fase 3
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B03	!bedrijfsfase 3
  ANDNT TIMER_43
	CNTD	DSP43_0	!display 43 eenheden
	CNTD	DSP43_1	!display 43 tientallen
	CNTD	DSP43_2	!display 43 honderdtallen
	CNTD	DSP43_3	!display 43 duizendtallen
  STRB  TIMER_43

	ANDNT	BDR0B03	!bedrijfsfase 3
	FTCHD	STP43_0	!setpoint 43 eenheden
	FTCHD	STP43_1	!setpoint 43 tientallen
	FTCHD	STP43_2	!setpoint 43 honderdtallen
	FTCHD	STP43_3	!setpoint 43 duizendtallen
	STRD	DSP43_0	!display 43 eenheden
	STRD	DSP43_1	!display 43 tientallen
	STRD	DSP43_2	!display 43 honderdtallen
	STRD	DSP43_3	!display 43 duizendtallen
  SET0  TIMER_43
!
! timer 44 vertraging afsluiter V5.3 tijdens fase 5
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B05	!bedrijfsfase 5
  ANDNT TIMER_44
	CNTD	DSP44_0	!display 44 eenheden
	CNTD	DSP44_1	!display 44 tientallen
	CNTD	DSP44_2	!display 44 honderdtallen
	CNTD	DSP44_3	!display 44 duizendtallen
  STRB  TIMER_44

	ANDNT	BDR0B05	!bedrijfsfase 5
	FTCHD	STP44_0	!setpoint 44 eenheden
	FTCHD	STP44_1	!setpoint 44 tientallen
	FTCHD	STP44_2	!setpoint 44 honderdtallen
	FTCHD	STP44_3	!setpoint 44 duizendtallen
	STRD	DSP44_0	!display 44 eenheden
	STRD	DSP44_1	!display 44 tientallen
	STRD	DSP44_2	!display 44 honderdtallen
	STRD	DSP44_3	!display 44 duizendtallen
  SET0  TIMER_44

  AND TIMER_42
	AND	BDR0B10	!bedrijfsmelding
  EQL DUMP_17

  AND TIMER_43
	AND	BDR0B10	!bedrijfsmelding
  EQL DUMP_18

  AND TIMER_44
	AND	BDR0B10	!bedrijfsmelding
  EQL DUMP_19

	OR	REG0B08	!regeneratiefase 8
	OR	REG0B09	!regeneratiefase 9
	OR	REG0B10	!regeneratiefase 10
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B12	!regeneratiefase 12
	OR	REG0B13	!regeneratiefase 13
	OR	REG0B14	!regeneratiefase 14
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B17	!regeneratiefase 17
	OR	REG0B18	!regeneratiefase 18
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B20	!regeneratiefase 20
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B22	!regeneratiefase 22
	OR	REG0B23	!regeneratiefase 23
	OR	REG0B24	!regeneratiefase 24
	OR	REG0B25	!regeneratiefase 25
	OR	REG0B26	!regeneratiefase 26
	OR	REG0B27	!regeneratiefase 27
	OR	REG0B28	!regeneratiefase 28
	OR	REG0B29	!regeneratiefase 29
	OR	REG0B30	!regeneratiefase 30
	OR	REG0B31	!regeneratiefase 31
	OR	REG0B32	!regeneratiefase 32
	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
  EQL DUMP_20

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_20
  EQL DUMP_21

  OR  DUMP_17
  OR  DUMP_21
	OR	REG0B53	!handmatig vullen CMF
	OR	REG0B54	!handmatig ledigen CMF
	EQL	V1_2

  OR  DUMP_18
  OR  DUMP_21
	OR	REG0B53	!handmatig vullen CMF
	OR	REG0B54	!handmatig ledigen CMF
	EQL	V3_2

  OR  DUMP_19
  OR  DUMP_21
	OR	REG0B53	!handmatig vullen CMF
	OR	REG0B54	!handmatig ledigen CMF
	EQL	V5_2

	AND	BDR0B01	!bedrijfsfase 1
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B05	!bedrijfsfase 5
  EQL DUMP_22

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_22
	OR	BDR0B10	!bedrijfsmelding
	AND	REG0B46	!openen commando V10.4
	OR	REG0B34	!regeneratiefase 33.1
	ANDNT	ALM0I37	!rondpompdruk correct
	EQL	V10_4
!
! timer 45 vertraging afsluiter V1.1 tijdens fase 2
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B02	!bedrijfsfase 2
  ANDNT TIMER_45
	CNTD	DSP45_0	!display 45 eenheden
	CNTD	DSP45_1	!display 45 tientallen
	CNTD	DSP45_2	!display 45 honderdtallen
	CNTD	DSP45_3	!display 45 duizendtallen
  STRB  TIMER_45

	ANDNT	BDR0B02	!bedrijfsfase 2
	FTCHD	STP45_0	!setpoint 45 eenheden
	FTCHD	STP45_1	!setpoint 45 tientallen
	FTCHD	STP45_2	!setpoint 45 honderdtallen
	FTCHD	STP45_3	!setpoint 45 duizendtallen
	STRD	DSP45_0	!display 45 eenheden
	STRD	DSP45_1	!display 45 tientallen
	STRD	DSP45_2	!display 45 honderdtallen
	STRD	DSP45_3	!display 45 duizendtallen
  SET0  TIMER_45
!
! timer 46 vertraging afsluiter V3.1 tijdens fase 4
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B04	!bedrijfsfase 4
  ANDNT TIMER_46
	CNTD	DSP46_0	!display 46 eenheden
	CNTD	DSP46_1	!display 46 tientallen
	CNTD	DSP46_2	!display 46 honderdtallen
	CNTD	DSP46_3	!display 46 duizendtallen
  STRB  TIMER_46

	ANDNT	BDR0B04	!bedrijfsfase 4
	FTCHD	STP46_0	!setpoint 46 eenheden
	FTCHD	STP46_1	!setpoint 46 tientallen
	FTCHD	STP46_2	!setpoint 46 honderdtallen
	FTCHD	STP46_3	!setpoint 46 duizendtallen
	STRD	DSP46_0	!display 46 eenheden
	STRD	DSP46_1	!display 46 tientallen
	STRD	DSP46_2	!display 46 honderdtallen
	STRD	DSP46_3	!display 46 duizendtallen
  SET0  TIMER_46
!
! timer 47 vertraging afsluiter V5.1 tijdens fase 6
!
	AND	S_1SEC	!triggerpuls 1,0 sec.
	AND	BDR0B06	!bedrijfsfase 6
  ANDNT TIMER_47
	CNTD	DSP47_0	!display 47 eenheden
	CNTD	DSP47_1	!display 47 tientallen
	CNTD	DSP47_2	!display 47 honderdtallen
	CNTD	DSP47_3	!display 47 duizendtallen
  STRB  TIMER_47

	ANDNT	BDR0B06	!bedrijfsfase 6
	FTCHD	STP47_0	!setpoint 47 eenheden
	FTCHD	STP47_1	!setpoint 47 tientallen
	FTCHD	STP47_2	!setpoint 47 honderdtallen
	FTCHD	STP47_3	!setpoint 47 duizendtallen
	STRD	DSP47_0	!display 47 eenheden
	STRD	DSP47_1	!display 47 tientallen
	STRD	DSP47_2	!display 47 honderdtallen
	STRD	DSP47_3	!display 47 duizendtallen
  SET0  TIMER_47

	AND	BDR0B10	!bedrijfsmelding
  AND TIMER_45
  EQL DUMP_23

	AND	BDR0B10	!bedrijfsmelding
  AND TIMER_46
  EQL DUMP_24

	AND	BDR0B10	!bedrijfsmelding
  AND TIMER_47
  EQL DUMP_25

	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B04	!bedrijfsfase 4
	OR	BDR0B05	!bedrijfsfase 5
	OR	BDR0B06	!bedrijfsfase 6
	OR	REG0B88	!aanloopfase 88
  EQL DUMP_26

	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B02	!bedrijfsfase 2
	OR	BDR0B05	!bedrijfsfase 5
	OR	BDR0B06	!bedrijfsfase 6
	OR	REG0B88	!aanloopfase 88
  EQL DUMP_27

	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B02	!bedrijfsfase 2
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B04	!bedrijfsfase 4
	OR	REG0B88	!aanloopfase 88
  EQL DUMP_28

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_26
  OR  DUMP_23
  OR  DUMP_2
	EQL	V1_1

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_27
  OR  DUMP_24
  OR  DUMP_2
	EQL	V3_1

	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_28
  OR  DUMP_25
  OR  DUMP_2
	EQL	V5_1

	OR	REG0B12	!regeneratiefase 12
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B22	!regeneratiefase 22
	OR	REG0B26	!regeneratiefase 26
  EQL DUMP_29

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_29
	OR	REG0B53	!handmatig vullen CMF
	EQL	V9_3

	OR	REG0B09
	OR	REG0B61
	OR	REG0B64
  EQL DUMP_29

  AND R_VOORW !regeneratievoorw. OK
  AND DUMP_29
	EQL	V11_2

  AND R_VOORW !regeneratievoorw. OK
	AND	REG0B16	!regeneratiefase 16
	EQL	V11_3

	OR	BDR0B01	!bedrijfsfase 1
	OR	BDR0B02	!bedrijfsfase 2
	OR	BDR0B03	!bedrijfsfase 3
	OR	BDR0B04	!bedrijfsfase 4
	OR	BDR0B05	!bedrijfsfase 5
	OR	BDR0B06	!bedrijfsfase 6
  EQL DUMP_30

	ANDNT	ALM0B04	!tijdvertr. rho alarm proceswater
	AND	BDR0B10	!bedrijfsmelding
  AND DUMP_30
	EQL	V7_1

	AND	REG0B33	!regeneratiefase 33
  AND R_VOORW !regeneratievoorw. OK
	OR	ALM0B04	!tijdvertr. rho alarm proceswater
	AND	BDR0B10	!bedrijfsmelding
	OR	REG0B88	!aanloopfase 88
	AND	BDR0B10	!bedrijfsmelding
	EQL	V7_2
!
! inbedrijfmelding CMF_unit t.b.v. kast algemene installatie
!
  AND POMP_P10
  AND V10_3_O !eindschak.afsluiter V10.3 geopend
  EQL DUMP_1

  AND R_VOORW !regeneratievoorw. OK
	AND	V9_2
  OR  R_VOORW !regeneratievoorw. OK
	AND	REG0B12	!regeneratiefase 12
  OR  R_VOORW !regeneratievoorw. OK
	AND	REG0B19	!regeneratiefase 19
  OR  R_VOORW !regeneratievoorw. OK
	AND	REG0B22	!regeneratiefase 22
  OR  R_VOORW !regeneratievoorw. OK
	AND	REG0B26	!regeneratiefase 26
  EQL DUMP_2

  AND DUMP_1
  OR  DUMP_2
  EQL CMF_IN  !inbedrijfmelding CMF naar kast algemeen

	OR	REG0B08	!regeneratiefase 8
	OR	REG0B09	!regeneratiefase 9
	OR	REG0B10	!regeneratiefase 10
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B12	!regeneratiefase 12
	OR	REG0B13	!regeneratiefase 13
	OR	REG0B14	!regeneratiefase 14
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B18	!regeneratiefase 18
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B22	!regeneratiefase 22
	OR	REG0B25	!regeneratiefase 25
	OR	REG0B26	!regeneratiefase 26
	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
  EQL DUMP_3

  AND DUMP_3
	OR	REG0B53	!handmatig vullen CMF
	OR	REG0B54	!handmatig ledigen CMF
  EQL V13_1__2
!
! vrijgave loogverwarming via kast algemene voorzieningen
!
	AND	REG0B08	!regeneratiefase 8
	OR	REG0B09	!regeneratiefase 9
	OR	REG0B10	!regeneratiefase 10
	OR	REG0B11	!regeneratiefase 11
	OR	REG0B12	!regeneratiefase 12
	OR	REG0B13	!regeneratiefase 13
	OR	REG0B14	!regeneratiefase 14
	OR	REG0B15	!regeneratiefase 15
	OR	REG0B16	!regeneratiefase 16
	OR	REG0B60
	OR	REG0B61
	OR	REG0B62
	OR	REG0B63
	OR	REG0B64
	OR	REG0B65
	EQL	166.0
  EQL DUMP_4
!
! aansturing concentraatafvoerklep technische bedrijven fase 8 t/m 23
!
  AND DUMP_4
	OR	REG0B17	!regeneratiefase 17
	OR	REG0B18	!regeneratiefase 18
	OR	REG0B19	!regeneratiefase 19
	OR	REG0B20	!regeneratiefase 20
	OR	REG0B21	!regeneratiefase 21
	OR	REG0B22	!regeneratiefase 22
	OR	REG0B23	!regeneratiefase 23
	OR	REG0B54	!handmatig ledigen CMF
	EQL	166.2
!
! aansturing spoelwaterafvoerklep technische bedrijven
!
	ANDNT	166.2
	EQL	166.1
	NOP	3
!                               DR_AFSBW
!				********
!
!
! In dit deel wordt gekeken of de kleppen die worden aangestuurd ook
! werkelijk geopend of gesloten zijn.
!
	AND	V1_1
  ANDNT V1_1_O  !eindschak.afsluiter V 1.1 geopend
	ORNT	V1_1
  ANDNT V1_1_C  !eindschak.afsluiter V 1.1 gesloten
  EQL DUMP_31

	AND	S_1SEC	!triggerpuls 1,0 sec.
  AND DUMP_31
  ANDNT TIMER_49
	CNTD	DSP49_0	!display 49 eenheden
	CNTD	DSP49_1	!display 49 tientallen
	CNTD	DSP49_2	!display 49 honderdtallen
	CNTD	DSP49_3	!display 49 duizendtallen
  STRB  TIMER_49

  ANDNT DUMP_31
	OR	ALARM29	!V 1.1 niet geopend
	FTCHD	STP49_0	!setpoint 49 eenheden
	FTCHD	STP49_1	!setpoint 49 tientallen
	FTCHD	STP49_2	!setpoint 49 honderdtallen
	FTCHD	STP49_3	!setpoint 49 duizendtallen
	STRD	DSP49_0	!display 49 eenheden
	STRD	DSP49_1	!display 49 tientallen
	STRD	DSP49_2	!display 49 honderdtallen
	STRD	DSP49_3	!display 49 duizendtallen
  SET0  TIMER_49