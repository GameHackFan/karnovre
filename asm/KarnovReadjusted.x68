*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Karnov Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to Karnov.
*----------------------------------------------------------------------------------------------

; ORG         $1C7E2                    ; Replace 1C7E2 (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FEC50                    ; Jumps to the code that handles the interpretation of the new moves.
  MOVEQ       #$6, D6                   ; Stores 6 inside D6, B-F input ID.
  MOVEQ       #$28, D5                  ; Stores 28 inside D5, 40 frames of charge.
  BSR         $166FC                    ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $FEC00

                                        ; Block of code that handles the execution of Glitch.
  MOVEQ       #$4, D6                   ; Stores 4 inside D6, DP input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FEC10                    ; If it is not 0, the move wasn't executed, ignore the 2 lines below.
  MOVEQ       #$36, D6                  ; Stores 36 inside D6, behavior 3 ID.
  BRA         $FEC1E                    ; ignores the 5 lines below, go to MOVE.W line.
  MOVEQ       #$5, D6                   ; Stores 5 inside D6, RDP input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FEC32                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVEQ       #$38, D6                  ; Stores 38 inside D6, behavior 3 ID.
  MOVE.W      #$284, D7                 ; Stores 284 inside D7, New Move 1 ID (Glitch).
  BSR         $FF450                    ; Calls the code that calculates the move shift amount.
  ADD.W       D0, D6                    ; Adds D0 to D6, 36 / 37 / 38 / 39.
  MOVE.W      D6, ($1E0, A0)            ; Stores D0 inside ($1E0 + A0), Glitch ID.
  JMP         $1C908                    ; Jumps to the code that executes Super 100 Attack.
  JMP         $1C7E8                    ; Jumps back to where it stopped in the original code.


; ORG         $FEC50

                                        ; Block of code that handles the execution of Super 100 Attack.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FEC76                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FEC76                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$11, D6                  ; Stores 11 inside D6, QCB-HCF input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FEC76                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$286, D7                 ; Stores 284 inside D7, New Move 2 ID (Super 100 Attack).
  MOVEQ       #$36, D6                  ; Stores 36 inside D6, behavior 3 ID.
  JMP         $1C908                    ; Jumps to the code that executes Super 100 Attack.
  JMP         $FEC00                    ; Jumps back to where it stopped in the original code.


; ORG         $FEC90

                                        ; Block of code that sets the Glitch behavior values.
  MOVE.W      ($1E0, A0), D0            ; Stores ($1E0 + A0) inside D0, translation speed ID.
  BEQ         $FECAE                    ; If it is 0, go to the last line.
  TST.W       ($120, A0)                ; Compares 0 and ($120 + A0), current animation and duration.
  BNE         $FECAE                    ; If it is not 0, go to the last line.
  SUB.W       #$36, D0                  ; Subtracts 36 from D0, 36 to 0, 37 to 1, etc.
  ADD.W       D0, D0                    ; Adds D0 to D0, data is 2 bytes.
  MOVE.W      ($14, PC, D0.W), D0       ; Stores ($14 + PC + D0.W) inside D0, the translation speed.
  MOVE.W      D0, ($130, A0)            ; Stores D0 inside ($130 + A0), set the translation speed.
  CLR.W       ($1E0, A0)                ; Clears ($1E0 + A0).
  JMP         $1A49A                    ; Jumps to the code that executes Glitch.


; ORG         $FECD0

                                        ; Block of code that sets the Super 100 Attack behavior values.
  MOVE.B      #$1, ($1FF, A0)           ; Stores 1 inside ($1FF, A0), DM executed flag active.
  CMP.W       #$7, ($120, A0)           ; Compares 7 and ($120 + A0), current animation and duration.
  BNE         $FECE4                    ; If it is not 7, ignore the line below.
  MOVE.W      #$A, ($130, A0)           ; Stores A inside ($1F0, A0), translation speed.
  JMP         $1A49A                    ; Jumps to the code that executes Super 100 Attack.


; All routines for the readjusted version of Karnov.
; 
; 01C7E2:   Add Support To New Moves Inputs
; 0FEC00:   New Move 1 Interpretation (Glitch)
; 0FEC50:   New Move 2 Interpretation (Super 100 Attack)
; 0FEC90:   Sets Glitch Behavior Values
; 0FECD0:   Sets Super 100 Attack Behavior Values