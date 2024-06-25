        TITLE '8080 MICROCHESS'

; 8080 MICROCHESS
; (C) COPYRIGHT 1977, MICRO-WARE LIMITED
; WRITTEN BY P. JENNINGS & T. O'BRIEN
;
; TYPED IN HEXDUMP FROM THE MANUAL AND APPLIED PATCHES
; FROM THE OCTOBER 1977 MICROCHESS NOTES.
;
; BY DEFAULT THE PROGRAM USES TERMINAL I/O FOR
; A CROMEMCO TU-ART. BY SETTING ONE OF MITS
; OR IMSAI TO 1, THE TERMINAL I/O ROUTINES ARE
; PATCHED FOR A MITS 2SIO OR IMSAI SIO2.
;
; ADDED THE DOCUMENTED PATCHES FOR DISPLAY OPTIONS.
; ADDED PATCHES TO MAKE IT WORKING UNDER CP/M.
;
; UDO MUNK, OCTOBER 2016
;
; ADDED PATCH TO DISPLAY A SMALL BOARD WITH COORDINATES.
; ADDED DAZZLER OUPUT USING 8080 INSTRUCTIONS ONLY.
; MADE PATCH FOR BOARD WITH COORDINATES RELOCATABLE.
; FIRST SWITCH DAZZLER ON AND THEN DRAW BOARD, SO THAT
; IT ALSO WORKS WITH DAZZLER II.
; IMPROVED CP/M PATCH, NOW ALSO SAVES IOBYTE, SOME BIOS'S
; NEED IT.
;
; UDO MUNK, NOVEMBER 2016
;
; ASSEMBLE WITH INTEL 8080 CROSSASSEMBLER OR DRI MAC UNDER CP/M.
; UNDER CP/M DRI LOAD WILL NOT WORK, USE MLOAD.
;
; IN THIS VERSION THE MITS TERMINAL I/O IS PATCHED FOR PICOSIM.
;
; UDO MUNK, APRIL 2024


OFFSET  SET  0

;
; BUILD STANDALONE OR CP/M VERSION
;
CPM     SET  0

        IF   CPM
OFFSET  SET  0100H
        ENDIF

;
; ADDITIONAL DAZZLER GRAPHICS OUTPUT
;
DAZZLER SET  1

;
; TERMINAL I/O PATCH OPTIONS FOR STANDALONE
;
MITS    SET  1
IMSAI   SET  0

;
; DISPLAY OPTIONS
;
SMALLD  SET  0          ;SMALL BOARD DISPLAY
COORD   SET  1          ;DISPLAY SMALL BOARD WITH COORDINATES
MAUTO   SET  1          ;AUTO DISPLAY AFTER MICROCHESS MOVES
CAUTO   SET  1          ;AUTO DISPLAY AFTER CHALLENGER MOVES

        ORG  OFFSET

L000:   DB 031H,082H,00DH,0CDH,0ACH,009H,021H,06DH
        DB 00BH,0CDH,0DAH,001H,021H,093H,00BH,0CDH

L010:   DB 0DAH,001H,021H,0B9H,00BH,0CDH,0DAH,001H
        DB 0CDH,0ACH,009H,0CDH,0AFH,005H,021H,095H

L020:   DB 00AH,022H,07DH,00AH,021H,0CBH,00AH,022H
        DB 07FH,00AH,021H,001H,00BH,022H,079H,00AH

L030:   DB 021H,037H,00BH,022H,07BH,00AH,0AFH,032H
        DB 074H,00AH,032H,078H,00AH,032H,082H,00AH

L040:   DB 032H,081H,00AH,032H,075H,00AH,032H,076H
        DB 00AH,03EH,010H,032H,077H,00AH,03EH,0EEH

L050:   DB 032H,04DH,00AH,032H,04EH,00AH,021H,0F5H
        DB 00BH,0CDH,05CH,001H,0CDH,0C9H,009H,0CDH

L060:   DB 0BFH,009H,078H,00FH,0D2H,06FH,000H,03EH
        DB 001H,032H,082H,00AH,0CDH,0C3H,005H,0CDH

L070:   DB 042H,002H,0CDH,0ACH,009H,031H,082H,00DH
        DB 021H,0E6H,00DH,022H,059H,00AH,021H,020H

L080:   DB 020H,022H,020H,00CH,021H,010H,00CH,0CDH
        DB 05CH,001H,0CDH,020H,003H,0CDH,0ACH,009H

L090:   DB 021H,00AH,00DH,07EH,0FEH,047H,0CAH,0D7H
        DB 000H,0FEH,044H,0CAH,042H,003H,0FEH,045H

L0A0:   DB 0CAH,02CH,002H,0FEH,053H,0CAH,0E1H,001H
        DB 0FEH,04FH,0CAH,0D1H,003H,0FEH,052H,0CAH

L0B0:   DB 020H,002H,0FEH,041H,0CAH,0F1H,002H,0FEH
        DB 04EH,0CAH,005H,003H,0CDH,068H,001H,03AH

L0C0:   DB 00FH,00DH,0FEH,04DH,0CAH,026H,001H,0FEH
        DB 03DH,0CAH,048H,003H,0FEH,00DH,0C2H,02CH

L0D0:   DB 001H,0CDH,06DH,008H,000H,000H,000H,0CDH
        DB 07DH,004H,03AH,078H,00AH,0B7H,0CAH,0F4H

L0E0:   DB 000H,021H,04FH,020H,022H,01EH,00CH,021H
        DB 020H,04FH,022H,01BH,00CH,0AFH,032H,078H

L0F0:   DB 00AH,0C3H,002H,001H,0CDH,0ADH,001H,0CDH
        DB 097H,003H,03AH,04FH,00AH,0FEH,0FFH,0CAH

L100:   DB 038H,001H,021H,016H,00CH,0CDH,05CH,001H
        DB 03AH,081H,00AH,0FEH,0FFH,0CAH,017H,003H

L110:   DB 03AH,074H,00AH,0B7H,0CAH,01DH,001H,021H
        DB 0AEH,00CH,0CDH,05CH,001H,0CDH,0ACH,009H

L120:   DB 000H,000H,000H,0C3H,075H,000H,0CDH,06DH
        DB 008H,0C3H,075H,000H,021H,023H,00CH,0CDH

L130:   DB 05CH,001H,0CDH,0ACH,009H,0C3H,075H,000H
        DB 021H,030H,00CH,0CDH,0DAH,001H,0CDH,042H

L140:   DB 002H,0CDH,0ACH,009H,021H,047H,00CH,0CDH
        DB 05CH,001H,0CDH,0C9H,009H,0CDH,0BFH,009H

L150:   DB 078H,0FEH,059H,0C2H,0C8H,001H,0CDH,0ACH
        DB 009H,0C3H,018H,000H,07EH,0FEH,00DH,0C8H

L160:   DB 047H,0CDH,0BFH,009H,023H,0C3H,05CH,001H
        DB 02AH,00AH,00DH,0CDH,099H,001H,032H,050H

L170:   DB 00AH,02AH,00DH,00DH,0CDH,099H,001H,032H
        DB 051H,00AH,032H,04EH,00AH,03AH,050H,00AH

L180:   DB 021H,00CH,00AH,00EH,01FH,0BEH,0CAH,091H
        DB 001H,02BH,00DH,0F2H,085H,001H,0C3H,02CH

L190:   DB 001H,079H,032H,04DH,00AH,032H,04FH,00AH
        DB 0C9H,07DH,0E6H,00FH,017H,017H,017H,017H

L1A0:   DB 047H,07CH,0E6H,00FH,0B0H,047H,0E6H,088H
        DB 0C2H,02CH,001H,078H,0C9H,03AH,050H,00AH

L1B0:   DB 047H,0CDH,08FH,009H,02AH,0DDH,009H,022H
        DB 01BH,00CH,03AH,051H,00AH,047H,0CDH,08FH

L1C0:   DB 009H,02AH,0DDH,009H,022H,01EH,00CH,0C9H
        DB 0CDH,0ACH,009H,0CDH,0ACH,009H,021H,05BH

L1D0:   DB 00CH,0CDH,05CH,001H,0CDH,0ACH,009H,076H
        DB 000H,000H,0CDH,05CH,001H,0CDH,0ACH,009H

L1E0:   DB 0C9H,0CDH,0ACH,009H,021H,0DFH,00BH,0CDH
        DB 05CH,001H,0CDH,0C9H,009H,0CDH,0BFH,009H

L1F0:   DB 078H,0FEH,053H,0CAH,003H,002H,0FEH,042H
        DB 0CAH,00AH,002H,0FEH,04EH,0CAH,011H,002H

L200:   DB 0C3H,02CH,001H,006H,000H,00EH,0FFH,0C3H
        DB 015H,002H,006H,000H,00EH,0FBH,0C3H,015H

L210:   DB 002H,006H,008H,00EH,0FBH,078H,032H,01EH
        DB 007H,079H,032H,061H,008H,0C3H,072H,000H

L220:   DB 0CDH,0ACH,009H,021H,07EH,00CH,0CDH,05CH
        DB 001H,0C3H,03EH,001H,0CDH,0C3H,005H,03AH

L230:   DB 082H,00AH,0B7H,0CAH,03AH,002H,0AFH,0C3H
        DB 03CH,002H,03EH,001H,032H,082H,00AH,0C3H

L240:   DB 075H,000H,0CDH,0ACH,009H,0CDH,0ACH,009H
        DB 016H,000H,021H,0B6H,00CH,0CDH,0DAH,001H

L250:   DB 07AH,0B7H,0CAH,05BH,002H,021H,0D2H,00CH
        DB 0CDH,0DAH,001H,006H,021H,0CDH,0BFH,009H

L260:   DB 006H,020H,0CDH,0BFH,009H,021H,00CH,00AH
        DB 00EH,01FH,07EH,0BAH,0CAH,0B8H,002H,02BH

L270:   DB 00DH,0F2H,06AH,002H,07AH,0E6H,00FH,05FH
        DB 07AH,0E6H,0F0H,00FH,00FH,00FH,00FH,083H

L280:   DB 01FH,0DAH,089H,002H,006H,020H,0C3H,08BH
        DB 002H,006H,03AH,0CDH,0BFH,009H,0CDH,0BFH

L290:   DB 009H,006H,020H,0CDH,0BFH,009H,014H,07AH
        DB 0E6H,00FH,0FEH,008H,0C2H,065H,002H,006H

L2A0:   DB 021H,0CDH,0BFH,009H,0CDH,0ACH,009H,07AH
        DB 0C6H,008H,057H,0F2H,050H,002H,021H,0EEH

L2B0:   DB 00CH,0CDH,0DAH,001H,0CDH,0ACH,009H,0C9H
        DB 079H,0FEH,010H,0D2H,0D3H,002H,03AH,082H

L2C0:   DB 00AH,0B7H,0C2H,0CCH,002H,03AH,083H,00AH
        DB 047H,0C3H,0DDH,002H,03AH,084H,00AH,047H

L2D0:   DB 0C3H,0DDH,002H,03AH,082H,00AH,0B7H,0C2H
        DB 0C5H,002H,0C3H,0CCH,002H,0CDH,0BFH,009H

L2E0:   DB 079H,0E6H,00FH,04FH,006H,000H,021H,085H
        DB 00AH,009H,046H,0CDH,0BFH,009H,0C3H,091H

L2F0:   DB 002H,03EH,0CDH,032H,0D4H,000H,032H,020H
        DB 001H,021H,042H,002H,022H,0D5H,000H,022H

L300:   DB 021H,001H,0C3H,072H,000H,021H,000H,000H
        DB 022H,0D4H,000H,022H,0D5H,000H,022H,020H

L310:   DB 001H,022H,021H,001H,0C3H,072H,000H,021H
        DB 096H,00CH,0CDH,05CH,001H,0C3H,03EH,001H

L320:   DB 021H,00AH,00DH,00EH,000H,0CDH,0C9H,009H
        DB 078H,077H,0FEH,00DH,0CAH,03CH,003H,0FEH

L330:   DB 018H,0CAH,072H,000H,0CDH,0BFH,009H,023H
        DB 00CH,0C3H,025H,003H,0AFH,0B9H,0CAH,025H

L340:   DB 003H,0C9H,0CDH,042H,002H,0C3H,075H,000H
        DB 0CDH,068H,001H,021H,00CH,00AH,00EH,00FH

L350:   DB 03AH,050H,00AH,0BEH,0CAH,05CH,003H,02BH
        DB 00DH,0F2H,053H,003H,036H,0CCH,021H,08CH

L360:   DB 00AH,00EH,007H,03AH,010H,00DH,0BEH,0CAH
        DB 072H,003H,02BH,00DH,0F2H,066H,003H,0C3H

L370:   DB 02CH,001H,021H,0FDH,009H,006H,000H,009H
        DB 03EH,0CCH,0BEH,0CAH,083H,003H,02BH,0BEH

L380:   DB 0C2H,02CH,001H,03AH,051H,00AH,077H,03AH
        DB 011H,00DH,0FEH,04DH,0CAH,072H,000H,0FEH

L390:   DB 00DH,0CAH,0D4H,000H,0C3H,02CH,001H,03AH
        DB 051H,00AH,0E6H,0F0H,0FEH,070H,0C0H,03AH

L3A0:   DB 04FH,00AH,04FH,0E6H,008H,0C8H,021H,0EDH
        DB 009H,006H,000H,009H,03EH,0CCH,077H,021H

L3B0:   DB 0EEH,009H,01EH,000H,0BEH,0CAH,0BDH,003H
        DB 023H,01CH,0C3H,0B4H,003H,03AH,051H,00AH

L3C0:   DB 077H,03EH,03DH,032H,020H,00CH,021H,086H
        DB 00AH,016H,000H,019H,07EH,032H,021H,00CH

L3D0:   DB 0C9H,03AH,00CH,00DH,0FEH,04FH,0C2H,02CH
        DB 001H,03AH,00EH,00DH,0FEH,04FH,0C2H,02FH

L3E0:   DB 004H,03AH,082H,00AH,0B7H,0CAH,005H,004H
        DB 03AH,0FDH,009H,0FEH,074H,0C2H,02CH,001H

L3F0:   DB 03EH,072H,032H,0FDH,009H,03EH,073H,032H
        DB 000H,00AH,032H,04EH,00AH,03EH,013H,032H

L400:   DB 04DH,00AH,0C3H,01FH,004H,03AH,0FDH,009H
        DB 0FEH,073H,0C2H,02CH,001H,03EH,075H,032H

L410:   DB 0FDH,009H,03EH,074H,032H,000H,00AH,032H
        DB 04EH,00AH,03EH,013H,032H,04DH,00AH,03AH

L420:   DB 00FH,00DH,0FEH,04DH,0CAH,072H,000H,0FEH
        DB 00DH,0CAH,0D4H,000H,0C3H,02CH,001H,03AH

L430:   DB 082H,00AH,0B7H,0CAH,053H,004H,03AH,0FDH
        DB 009H,0FEH,074H,0C2H,02CH,001H,03EH,076H

L440:   DB 032H,0FDH,009H,03EH,075H,032H,0FFH,009H
        DB 032H,04EH,00AH,03EH,012H,032H,04DH,00AH

L450:   DB 0C3H,06DH,004H,03AH,0FDH,009H,0FEH,073H
        DB 0C2H,02CH,001H,03EH,071H,032H,0FDH,009H

L460:   DB 03EH,072H,032H,0FFH,009H,032H,04EH,00AH
        DB 03EH,012H,032H,04DH,00AH,03AH,00DH,00DH

L470:   DB 0FEH,04DH,0CAH,072H,000H,0FEH,00DH,0CAH
        DB 0D4H,000H,0C3H,02CH,001H,02AH,075H,00AH

L480:   DB 07DH,0FEH,036H,0D2H,06BH,005H,0CDH,0CFH
        DB 004H,0F5H,02AH,075H,00AH,023H,022H,075H

L490:   DB 00AH,0F1H,0D2H,06BH,005H,0CDH,04FH,005H
        DB 0CDH,0B7H,004H,0CDH,06DH,008H,03AH,04DH

L4A0:   DB 00AH,0FEH,000H,0C0H,03EH,002H,032H,04DH
        DB 00AH,03AH,04EH,00AH,0EEH,003H,032H,04EH

L4B0:   DB 00AH,032H,078H,00AH,0C3H,098H,004H,021H
        DB 0EDH,009H,03AH,04DH,00AH,032H,04FH,00AH

L4C0:   DB 04FH,006H,000H,009H,07EH,032H,050H,00AH
        DB 03AH,04EH,00AH,032H,051H,00AH,0C9H,0CDH

L4D0:   DB 004H,005H,0CAH,0EBH,004H,0CDH,01CH,005H
        DB 021H,077H,00AH,035H,0F2H,0E7H,004H,0AFH

L4E0:   DB 026H,000H,02EH,0F0H,022H,075H,00AH,0DAH
        DB 0CFH,004H,0C9H,0CDH,029H,005H,02AH,075H

L4F0:   DB 00AH,0EBH,02AH,079H,00AH,019H,07EH,032H
        DB 04DH,00AH,02AH,07BH,00AH,019H,07EH,032H

L500:   DB 04EH,00AH,037H,0C9H,02AH,075H,00AH,0EBH
        DB 02AH,07DH,00AH,019H,03AH,04DH,00AH,0BEH

L510:   DB 0C2H,01BH,005H,02AH,07FH,00AH,019H,03AH
        DB 04EH,00AH,0BEH,0C9H,02AH,075H,00AH,07DH

L520:   DB 0C6H,009H,06FH,022H,075H,00AH,0FEH,036H
        DB 0C9H,02AH,075H,00AH,0E5H,03AH,077H,00AH

L530:   DB 04FH,03EH,0FFH,032H,077H,00AH,0CDH,01CH
        DB 005H,021H,077H,00AH,034H,0D2H,04AH,005H

L540:   DB 00DH,0FAH,04AH,005H,0CDH,004H,005H,0CAH
        DB 036H,005H,0E1H,022H,075H,00AH,0C9H,03AH

L550:   DB 01EH,007H,03CH,057H,006H,005H,00EH,0FFH
        DB 03EH,0FFH,03DH,0C2H,05AH,005H,00DH,0C2H

L560:   DB 058H,005H,005H,0C2H,056H,005H,015H,0C2H
        DB 054H,005H,0C9H,03EH,00CH,032H,054H,00AH

L570:   DB 032H,050H,00AH,00EH,014H,0CDH,0DFH,005H
        DB 03EH,004H,032H,054H,00AH,0CDH,0DDH,005H

L580:   DB 03AH,050H,00AH,0FEH,00FH,0DAH,0A3H,005H
        DB 021H,0EDH,009H,006H,000H,03AH,04FH,00AH

L590:   DB 032H,04DH,00AH,04FH,009H,07EH,032H,050H
        DB 00AH,03AH,051H,00AH,032H,04EH,00AH,0CDH

L5A0:   DB 06DH,008H,0C9H,03EH,0FFH,032H,04FH,00AH
        DB 032H,050H,00AH,032H,051H,00AH,0C9H,021H

L5B0:   DB 00DH,00AH,011H,0EDH,009H,00EH,020H,07EH
        DB 012H,023H,013H,00DH,0C2H,0B7H,005H,0C9H

L5C0:   DB 0CDH,0AFH,005H,021H,0EDH,009H,011H,0FDH
        DB 009H,00EH,010H,03EH,077H,096H,047H,0EBH

L5D0:   DB 03EH,077H,096H,070H,0EBH,077H,023H,013H
        DB 00DH,0C2H,0CBH,005H,0C9H,00EH,010H,021H

L5E0:   DB 05DH,00AH,0AFH,077H,023H,00DH,0F2H,0E3H
        DB 005H,03EH,010H,032H,04DH,00AH,021H,04DH

L5F0:   DB 00AH,035H,0F8H,0CDH,058H,007H,03EH,008H
        DB 032H,055H,00AH,03AH,04DH,00AH,0FEH,008H

L600:   DB 0F2H,056H,006H,0FEH,006H,0F2H,043H,006H
        DB 0FEH,004H,0F2H,035H,006H,0FEH,001H,0CAH

L610:   DB 01EH,006H,0F2H,027H,006H,0CDH,098H,006H
        DB 0C2H,015H,006H,0C3H,0EEH,005H,0CDH,0A9H

L620:   DB 006H,0C2H,01EH,006H,0C3H,0EEH,005H,03EH
        DB 004H,032H,055H,00AH,0CDH,0A9H,006H,0C2H

L630:   DB 02CH,006H,0C3H,0EEH,005H,0CDH,0A9H,006H
        DB 03AH,055H,00AH,0FEH,004H,0C2H,035H,006H

L640:   DB 0C3H,0EEH,005H,03EH,010H,032H,055H,00AH
        DB 0CDH,098H,006H,03AH,055H,00AH,0FEH,008H

L650:   DB 0C2H,048H,006H,0C3H,0EEH,005H,03EH,006H
        DB 032H,055H,00AH,0CDH,0DAH,006H,0FAH,06BH

L660:   DB 006H,03AH,052H,00AH,0B7H,0CAH,06BH,006H
        DB 0CDH,093H,007H,0CDH,058H,007H,021H,055H

L670:   DB 00AH,035H,07EH,0FEH,005H,0CAH,05BH,006H
        DB 0CDH,0DAH,006H,0DAH,08BH,006H,0FAH,0EEH

L680:   DB 005H,03AH,052H,00AH,0B7H,0C2H,0EEH,005H
        DB 0CDH,093H,007H,03AH,04EH,00AH,0E6H,0F0H

L690:   DB 0FEH,020H,0CAH,078H,006H,0C3H,0EEH,005H
        DB 0CDH,0DAH,006H,0FAH,0A1H,006H,0CDH,093H

L6A0:   DB 007H,0CDH,058H,007H,021H,055H,00AH,035H
        DB 0C9H,0CDH,0DAH,006H,0D2H,0C0H,006H,0F5H

L6B0:   DB 0E1H,022H,072H,00AH,03AH,052H,00AH,0B7H
        DB 0CAH,0A9H,006H,02AH,072H,00AH,0E5H,0F1H

L6C0:   DB 0FAH,0D2H,006H,03AH,052H,00AH,0F5H,0CDH
        DB 093H,007H,0F1H,032H,052H,00AH,0B7H,0CAH

L6D0:   DB 0A9H,006H,0CDH,058H,007H,021H,055H,00AH
        DB 035H,0C9H,03AH,055H,00AH,006H,000H,021H

L6E0:   DB 02CH,00AH,04FH,009H,03AH,04EH,00AH,086H
        DB 032H,04EH,00AH,0E6H,088H,0C2H,051H,007H

L6F0:   DB 03AH,04EH,00AH,00EH,01FH,021H,00CH,00AH
        DB 0BEH,0CAH,004H,007H,02BH,00DH,0F2H,0F8H

L700:   DB 006H,0C3H,012H,007H,079H,0FEH,010H,0DAH
        DB 051H,007H,03EH,001H,032H,052H,00AH,0C3H

L710:   DB 016H,007H,0AFH,032H,052H,00AH,03AH,054H
        DB 00AH,0B7H,0FAH,04FH,007H,0FEH,000H,0F2H

L720:   DB 04FH,007H,0F5H,03AH,052H,00AH,0F5H,03EH
        DB 0F9H,032H,054H,00AH,032H,053H,00AH,0CDH

L730:   DB 06DH,008H,0CDH,0C3H,005H,0CDH,0E9H,005H
        DB 0CDH,070H,007H,0F1H,032H,052H,00AH,0F1H

L740:   DB 032H,054H,00AH,03AH,053H,00AH,0B7H,0FAH
        DB 04FH,007H,03EH,080H,0B7H,037H,0C9H,0AFH

L750:   DB 0C9H,0AFH,032H,052H,00AH,02FH,0B7H,0C9H
        DB 021H,0EDH,009H,006H,000H,03AH,04DH,00AH

L760:   DB 04FH,009H,07EH,032H,04EH,00AH,0C9H,0CDH
        DB 06DH,008H,0CDH,0C3H,005H,0CDH,0E9H,005H

L770:   DB 0CDH,0C3H,005H,021H,000H,000H,039H,022H
        DB 057H,00AH,02AH,059H,00AH,0F9H,0D1H,021H

L780:   DB 055H,00AH,072H,021H,04DH,00AH,073H,0C1H
        DB 0E1H,071H,0E1H,070H,078H,032H,04EH,00AH

L790:   DB 0C3H,0A0H,008H,03AH,054H,00AH,0B7H,016H
        DB 000H,05FH,0FAH,020H,008H,03AH,04DH,00AH

L7A0:   DB 0B7H,0CAH,0B2H,007H,047H,03EH,008H,0BBH
        DB 0C2H,0B2H,007H,03AH,065H,00AH,0B8H,0CAH

L7B0:   DB 0FBH,007H,021H,062H,00AH,019H,034H,03EH
        DB 001H,0B8H,0C2H,0BEH,007H,034H,03AH,052H

L7C0:   DB 00AH,0B7H,0CAH,0F2H,007H,00EH,00FH,021H
        DB 00CH,00AH,03AH,04EH,00AH,0BEH,0CAH,0D7H

L7D0:   DB 007H,02BH,00DH,0F2H,0CDH,007H,076H,021H
        DB 03DH,00AH,006H,000H,009H,07EH,021H,063H

L7E0:   DB 00AH,019H,0BEH,0DAH,0ECH,007H,077H,021H
        DB 065H,00AH,019H,071H,021H,064H,00AH,019H

L7F0:   DB 086H,077H,07BH,0FEH,004H,0CAH,0FCH,007H
        DB 0FAH,034H,008H,0C9H,03AH,067H,00AH,032H

L800:   DB 05CH,00AH,0AFH,032H,054H,00AH,0CDH,06DH
        DB 008H,0CDH,0C3H,005H,0CDH,0DDH,005H,0CDH

L810:   DB 0C3H,005H,03EH,008H,032H,054H,00AH,0CDH
        DB 0E9H,005H,0CDH,073H,007H,0C3H,0ACH,008H

L820:   DB 016H,0FFH,0FEH,0F9H,0C2H,034H,008H,03AH
        DB 0FDH,009H,021H,04EH,00AH,0BEH,0C0H,0AFH

L830:   DB 032H,053H,00AH,0C9H,03AH,052H,00AH,0B7H
        DB 0C8H,03AH,04EH,00AH,00EH,007H,021H,004H

L840:   DB 00AH,0BEH,0CAH,04BH,008H,02BH,00DH,0C2H
        DB 041H,008H,0C9H,021H,03DH,00AH,006H,000H

L850:   DB 009H,07EH,021H,061H,00AH,019H,0BEH,0DAH
        DB 05BH,008H,077H,01BH,07BH,032H,054H,00AH

L860:   DB 0FEH,0FFH,0CAH,068H,008H,0CDH,067H,007H
        DB 021H,054H,00AH,034H,0C9H,021H,000H,000H

L870:   DB 039H,022H,057H,00AH,02AH,059H,00AH,0F9H
        DB 03AH,04EH,00AH,047H,00EH,01FH,021H,00CH

L880:   DB 00AH,0BEH,0CAH,08AH,008H,02BH,00DH,0F2H
        DB 081H,008H,036H,0CCH,0E5H,021H,0EDH,009H

L890:   DB 016H,000H,03AH,04DH,00AH,05FH,019H,0E5H
        DB 04EH,070H,0C5H,021H,055H,00AH,056H,0D5H

L8A0:   DB 021H,000H,000H,039H,022H,059H,00AH,02AH
        DB 057H,00AH,0F9H,0C9H,097H,03EH,080H,021H

L8B0:   DB 06AH,00AH,086H,023H,086H,023H,086H,021H
        DB 060H,00AH,086H,021H,05EH,00AH,086H,021H

L8C0:   DB 06FH,00AH,096H,023H,096H,021H,061H,00AH
        DB 096H,021H,05FH,00AH,096H,021H,05DH,00AH

L8D0:   DB 096H,021H,06EH,00AH,096H,021H,062H,00AH
        DB 096H,0D2H,0DDH,008H,097H,01FH,0C6H,040H

L8E0:   DB 021H,06BH,00AH,086H,023H,086H,021H,063H
        DB 00AH,096H,01FH,0C6H,090H,021H,05CH,00AH

L8F0:   DB 086H,086H,086H,086H,021H,060H,00AH,086H
        DB 021H,063H,00AH,096H,096H,023H,096H,096H

L900:   DB 021H,05FH,00AH,096H,0F5H,03AH,04EH,00AH
        DB 0FEH,033H,0CAH,030H,009H,0FEH,034H,0CAH

L910:   DB 030H,009H,0FEH,022H,0CAH,030H,009H,0FEH
        DB 025H,0CAH,030H,009H,03AH,04DH,00AH,0B7H

L920:   DB 0CAH,034H,009H,021H,0EDH,009H,006H,000H
        DB 04FH,009H,07EH,0FEH,010H,0F2H,034H,009H

L930:   DB 0F1H,0C6H,002H,0F5H,03AH,063H,00AH,021H
        DB 03DH,00AH,0BEH,0C2H,043H,009H,0F1H,097H

L940:   DB 0C3H,05BH,009H,03AH,062H,00AH,0B7H,0C2H
        DB 05AH,009H,03AH,06DH,00AH,0B7H,0C2H,05AH

L950:   DB 009H,0F1H,03EH,0FFH,032H,081H,00AH,0C3H
        DB 05BH,009H,0F1H,00EH,004H,021H,054H,00AH

L960:   DB 071H,021H,050H,00AH,032H,05BH,00AH,0BEH
        DB 0DAH,08EH,009H,0CAH,08EH,009H,032H,050H

L970:   DB 00AH,03AH,04DH,00AH,032H,04FH,00AH,03AH
        DB 04EH,00AH,032H,051H,00AH,0AFH,032H,074H

L980:   DB 00AH,03AH,06BH,00AH,021H,03DH,00AH,0BEH
        DB 0C2H,08EH,009H,032H,074H,00AH,0C9H,021H

L990:   DB 0DDH,009H,047H,01FH,01FH,01FH,01FH,0CDH
        DB 0A2H,009H,077H,023H,078H,0CDH,0A2H,009H

L9A0:   DB 077H,0C9H,0E6H,00FH,0C6H,030H,0FEH,03AH
        DB 0D8H,0C6H,007H,0C9H,006H,00DH,0CDH,0BFH

L9B0:   DB 009H,006H,00AH,0CDH,0BFH,009H,006H,07FH
        DB 0CDH,0BFH,009H,0CDH,0BFH,009H,0C9H,0E5H

L9C0:   DB 0C5H,0D5H,0CDH,0D7H,009H,0D1H,0C1H,0E1H
        DB 0C9H,0E5H,0D5H,0C5H,0CDH,0DAH,009H,078H

L9D0:   DB 0C1H,0D1H,0E1H,0E6H,07FH,047H,0C9H,0C3H
        DB 0E6H,00DH,0C3H,0F1H,00DH,000H,000H,000H

L9E0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,003H,004H,000H

L9F0:   DB 007H,002H,005H,001H,006H,010H,017H,011H
        DB 016H,012H,015H,014H,013H,073H,074H,070H

LA00:   DB 077H,072H,075H,071H,076H,060H,067H,061H
        DB 066H,062H,065H,064H,063H,003H,004H,000H

LA10:   DB 007H,002H,005H,001H,006H,010H,017H,011H
        DB 016H,012H,015H,014H,013H,073H,074H,070H

LA20:   DB 077H,072H,075H,071H,076H,060H,067H,061H
        DB 066H,062H,065H,064H,063H,0F0H,0FFH,001H

LA30:   DB 010H,011H,00FH,0EFH,0F1H,0DFH,0E1H,0EEH
        DB 0F2H,012H,00EH,01FH,021H,00BH,00AH,006H

LA40:   DB 006H,004H,004H,004H,004H,002H,002H,002H
        DB 002H,002H,002H,002H,002H,0EEH,0EEH,000H

LA50:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,0E6H,00DH,000H,000H,000H,000H,000H

LA60:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LA70:   DB 000H,000H,000H,000H,000H,000H,000H,010H
        DB 000H,001H,00BH,037H,00BH,095H,00AH,0CBH

LA80:   DB 00AH,000H,000H,057H,042H,04BH,051H,052H
        DB 052H,042H,042H,04EH,04EH,050H,050H,050H

LA90:   DB 050H,050H,050H,050H,050H,0EEH,01FH,017H
        DB 016H,016H,014H,016H,01BH,016H,0EEH,01FH

LAA0:   DB 01EH,016H,014H,016H,011H,010H,01DH,01EH
        DB 01DH,016H,01AH,014H,012H,017H,011H,011H

LAB0:   DB 01FH,016H,017H,014H,012H,01EH,015H,01BH
        DB 012H,01FH,016H,014H,012H,01EH,011H,014H

LAC0:   DB 01EH,017H,01FH,016H,014H,01DH,01EH,01DH
        DB 017H,012H,01BH,0EEH,043H,055H,052H,033H

LAD0:   DB 063H,054H,055H,066H,0EEH,053H,044H,052H
        DB 063H,064H,063H,072H,045H,043H,042H,055H

LAE0:   DB 056H,066H,075H,052H,062H,052H,044H,055H
        DB 052H,031H,075H,053H,036H,052H,074H,044H

LAF0:   DB 055H,031H,075H,043H,064H,022H,034H,052H
        DB 044H,055H,042H,052H,043H,043H,052H,075H

LB00:   DB 052H,00FH,006H,004H,000H,00EH,001H,004H
        DB 00EH,007H,00FH,00EH,007H,005H,00FH,005H

LB10:   DB 001H,00CH,006H,006H,00FH,00BH,005H,004H
        DB 000H,006H,006H,00CH,00FH,007H,006H,004H

LB20:   DB 000H,00EH,004H,001H,007H,00FH,007H,006H
        DB 006H,004H,006H,00BH,006H,000H,00FH,007H

LB30:   DB 004H,006H,00FH,004H,006H,006H,004H,033H
        DB 022H,046H,001H,034H,013H,055H,043H,025H

LB40:   DB 033H,034H,025H,041H,043H,063H,014H,032H
        DB 022H,025H,024H,021H,011H,014H,006H,044H

LB50:   DB 052H,035H,034H,022H,025H,041H,006H,023H
        DB 052H,014H,003H,034H,022H,025H,044H,014H

LB60:   DB 023H,022H,011H,006H,034H,022H,032H,025H
        DB 043H,041H,044H,052H,052H,04DH,049H,043H

LB70:   DB 052H,04FH,043H,048H,045H,053H,053H,020H
        DB 020H,020H,020H,020H,020H,020H,020H,020H

LB80:   DB 020H,020H,020H,020H,020H,020H,020H,020H
        DB 020H,028H,043H,029H,020H,031H,039H,037H

LB90:   DB 037H,02EH,00DH,057H,052H,049H,054H,054H
        DB 045H,04EH,020H,042H,059H,03AH,020H,050H

LBA0:   DB 02EH,020H,04AH,045H,04EH,04EH,049H,04EH
        DB 047H,053H,020H,026H,020H,054H,02EH,020H

LBB0:   DB 04FH,027H,042H,052H,049H,045H,04EH,02EH
        DB 00DH,02DH,02DH,02DH,02DH,02DH,02DH,02DH

LBC0:   DB 02DH,02DH,02DH,02DH,02DH,02DH,02DH,02DH
        DB 02DH,02DH,02DH,02DH,02DH,02DH,02DH,02DH

LBD0:   DB 02DH,02DH,02DH,02DH,02DH,02DH,02DH,02DH
        DB 02DH,02DH,02DH,02DH,02DH,02DH,00DH,057H

LBE0:   DB 048H,049H,043H,048H,020H,04DH,04FH,044H
        DB 045H,020H,03FH,020H,028H,053H,02CH,042H

LBF0:   DB 02CH,04EH,029H,020H,00DH,044H,04FH,020H
        DB 059H,04FH,055H,020H,057H,041H,04EH,054H

LC00:   DB 020H,057H,048H,049H,054H,045H,020H,03FH
        DB 020H,028H,059H,02CH,04EH,029H,020H,00DH

LC10:   DB 03AH,020H,020H,020H,020H,00DH,04DH,043H
        DB 020H,03AH,020H,000H,000H,02DH,000H,000H

LC20:   DB 020H,020H,00DH,049H,04EH,050H,055H,054H
        DB 020H,045H,052H,052H,04FH,052H,02EH,00DH

LC30:   DB 043H,048H,045H,043H,04BH,04DH,041H,054H
        DB 045H,020H,02DH,020H,059H,04FH,055H,020H

LC40:   DB 057H,049H,04EH,021H,021H,021H,00DH,050H
        DB 04CH,041H,059H,020H,041H,047H,041H,049H

LC50:   DB 04EH,020H,03FH,020H,028H,059H,02CH,04EH
        DB 029H,020H,00DH,054H,048H,041H,04EH,04BH

LC60:   DB 053H,020H,046H,04FH,052H,020H,054H,048H
        DB 045H,020H,047H,041H,04DH,045H,02EH,02EH

LC70:   DB 02EH,020H,04DH,049H,043H,052H,04FH,043H
        DB 048H,045H,053H,053H,02EH,00DH,059H,04FH

LC80:   DB 055H,020H,052H,045H,053H,049H,047H,04EH
        DB 045H,044H,020H,02DH,020H,049H,020H,057H

LC90:   DB 049H,04EH,021H,021H,021H,00DH,020H,020H
        DB 043H,048H,045H,043H,04BH,04DH,041H,054H

LCA0:   DB 045H,020H,02DH,020H,049H,020H,057H,049H
        DB 04EH,021H,021H,021H,021H,00DH,020H,043H

LCB0:   DB 048H,045H,043H,04BH,021H,00DH,02BH,02DH
        DB 02DH,02DH,02DH,02DH,02DH,020H,04DH,049H

LCC0:   DB 043H,052H,04FH,043H,048H,045H,053H,053H
        DB 020H,02DH,02DH,02DH,02DH,02DH,02DH,02DH

LCDO:   DB 02BH,00DH,021H,020H,020H,020H,020H,020H
        DB 020H,020H,020H,020H,020H,020H,020H,020H

LCE0:   DB 020H,020H,020H,020H,020H,020H,020H,020H
        DB 020H,020H,020H,020H,021H,00DH,02BH,02DH

LCF0:   DB 02DH,02DH,02DH,02DH,02DH,020H,043H,048H
        DB 041H,04CH,04CH,045H,04EH,047H,045H,052H

LD00:   DB 020H,02DH,02DH,02DH,02DH,02DH,02DH,02DH
        DB 02BH,00DH,000H,000H,000H,000H,000H,000H

LD10:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LD20:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LD30:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LD40:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LD50:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LD60:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LD70:   DB 000H,000H,015H,0D7H,01FH,0D0H,0CFH,009H
        DB 000H,020H,007H,080H,00AH,00DH,028H,003H

LD80:   DB 08DH,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LD90:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LDA0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LDB0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LDC0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LDD0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LDE0:   DB 000H,000H,000H,000H,000H,000H,0DBH,000H
        DB 0E6H,080H,0CAH,0E6H,00DH,078H,0D3H,001H

LDF0:   DB 0C9H,0DBH,000H,0E6H,040H,0CAH,0F1H,00DH
        DB 0DBH,001H,0E6H,07FH,047H,0C9H,000H,000H

LE00:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LE10:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LE20:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LE30:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LE40:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LE50:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LE60:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LE70:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LE80:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LE90:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LEA0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LEB0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LEC0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LED0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LEE0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LEF0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LF00:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LF10:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LF20:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LF30:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LF40:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LF50:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LF60:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LF70:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LF80:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LF90:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LFA0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LFB0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LFC0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LFD0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LFE0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

LFF0:   DB 000H,000H,000H,000H,000H,000H,000H,000H
        DB 000H,000H,000H,000H,000H,000H,000H,000H

;
; PATCH TERMINAL I/O FOR MITS SIO REV. 1 = PICOSIM
;
        IF   MITS
        ORG  0DE6H + OFFSET
TTYO:   IN   0
        ANI  80H
        JNZ  TTYO - OFFSET
        MOV  A,B
        OUT  1
        RET
TTYI:   IN   0
        ANI  1
        JNZ  TTYI - OFFSET
        IN   1
        ANI  7FH
        MOV  B,A
        RET
        ENDIF

;
; PATCH TERMINAL I/O FOR IMSAI SIO2
;
        IF   IMSAI
        ORG  0DE6H + OFFSET
TTYO:   IN   3
        ANI  1
        JZ   TTYO - OFFSET
        MOV  A,B
        OUT  2
        RET
TTYI:   IN   3
        ANI  2
        JZ   TTYI - OFFSET
        IN   2
        ANI  7FH
        MOV  B,A
        RET
        ENDIF

;
; PATCH FOR SMALL BOARD DISPLAY
;
        IF   SMALLD
        ORG  0258H + OFFSET
        DB   0,0,0
        ENDIF

;
; PATCH FOR AUTO DISPLAY AFTER MICROCHESS MOVES
;
        IF   MAUTO
        ORG  0120H + OFFSET
        DB   0CDH,042H,002H
        ENDIF

;
; PATCH FOR AUTO DISPLAY AFTER CHALLENGER MOVES
;
        IF   CAUTO
        ORG  00D4H + OFFSET
        DB   0CDH,042H,002H
        ENDIF

;
; ORIGINAL PATCH TO DISPLAY SMALL BOARD WITH COORDINATES
; DO NOT ACTIVATE TOGETHER WITH DAZZLER OUTPUT, USES SAME MEMORY
; PATCH AREA
; REPLACED WITH A RELOCATABLE PATCH FOR THIS BELOW
;
        IF   0
        ORG  024AH + OFFSET
        DB   021H,040H,00EH,0CDH,078H,00EH,03AH,02FH
        DB   00EH,0C6H,030H,047H,0CDH,060H,00EH,000H
        DB   000H
        ORG  02B1H + OFFSET
        DB   0CDH,084H,00EH
        ORG  0E40H + OFFSET
        DB   020H,020H,020H,020H,020H,030H,020H,020H
        DB   031H,020H,020H,032H,020H,020H,033H,020H
        DB   020H,034H,020H,020H,035H,020H,020H,036H
        DB   020H,020H,037H,00DH,000H,000H,000H,000H
        DB   0CDH,0BFH,009H,004H,078H,0E6H,007H,032H
        DB   02FH,00EH,006H,020H,0C3H,0BFH,009H,00EH
        DB   006H,020H,0CDH,0BFH,009H,0C3H,0BFH,009H
        DB   0CDH,0DAH,001H,0CDH,070H,00EH,021H,0B6H
        DB   00CH,0C3H,0DAH,001H,0CDH,070H,00EH,0C3H
        DB   0DAH,001H
        ENDIF

;
; RELOCATABLE PATCH TO DISPLAY SMALL BOARD WITH COORDINATES
;
        IF   COORD
        ORG  024AH + OFFSET     ;PATCH IN ROUTINES FOR BOARD COORDINATES
        LXI  H,CTEXT - OFFSET
        CALL DISP1 - OFFSET
        LDA  DDAT - OFFSET
        ADI  30H
        MOV  B,A
        CALL DISP3 - OFFSET
        NOP
        NOP
        ORG  02B1H + OFFSET
        CALL DISP4 - OFFSET
        ENDIF

;
; MAKE SURE THAT PATCHES BELOW GO INTO THE PATCH AREA, IF
; NOT ORG'ED OTHERWISE
;
        ORG  0E00H + OFFSET

;
; THE DAZZLER OUPUT ROUTINES FROM CROMEMCO DAZZLECHESS REWRITTEN WITH
; 8080 INSTRUCTIONS, SO THAT IT WORKS WITH ANY 8080/8085/Z80 SYSTEM
;

        IF   DAZZLER

        ORG  6 + OFFSET         ;PATCH THIRD INSTRUCTION TO CALL
        CALL DINIT - OFFSET     ;THE DAZZLER INITIALISATION

        ORG  0059H + OFFSET     ;PATCH IN DATA INITALISATION
        CALL IDATA - OFFSET

        ORG  0242H + OFFSET     ;PATCH CALL TO CUSTOM BOARD DISPLAY
        CALL DDISP - OFFSET

        ORG  05C3H + OFFSET     ;PATCH IN SUBROUTINE TO SWITCH PIECE COLOR
        CALL SWC - OFFSET

        ORG  0E00H + OFFSET     ;DAZZLER OUTPUT ROUTINES GO HERE

SWC:    PUSH PSW                ;SWITCH PIECE COLOR
        LDA  DAT1 - OFFSET
        CMA
        STA  DAT1 - OFFSET
        POP  PSW
        LXI  H,09EDH
        RET

DINIT:                          ;INITIALISE DAZZLER
        MVI  A,8CH              ;DAZZLER ON, VIDEO MEMORY @ 1800H
        OUT  0EH
        MVI  A,30H              ;NORMAL COLOR MODE, 64X64
        OUT  0FH
        CALL DBOARD - OFFSET    ;DRAW CHESS BOARD
        LXI  H,0B6DH
        RET

IDATA:                          ;INITIALISE DATA
        MVI  A,0FFH             ;PIECE COLOR BLACK
        STA  DAT1 - OFFSET
        CALL 015CH
        RET

DDISP:                          ;CUSTOM BOARD DISPLAY
        CALL DBOARD - OFFSET    ;DRAW CHESS BOAD
        CALL DPIECE - OFFSET    ;DRAW CHESS PIECES
        RET

DBOARD: MVI  B,10H              ;DRAW CHESS BOARD
        LXI  D,1801H
        LXI  H,1800H            ;DAZZLER VIDEO MEMORY @ 1800H
DB1:    PUSH B
        MVI  A,03H
        MVI  B,10H
DB2:    PUSH B
        MVI  B,0                ;DRAW FIELDS
DBP1:   MVI  M,33H              ;WHITE FIELD AS GREEN
        MOV  C,A
        CALL LDIR
        INX  D
        INX  H
DBP2:   MVI  M,99H              ;BLACK FIELD AS RED
        MOV  C,A
        CALL LDIR
        INX  D
        INX  H
        POP  B
        DCR  B
        JNZ  DB2 - OFFSET
        LDA  DBP1 + 1 - OFFSET  ;FLIP COLORS AND DRAW NEXT ROW OF FIELDS
        MOV  B,A
        LDA  DBP2 + 1 - OFFSET
        STA  DBP1 + 1 - OFFSET
        MOV  A,B
        STA  DBP2 + 1 - OFFSET
        POP  B
        DCR  B
        JNZ  DB1 - OFFSET
        RET

DPIECE:                         ;DRAW CHESS PIECES
        LXI  D,09ECH            ;PIECE ADDRESS TABLE - 1
        MVI  B,02H
DPIE0:  PUSH B
        LXI  H,PTAB - 6 - OFFSET ;PIECE GRAPHICS TABLE - 1 ENTRY
        SHLD DAT2 - OFFSET
        MVI  B,08H
DPIE1:  PUSH B
        CALL DONEP - OFFSET
        POP  B
        DCR  B
        JNZ  DPIE1 - OFFSET
        MVI  B,08H
DPIE2:  PUSH B
        CALL DONEP - OFFSET
        LXI  B,0FFFAH           ;BC = -6
        LHLD DAT2 - OFFSET
        DAD  B
        SHLD DAT2 - OFFSET
        POP  B
        DCR  B
        JNZ  DPIE2 - OFFSET
        LDA  DAT1 - OFFSET
        CMA
        STA  DAT1 - OFFSET
        POP  B
        DCR  B
        JNZ  DPIE0 - OFFSET
        RET

DONEP:                          ;DRAW ONE PIECE
        INX  D                  ;DE -> NEXT PIECE IN TABLE
        PUSH D
        CALL SUB1 - OFFSET
        LXI  B,6                ;6 BYTES PER PIECE GRAPHICS
        LHLD DAT2 - OFFSET
        DAD  B
        SHLD DAT2 - OFFSET
        CALL SUB2 - OFFSET
        POP  D
        RET

SUB1:   XCHG                    ;BIT FIDDLING TO GET PIECE GRAPHICS ON BOARD
        MOV  A,M
        ANI  80H
        MOV  A,M
        JZ   SUB11 - OFFSET
        POP  D
        LXI  B,6
        LHLD DAT2 - OFFSET
        DAD  B
        SHLD DAT2 - OFFSET
        POP  D
        RET
SUB11:  RRC
        MOV  B,A
        RLC
        RLC
        RLC
        MOV  C,A
        RLC
        MOV  E,A
        RLC
        ANI  4
        MOV  D,A
        MOV  A,E
        ANI  1
        ORA  D
        MOV  D,A
        MOV  A,B
        ANI  2
        ORA  D
        MOV  D,A
        MVI  A,18H
        ORA  D
        MOV  D,A
        MOV  A,E
        ANI  80H
        MOV  E,A
        MOV  A,C
        ANI  0CH
        ORA  E
        PUSH PSW
        ORI  16
        MOV  E,A
        POP  PSW
        RET

SUB2:   MOV  B,C
SUB22:  MOV  A,M
        ANI  32
        CNZ  SUB4 - OFFSET
        INX  D
        MOV  A,M
        ANI  16
        CNZ  SUB3 - OFFSET
        MOV  A,M
        ANI  8
        CNZ  SUB4 - OFFSET
        INX  D
        MOV  A,M
        ANI  4
        CNZ  SUB3 - OFFSET
        MOV  A,M
        ANI  2
        CNZ  SUB4 - OFFSET
        INX  D
        MOV  A,M
        ANI  1
        CNZ  SUB3 - OFFSET
        PUSH H
        LXI  H,000DH
        DAD  D
        XCHG
        POP  H
        INX  H
        DCR  B
        JNZ  SUB22 - OFFSET
        RET

SUB3:   XCHG
        MOV  A,M
        ANI  0F0H
        MOV  C,A
        LDA  DAT1 - OFFSET
        ANI  00FH
        ORA  C
        MOV  M,A
        XCHG
        RET

SUB4:   XCHG
        MOV  A,M
        ANI  00FH
        MOV  C,A
        LDA  DAT1 - OFFSET
        ANI  0F0H
        ORA  C
        MOV  M,A
        XCHG
        RET

DAT1:   DB   0FFH                       ;PIECE COLOR
DAT2:   DW   0                          ;PIECE LOCATION

PTAB:   DB   0CH,3FH,33H,21H,33H,1EH    ;PIECE GRAPHICS
        DB   00H,2DH,3FH,2DH,3FH,3FH
        DB   2DH,3FH,1EH,1EH,1EH,1EH
        DB   2DH,3FH,1EH,1EH,1EH,1EH
        DB   0CH,1CH,3FH,1EH,0CH,3FH
        DB   0CH,1CH,3FH,1EH,0CH,3FH
        DB   08H,1EH,3FH,37H,07H,0FH
        DB   08H,1EH,3FH,37H,07H,0FH
        DB   00H,0CH,0CH,1EH,3FH,3FH

        ENDIF

;
; RELOCATABLE PATCH TO DISPLAY SMALL BOARD WITH COORDINATES
;
        IF   COORD

DISP1:  CALL 01DAH
        CALL DISP2 - OFFSET
        LXI  H,0CB6H
        JMP  01DAH

DISP2:  MVI  B,20H
        CALL 09BFH
        JMP  09BFH

DISP3:  CALL 09BFH
        INR  B
        MOV  A,B
        ANI  07H
        STA  DDAT - OFFSET
        MVI  B,20H
        JMP  09BFH

DISP4:  CALL DISP2 - OFFSET
        JMP  01DAH

DDAT:   DB   0
CTEXT:  DB   '     0  1  2  3  4  5  6  7',0DH

        ENDIF

;
; PATCH TO RUN IT UNDER CP/M
;
        IF   CPM

        ORG  0 + OFFSET         ;PATCH FIRST INSTRUCTION TO JUMP
        JMP  CPMIN              ;TO THE CP/M PATCH

        ORG  01D7H + OFFSET     ;PATCH HLT FOR STANDALONE TO
        JMP  CPMOUT             ;RETURN TO CP/M

        ORG  0DE6H + OFFSET     ;PATCH TERMINAL OUT FOR CP/M
        MOV  C,B
        CALL CONOUT
        RET

        ORG  0DF1H + OFFSET     ;PATCH TERMINAL IN FOR CP/M
        CALL CONIN
        ANI  7FH
        MOV  B,A
        RET

        ORG  1000H + OFFSET     ;CP/M PATCH AREA
CPMIN:  LHLD 1                  ;BIOS WARM BOOT -> HL
        LXI  B,6                ;BIOS CONIN -> HL
        DAD  B
        INX  H
        MOV  A,M                ;STORE ADR. FOR CONIN
        STA  CONIN + 1
        INX  H
        MOV  A,M
        STA  CONIN + 2
        LHLD 1                  ;BIOS WARM BOOT -> HL
        LXI  B,9                ;BIOS CONOUT -> HL
        DAD  B
        INX  H
        MOV  A,M                ;STORE ADR. FOR CONOUT
        STA  CONOUT + 1
        INX  H
        MOV  A,M
        STA  CONOUT + 2
        LDA  3                  ;GET THE IOBYTE
        LXI  SP,STACK
        LXI  H,0                ;FOR CP/M WE NEED TO SAVE 00-7FH
        LXI  D,SAVE
        LXI  B,0080H
        CALL LDIR
        LXI  H,OFFSET           ;NOW MOVE THE PROGRAM DOWN TO 0
        LXI  D,0
        LXI  B,0FFFH
        CALL LDIR
        STA  3                  ;RESTORE THE IOBYTE, BIOS MIGHT NEED IT
        LXI  SP,0D82H           ;FIRST INSTRUCTION JUST PATCHED ABOVE
        CALL 09ACH              ;SECOND INSTRUCTION DESTROYED BY IOBYTE
        JMP  6                  ;GO TO MICROCHESS

CPMOUT: LXI  SP,STACK
        LXI  H,SAVE             ;RESTORE 00-7FH FOR CP/M
        LXI  D,0
        LXI  B,0080H
        CALL LDIR
        IF   DAZZLER
        XRA  A                  ;SWITCH DAZZLER OFF
        OUT  0EH
        ENDIF
        RST  0                  ;AND THEN RETURN TO CP/M

CONIN:  JMP  0                  ;CALL BIOS CONSOLE IN
CONOUT: JMP  0                  ;CALL BIOS CONSOLE OUT

SAVE:   DS   80H
        DS   16
STACK:

        ENDIF

;
; SUPPORT ROUTINE TO AVOID USING Z80 LDIR INSTRUCTION
;
        IF   CPM OR DAZZLER
LDIR:   PUSH PSW
LDIR1:  MOV  A,M
        STAX D
        INX  H
        INX  D
        DCX  B
        MOV  A,B
        ORA  C
        JNZ  LDIR1
        POP  PSW
        RET
        ENDIF

        END
