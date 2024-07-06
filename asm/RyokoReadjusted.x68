*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Ryoko Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to the code of Ryoko Kano.
*----------------------------------------------------------------------------------------------

; ORG         $1B5C0                    ; Replace 1B5C0 (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JSR         $FE2E0                    ; Calls the code that clears Tateshihou Gatame cancel flag.
  TST.B       ($14D, A0)                ; Code from the original game readjusted.
  BNE         $1B774                    ; Code from the original game.
  MOVE.B      ($B1, A0), D7             ; Code from the original game.
  LSR.B       #$4, D7                   ; Code from the original game.
  BEQ         $1B774                    ; Code from the original game.
  MOVE.B      D7, D0                    ; Code from the original game.
  AND.B       #$3, D0                   ; Code from the original game.
  BEQ         $1B6AC                    ; Code from the original game.
  MOVEQ       #$2, D6                   ; Stores 8 inside D6, HCF input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.


; ORG         $1B650                    ; Replace 1B650 (There is space to replace everything).

                                        ; Block of code that handles the execution of Bakushin.
  BRA         $1B6AC                    ; Jumps to the code that handles the interpretation of kick button moves.
  CMP.W       #$5, ($D0, A0)            ; Compares 5 and ($D0, A0), move ID.
  BHI         $1B6C6                    ; If it is bigger than 5, can't execute this move, go to the next move.
  MOVEQ       #$8, D6                   ; Stores 8 inside D6, F-F input ID.
  BSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $1B6C6                    ; If it is not 0, the move wasn't executed, go to the next move.
  MOVE.W      #$A8, D7                  ; Stores A8 inside D7, New Move 1 ID (Bakushin).
  MOVEQ       #$25, D6                  ; Stores 25 inside D6, behavior 3 ID.
  JSR         $FF450                    ; Calls the code that calculates the move shift amount.
  ADD.W       D0, D6                    ; Adds D0 to D6, light 25, strong 26.
  BRA         $1B64C                    ; Jumps to the code that executes Bakushin.


; ORG         $1B6C0                    ; Replace 1B6C0 (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE200                    ; Jumps to the code that handles the interpretation of the new moves.
  MOVEQ       #$6, D6                   ; Code from the original game readjusted.
  MOVEQ       #$28, D5                  ; Code from the original game readjusted.
  BSR         $166FC                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $FE200

                                        ; Block of code that prepares the execution of Tateshihou Gatame.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE23E                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE23E                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$E, D6                   ; Stores E inside D6, 2x HCF input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BEQ         $FE226                    ; If it is 0, the move was executed, ignore the 4 lines below.
  MOVEQ       #$F, D6                   ; Stores F inside D6, 2x HCB input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE23E                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.B      #$5A, ($14F, A0)          ; Stores 5A inside ($14F + A0), grab range.
  MOVE.B      ($B1, A0), D2             ; Stores ($B1 + A0) inside D2, buttons pressed.
  NOP                                   ; No operation, does nothing.
  JSR         $163C8                    ; Calls the code that handles grappling moves.
  JMP         $1B71C                    ; Jumps to the code that executes Tateshihou Gatame.
  JMP         $1B652                    ; Jumps to the code that handles the execution of other move.


; ORG         $FE260

                                        ; Block of code that handles the initial execution of Tateshihou Gatame.
  BSR         $FF340                    ; Calls the code that stores the opponent memory region in A1.
  MOVE.W      ($D0, A0), D0             ; Stores ($D0 + A0) inside D0, the current move ID.
  CMP.W       #$95, D0                  ; Compares 95 and D0, Tomoenage ID.
  BNE         $FE284                    ; If it is not 95, not Tomoenage, go to the BTST line.
  TST.B       ($1E0, A0)                ; Compares 0 and ($1E0, A0), Tateshihou Gatame flag.
  BEQ         $FE284                    ; If it is 0, didn't execute Tateshihou Gatame, go to the BTST line.
  CMP.W       #$2, ($120, A0)           ; Compares 2 and ($120, A0), the current animation and duration.
  BHI         $FE284                    ; If it is bigger than 2, don't change move, go to the BTST line.
  JSR         $1B674                    ; Calls the code that handles the execution of Tateshihou Gatame.
  BRA         $FE2C6                    ; Jumps to the last JMP line of code (1ACA4).
  BTST        #$0, ($BF, A0)            ; Compares 0 and the 1st bit of ($BF + A0).
  BNE         $FE2C6                    ; If it is not 0, go to the last JMP line (1ACA4).
  MOVE.B      ($14F, A0), D0            ; Stores ($14F + A0) inside D0, behavior 3 ID.
  BEQ         $FE2C0                    ; If it D0 is 0, go to the 3rd JMP line (1B1DE).
  CMP.B       #$5A, D0                  ; Compares 2A and D0, Tateshihou Gatame range.
  BNE         $FE2BA                    ; If it is not 2A, not Tateshihou Gatame, go to the 2nd JMP line (1B11C).
  MOVE.W      #$95, ($D0, A0)           ; Stores 95 inside ($D0 + A0), Tateshihou Gatame ID.
  MOVE.B      #$1A, ($12D, A0)          ; Stores 1A inside ($D0 + A0), behavior 3 ID.
  MOVE.B      #$1, ($1FF, A0)           ; Stores 1 inside ($1FF, A0), DM executed flag active.
  MOVE.B      #$1, ($1E0, A0)           ; Stores 1 inside ($1E0, A0), Tateshihou Gatame cancel flag active.
  BSR         $FF360                    ; Calls the code that sets grab moves necessary flags.
  JMP         $1AC1E                    ; Jumps to the code that handles the execution of other move.
  JMP         $1B11C                    ; Jumps to the code that handles the execution of other move.
  JMP         $1B1DE                    ; Jumps to the code that handles the execution of other move.
  JMP         $1ACA4                    ; Jumps to the code that handles the execution of other move.


; ORG         $FE2E0


  CMP.W       #$95, ($D0, A0)           ; Compares 95 and ($D0 + A0), Tomoenage ID.
  BEQ         $FE2EC                    ; If it is not 95, ignore the line below.
  CLR.B       ($1E0, A0)                ; Clears ($1E0, A0), Tateshihou Gatame cancel flag.
  RTS                                   ; Returns back to the routine that called this code.


; All routines for the readjusted version of Ryoko.
; 
; 01B5C0:   Add Support To Clear Flag Code
; 01B650:   New Move 1 Interpretation (Bakushin)
; 01B6C0:   Add Support To New Moves Inputs
; 0FE200:   Prepares The Execution Of Tateshihou Gatame
; 0FE260:   Handles The Initial Execution Of Tateshihou Gatame
; 0FE2E0:   Clears Tateshihou Gatame Cancel Flag