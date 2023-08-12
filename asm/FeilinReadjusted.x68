*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Feilin Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to Liu Feilin.
*----------------------------------------------------------------------------------------------

; ORG         $1B428                    ; Replace 1B428 (There is space to replace everything).

                                        ; Block of code that jumps to kick buttons move interpretation.
  BEQ         $1B44E                    ; If it is 0, no punch pressed, go to kick move interpretation.


; ORG         $1B448                    ; Replace 1B448 (There is space to replace everything).

                                        ; Block of code that removes the old Kakkuu Hakkaku Souhiken execution.
  BRA         $1B458                    ; Jumps to the code that executes Hakkaku Souhiken.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  JMP         $FE100                    ; Jumps to the code that handles the interpretation of the new moves.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.


; ORG         $1B488                    ; Replace 1B488 (There is space to replace everything).

                                        ; Block of code that executes Kakkuu Hakkaku Souhiken as a kick move.
  AND.W       #$0C, D0                  ; D0 and C, both kick buttons.
  LSR.W       #$2, D0                   ; Shifts right D0 bits by 2, 4 to 1, 8 to 2.
  MOVE.B      (A1, D0.W), D0            ; Code from the original game that was replaced.
  MOVE.W      #$6D, D7                  ; Code from the original game that was replaced.
  ADD.W       D0, D7                    ; Code from the original game that was replaced.
  ADD.W       D0, D7                    ; Code from the original game that was replaced.
  MOVEQ       #$98, D6                  ; Code from the original game readjusted.


; ORG         $1B554                    ; Replace 1B554 (There is space to replace everything).

                                        ; Block of code that improves the dive height restriction.
  CMP.W       #$50, ($00C4, A0)         ; Compares 30 and ($C4 + A0), minimum height required to dive.
  BCS         $1B5BE                    ; If it is less than 30, do not execute the dive.
  NOP                                   ; No operation, does nothing.


; ORG         $FE100

                                        ; Block of code that checks if kick moves should be interpreted.
  BTST        #$3, ($BF, A0)            ; Compares 0 and the 4th bit of ($BF + A0), 0 ground, 1 air.
  BNE         $FE116                    ; If the bit is not 0, it is on air, go to the last line.
  MOVE.B      D7, D0                    ; Stores D7 inside D0, buttons pressed.
  AND.B       #$0C, D0                  ; D0 and C, both kick buttons.
  BEQ         $FE116                    ; If D0 is equals 0, no kick was pressed, go to the last line.
  JMP         $FE130                    ; Jumps to the code that handles the interpretation of the new moves.
  JMP         $1B52E                    ; Jumps back to where it stopped in the original code.


; ORG         $FE130

                                        ; Block of code that handles the execution of Kakkuu Hakkaku Souhiken.
  MOVEQ       #$7, D6                   ; Stores 7 inside D6, D-U input ID.
  MOVEQ       #$28, D5                  ; Stores 28 inside D5, 40 frames of charge.
  JSR         $166FC.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE144                    ; If it is not 0, the move wasn't executed, go to the last line.
  JMP         $1B47C                    ; Jumps to the code that executes Kakkuu Hakkaku Souhiken.
  JMP         $FE180                    ; Jumps to the code that handles the execution of other move.


; ORG         $FE180

                                        ; Block of code that handles the execution of Kakkuu Hakkaku Souhiken II.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE1B2                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if a DM was executed already.
  BNE         $FE1B2                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$10, D6                  ; Stores 10 inside D6, QCF-HCB input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE1B2                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$72, D7                  ; Stores 72 inside D7, New Move 2 ID (Kakkuu Hakkaku Souhiken II).
  MOVEQ       #$98, D6                  ; Stores 98 inside D6, behavior 3 ID.
  CLR.W       ($1F0, A0)                ; Clears ($1F0 + A0), no custom translation speed.
  CLR.L       ($1F2, A0)                ; Clears ($1F2 + A0), no extra sound to play.
  CLR.W       ($1FC, A0)                ; Clears ($1FC + A0), default move code behavior (1A49A).
  JMP         $1B566                    ; Jumps to the code that executes Kakkuu Hakkaku Souhiken II.
  JMP         $1B52E                    ; Jumps back to where it stopped in the original code.


; All routines for the readjusted version of Feilin.
; 
; 01B428:   Jump To The Code That Interprets Moves With Kick Buttons
; 01B448:   Removes Default Kakkuu Hakkaku Souhiken Execution
; 01B488:   Executes Kakkuu Hakkaku Souhiken As Kick Button Move
; 0FE100:   Check If Kick Button Moves Should Be Interpreted
; 0FE130:   New Kakkuu Hakkaku Souhiken Interpretation
; 0FE180:   New Move 1 Interpretation (Kakkuu Hakkaku Souhiken II)