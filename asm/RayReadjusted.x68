*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Ray Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to the code of Ray McDougal.
*----------------------------------------------------------------------------------------------

; ORG         $1B2F6                    ; Replace 1B2F6 (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE000                    ; Jumps to the code that handles the interpretation of the new moves.
  TST.B       ($149, A0)                ; Compares 0 and ($149, A0), fireball flag.
  BNE         $1B32E                    ; If it is not 0, active fireball, go to the next move to interpret.
  MOVEQ       #$0, D6                   ; Code from the original game that was replaced.
  JSR         $166A8                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $1B33E                    ; Replace 1B33E (There is space to replace everything).

                                        ; Block of code that removes the old Thunder Dynamite Tackle execution.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.


; ORG         $1B39C                    ; Replace 1B39C (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE040                    ; Jumps to the code that handles the interpretation of the new moves.
  MOVEQ       #$5, D6                   ; Code from the original game readjusted.
  BSR         $166A8                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $FE000

                                        ; Block of code that handles the execution of Thunder Dynamite Tackle.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE020                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE020                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$D, D6                   ; Stores D inside D6, 2x QCB input ID.
  JSR         $166A8                    ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE020                    ; If it is not 0, the move wasn't executed, go to the last line.
  JMP         $1B370                    ; Jumps to the code that executes Thunder Dynamite Tackle.
  JMP         $1B2FC                    ; Jumps back to where it stopped in the original code.


; ORG         $FE040

                                        ; Block of code that handles the execution of Dynamite Rush.
  BTST        #$3, ($BF, A0)            ; Compares 0 and the 4th bit of ($BF + A0), 0 ground, 1 air.
  BNE         $FE066                    ; If the bit is not 0, it is on air, go to the last line.
  MOVEQ       #$8, D6                   ; Stores 8 inside D6, F-F input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE066                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$42, D7                  ; Stores 42 inside D7, New Move 1 ID (Dynamite Rush).
  MOVEQ       #$4, D6                   ; Stores 4 inside D6, behavior 3 ID.
  BSR         $FF450                    ; Calls the code that calculates the move shift amount.
  ADD.W       D0, D6                    ; Adds D0 to D6, light version 4, strong version 5.
  JMP         $1B3DA                    ; Jumps to the code that executes Dynamite Rush.
  JMP         $1B3A2                    ; Jumps back to where it stopped in the original code.


; All routines for the readjusted version of Ray.
; 
; 01B2F6:   Add Support To New Moves Inputs (Punch Button)
; 01B33E:   Removes Default Thunder Dynamite Tackle Execution
; 01B39C:   Add Support To New Moves Inputs (Kick Button)
; 0FE000:   New Thunder Dynamite Tackle Interpretation
; 0FE040:   New Move 1 Interpretation (Dynamite Rush)