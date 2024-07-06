*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Jean Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to Jean Pierre.
*----------------------------------------------------------------------------------------------

; ORG         $1BE14                    ; Replace 1BE14 (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE700                    ; Jumps to the code that handles the interpretation of the new moves.
  TST.B       ($149, A0)                ; Compares 0 and ($149, A0), fireball flag.
  BNE         $1BE50                    ; If it is not 0, active fireball, go to the next move to interpret.
  MOVEQ       #$6, D6                   ; Code from the original game readjusted.
  MOVEQ       #$28, D5                  ; Code from the original game readjusted.
  JSR         $166FC                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $1BF02                    ; Replace 1BF02 (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE780                    ; Jumps to the code that handles the interpretation of the new moves.
  MOVEQ       #$6, D6                   ; Code from the original game readjusted.
  MOVEQ       #$28, D5                  ; Code from the original game readjusted.
  BSR         $166FC                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $1BF16                    ; Replace 1BF16 (There is space to replace everything).

                                        ; Block of code that forces the execution of new Rondat.
  JMP         $FE7A8                    ; Jumps to the code that executes the new Rondat.


; ORG         $FE700

                                        ; Block of code that handles the execution of Backflip.
  MOVEQ       #$1, D6                   ; Stores 1 inside D6, QCB input ID.
  NOP                                   ; No operation, does nothing.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE722                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$192, D7                 ; Stores 192 inside D7, New Move 1 ID (Backflip).
  MOVE.W      #$A9, D6                  ; Stores A9 inside D6, behavior 3 ID.
  BSR         $FF450                    ; Calls the code that calculates the move shift amount.
  MOVE.B      D0, ($1E0, A0)            ; Stores D0 inside ($1E0 + A0), Backflip ID.
  JMP         $1BF7C                    ; Jumps to the code that executes Backflip.
  JMP         $1BE1A                    ; Jumps back to where it stopped in the original code.


; ORG         $FE740

                                        ; Block of code that handles the execution of Rondat.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE77A                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE77A                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$6, D6                   ; Stores 6 inside D6, B-F input ID.
  MOVEQ       #$28, D5                  ; Stores 28 inside D5, 40 frames of charge.
  JSR         $166FC.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE77A                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVEQ       #$0, D6                   ; Stores 0 inside D6, QCF input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE77A                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$194, D7                 ; Stores 194 inside D7, New Rondat ID.
  MOVEQ       #$6, D6                   ; Stores 6 inside D6, behavior 3 ID.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  JMP         $1BF7C                    ; Jumps to the code that executes Rondat.
  JMP         $1BF30                    ; Jumps back to where it stopped in the original code.


; ORG         $FE7A0

                                        ; Block of code that fixes Rondat Behavior.
  TST.W       ($120, A0)                ; Compares 0 and ($120 + A0), current animation and duration.
  BNE         $FE7B6                    ; If it is not 0, go to the last line of code line.
  TST.B       ($1E0, A0)                ; Compares 0 and ($1E0 + A0), light version.
  BEQ         $FE7B6                    ; If it is 0, don't change anything, go to the last line.
  MOVE.W      #$600, ($130, A0)         ; Stores 600 inside ($130 + A0), translation speed.
  CLR.W       ($1E0, A0)                ; Clears ($1E0 + A0).
  JMP         $1A5B8                    ; Jumps to the code that handles the move.


; All routines for the readjusted version of Jean.
; 
; 01BE14:   Add Support To New Moves Inputs (Punch Button)
; 01BF02:   Add Support To New Moves Inputs (Kick Button)
; 01BF16:   Force The Execution Of New Rondat
; 0FE700:   New Move 1 Interpretation (Backflip)
; 0FE780:   New Rondat Interpretation
; 0FE7A0:   Fixes Backflip Translation Speed