*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Samchay Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to the code of Samchay Tomyamgun.
*----------------------------------------------------------------------------------------------

; ORG         $1B9BE                    ; Replace 1B9BE (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE480                    ; Jumps to the code that handles the interpretation of the new moves.
  TST.B       ($149, A0)                ; Compares 0 and ($149, A0), fireball flag.
  BNE         $1B9F8                    ; If it is not 0, active fireball, go to the next move to interpret.
  MOVEQ       #$0, D6                   ; Code from the original game readjusted.
  JSR         $166A8                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


  JMP         $FE400                    ; Replace 1B9AC.
  NOP
  NOP

; ORG         $FE400

                                        ; Block of code that check if air kick moves should be interpreted.
  BTST        #$3, ($BF, A0)            ; Compares 0 and the 4th bit of ($BF + A0), 0 ground, 1 air.
  BEQ         $FE418                    ; If the bit is 0, it is not on air, go to the last line.
  MOVE.B      D7, D0                    ; Stores D7 inside D0, buttons pressed.
  AND.B       #$0C, D0                  ; D0 and C, both kick buttons.
  BEQ         $FE412                    ; If D0 is equals 0, no kick was pressed, go to the last line.
  BRA         $FE430                    ; Jumps to code that handles the interpretation of Air Ti Kau Koun.
  JMP         $1BB22                    ; Jumps to the end of input interpretation.
  JMP         $1B9B6                    ; Jumps back to where it stopped in the original code.


; ORG         $FE430

                                        ; Block of code that handles the execution of Ti Kau Koun (Air).
  MOVEQ       #$0, D6                   ; Stores 0 inside D6, QCF input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE450                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$104, D7                 ; Stores 104 inside D7, New Move 1 ID (Air Ti Kau Koun).
  MOVEQ       #$32, D6                  ; Stores 32 inside D6, behavior 3 ID.
  BSR         $FF450                    ; Calls the code that calculates the move shift amount.
  ADD.W       D0, D7                    ; Adds D0 to D7, light version 104, strong version 105.
  ADD.W       D0, D6                    ; Adds D0 to D6, light version 32, strong version 33.
  JMP         $1BACA                    ; Jumps to the code that executes Air Ti Kau Koun.
  JMP         $1BB22                    ; Jumps to the end of input interpretation.


; ORG         $FE480

                                        ; Block of code that handles the execution of Pap So Cau II.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE4BC                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE4BC                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$10, D6                  ; Stores 10 inside D6, QCF-HCB input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE4BC                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$106, D7                 ; Stores 106 inside D7, New Move 1 ID (Pap So Cau II).
  MOVEQ       #$37, D6                  ; Stores 37 inside D6, behavior 3 ID.
  MOVE.W      #$000, ($1F0, A0)         ; Stores 000 inside ($1F0, A0), no custom translation speed.
  MOVE.W      #$9B04, ($1F2, A0)        ; Stores 9B04 inside ($1F2, A0), 2nd sound to be played.
  MOVE.W      #$9A0A, ($1F4, A0)        ; Stores 9A0A inside ($1F4, A0), 3rd sound to be played.
  CLR.W       ($1FC, A0)                ; Clears ($1FC, A0), default move code behavior (1A49A).
  JMP         $1BACA                    ; Jumps to the code that executes New Move 1.
  JMP         $1B9C4                    ; Jumps back to where it stopped in the original code.


; All routines for the readjusted version of Samchay.
; 
; 01B9C6:   Add Support To New Moves Inputs (Punch)
; 0FE400:   Add Support To New Moves Inputs (Air Kick)
; 0FE430:   Air Ti Kau Koun Interpretation
; 0FE480:   New Move 1 Interpretation (Pap So Cau II)