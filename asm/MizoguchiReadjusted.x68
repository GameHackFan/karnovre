*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Mizoguchi Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to the code of Makoto Mizoguchi.
*----------------------------------------------------------------------------------------------

; ORG         $1BCAC                    ; Replace 1BCAC (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE600                    ; Jumps to the code that handles the interpretation of the new moves.
  MOVEQ       #$0, D6                   ; Code from the original game readjusted.
  BSR         $166A8                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $1BCBC                    ; Replace 1BCBC (There is space to replace everything).

                                        ; Block of code that removes the old Gottsui Tiger Bazooka execution.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.


; ORG         $1BD08                    ; Replace 1BD08 (There is space to replace everything).

                                        ; Block of code that removes the old Tsuutensai execution.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.


; ORG         $FE600

                                        ; Block of code that handles the execution of Gottsui Tiger Bazooka.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE620                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE620                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$C, D6                   ; Stores C inside D6, 2x QCF input ID.
  JSR         $166A8                    ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE620                    ; If it is not 0, the move wasn't executed, go to the last line.
  JMP         $1BCEC                    ; Jumps to the code that executes Gottsui Tiger Bazooka.
  JMP         $FE680                    ; Jumps to the code that handles the execution of other move.


; ORG         $FE680

                                        ; Block of code that handles the execution of Tsuutensai.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE6AE                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE6AE                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$D, D6                   ; Stores D inside D6, 2x QCB input ID.
  JSR         $166A8                    ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE6AE                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$800, ($1F0, A0)         ; Stores 800 inside ($1F0, A0), translation speed.
  CLR.L       ($1F2, A0)                ; Clears ($1F2, A0), no extra sound to play.
  CLR.W       ($1FC, A0)                ; Clears ($1FC, A0), default move code behavior (1A49A).
  JMP         $1BD38                    ; Jumps to the code that executes Tsuutensai.
  JMP         $1BCB2                    ; Jumps back to where it stopped in the original code.


; All routines for the readjusted version of Mizoguchi.
; 
; 01BCAC:   Add Support To New Moves Inputs
; 01BCBC:   Removes Default Gottsui Tiger Bazooka Execution
; 01BD08:   Removes Default Tsuutensai Execution
; 0FE300:   New Gottsui Tiger Bazooka Interpretation
; 0FE380:   New Tsuutensai Interpretation