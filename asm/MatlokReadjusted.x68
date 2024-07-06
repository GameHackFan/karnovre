*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Matlok Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to the code of Matlok Jade.
*----------------------------------------------------------------------------------------------

; ORG         $1B79E                    ; Replace 1B79E (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE380                    ; Jumps to the code that handles the interpretation of the new moves.
  TST.B       ($149, A0)                ; Compares 0 and ($149, A0), fireball flag.
  BNE         $1B7DA                    ; If it is not 0, active fireball, go to the next move to interpret.
  MOVEQ       #$6, D6                   ; Code from the original game readjusted.
  MOVEQ       #$28, D5                  ; Code from the original game readjusted.
  JSR         $166FC                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $1B7F6                    ; Replace 1B7F6 (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE340                    ; Jumps to the code that handles the interpretation of the new moves.
  LEA         $16488.L, A1              ; Code from the original game that was replaced.
  MOVE.B      ($B1,A0), D0              ; Code from the original game.
  LSR.B       #4, D0                    ; Code from the original game.
  ANDI.W      #$0C, D0                  ; Code from the original game.


; ORG         $FE300

                                        ; Block of code that handles the execution of Walkover Kick.
  MOVEQ       #$7, D6                   ; Stores 7 inside D6, D-U input ID.
  MOVEQ       #$28, D5                  ; Stores 28 inside D5, 40 frames of charge.
  JSR         $166FC.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE328                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$D4, D7                  ; Stores D4 inside D7, New Move 1 ID (Walkover Kick).
  MOVEQ       #$37, D6                  ; Stores 27 inside D6, behavior 3 ID.
  MOVE.W      #$900, ($1F0, A0)         ; Stores 900 inside ($1F0, A0), translation speed.
  CLR.L       ($1F2, A0)                ; Clears ($1F2, A0), no extra sound to play.
  CLR.W       ($1FC, A0)                ; Clears ($1FC, A0), default move code behavior (1A49A).
  JMP         $1B93E                    ; Jumps to the code that executes Walkover Kick.
  JMP         $1B7A4                    ; Jumps back to where it stopped in the original code.


; ORG         $FE340

                                        ; Block of code that handles the execution of Loop Hurricane.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE366                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE366                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$9, D6                   ; Stores 9 inside D6, D-F-UF input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE366                    ; If it is not 0, the move wasn't executed, go to the last line.
  LEA         $16488.L, A1              ; Code from the original game that was replaced.
  JMP         $1B822                    ; Jumps to the code that executes Loop Hurricane.
  JMP         $1B7FC                    ; Jumps back to where it stopped in the original code.


; ORG         $FE380

                                        ; Block of code that handles the execution of Loop Walkover Kick.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE3C2                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE3C2                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$7, D6                   ; Stores 7 inside D6, D-U input ID.
  MOVEQ       #$28, D5                  ; Stores 28 inside D5, 40 frames of charge.
  JSR         $166FC.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE3C2                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVEQ       #$9, D6                   ; Stores 9 inside D6, D-F-UF input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE3C2                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$D6, D7                  ; Stores D6 inside D7, New Move 2 ID (Loop Walkover Kick).
  MOVEQ       #$37, D6                  ; Stores 37 inside D6, behavior 3 ID.
  MOVE.W      #$900, ($1F0, A0)         ; Stores 900 inside ($1F0, A0), translation speed.
  CLR.L       ($1F2, A0)                ; Clears ($1F2, A0), no extra sound to play.
  CLR.W       ($1FC, A0)                ; Clears ($1FC, A0), default move code behavior (1A49A).
  JMP         $1B93E                    ; Jumps to the code that executes Loop Walkover Kick.
  JMP         $FE300                    ; Jumps to the code that handles the execution of other move.


; ORG         $FE3E0

                                        ; Block of code that adds extra translation to moves the player can control.
  MOVEQ       #$3, D0                   ; Stores 3 inside D0, the extra translation speed.
  SWAP        D0                        ; Invert D0 higher and lower bits, 3 to 30000.
  JSR         $1A7F0                    ; Calls the code that applies the extra translation.
  JMP         $1A5B8                    ; Jumps to the code that executes the move.


; All routines for the readjusted version of Matlok.
; 
; 01B79E:   Add Support To New Moves Inputs
; 0FE300:   New Move 1 Interpretation (Walkover Kick)
; 0FE340:   New Loop Hurricane Interpretation
; 0FE380:   New Move 2 Interpretation (Loop Walkover Kick)
; 0FE3E0:   Adds Better Player Control To Some Moves (Dancing Head Press)