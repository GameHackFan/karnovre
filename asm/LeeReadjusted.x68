*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Lee Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to the code of Lee Diendou.
*----------------------------------------------------------------------------------------------

; ORG         $1BB38                    ; Replace 1BB38 (There is space to replace everything).

                                        ; Block of code that removes air execution restriction to kick button moves.
  MOVE.B      D7, D0                    ; Stores D7 inside D0, current inputs.
  AND.W       #$3, D0                   ; D0 and 3, both punch buttons.
  BEQ         $1BC12                    ; If the D0 is 0, no punch pressed, go to the kick moves interpretation.
  BTST        #$3, ($BF, A0)            ; Compares 0 and the 4th bit of ($BF + A0), 0 ground, 1 air.
  BNE         $1BC12                    ; If the bit is not 0, it is on air, go to the kick moves interpretation.


; ORG         $1BBEA                    ; Replace 1BBEA (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE570                    ; Jumps to the code that handles the interpretation of the new moves.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.


; ORG         $1BC1C                    ; Replace 1BC1C (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE500                    ; Jumps to the code that handles the interpretation of the new moves.
  MOVEQ       #$4, D6                   ; Code from the original game readjusted.
  BSR         $166A8                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $FE500

                                        ; Block of code that checks what kick moves should be interpreted.
  BTST        #$3, ($BF, A0)            ; Compares 0 and the 4th bit of ($BF + A0), 0 ground, 1 air.
  BNE         $FE50E                    ; If the bit is not 0, it is on air, go to the last line.
  JMP         $FE5C0                    ; Jumps to the code that handles the interpretation of the new moves on ground.
  JMP         $FE530                    ; Jumps to the code that handles the interpretation of the new moves on air.


; ORG         $FE530

                                        ; Block of code that handles the execution of Long Ti.
  MOVEQ       #$1, D6                   ; Stores 1 inside D6, QCB input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE54E                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$132, D7                 ; Stores 132 inside D7, New Move 1 ID (Long Ti).
  MOVEQ       #$25, D6                  ; Stores 25 inside D6, behavior 3 ID.
  BSR         $FF450                    ; Calls the code that calculates the move shift amount.
  ADD.W       D0, D6                    ; Adds D0 to D6, light version 25, strong version 26.
  JMP         $1BC50                    ; Jumps to the code that executes Long Ti.
  JMP         $1BC82                    ; Jumps to the end of interpretation of moves.


; ORG         $FE570

                                        ; Block of code that handles the execution of Mouko Kouhazan.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE584                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE584                    ; If it is not 0, DM was already used, go to the last line.
  JMP         $1BBF6                    ; Jumps to the code that executes Mouko Kouhazan.
  JMP         $1BC12                    ; Jumps back to where it stopped in the original code.


; ORG         $FE5A0

                                        ; Block of code that handles the execution of Chou Shinchuu Tetsuzankou.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE5DA                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE5DA                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$D, D6                   ; Stores D inside D6, 2x QCB input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE5DA                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$130, D7                 ; Stores 130 inside D7, New Move 1 ID (Chou Shinchuu Tetsuzankou).
  MOVEQ       #$36, D6                  ; Stores 36 inside D6, behavior 3 ID.
  MOVE.W      #$600, ($1F0, A0)         ; Stores 600 inside ($1F0, A0), translation speed ID.
  MOVE.W      #$A005, ($1F2, A0)        ; Stores A005 inside ($1F2, A0), 2nd sound to be played.
  CLR.W       ($1F4, A0)                ; Clears ($1F4, A0), no extra sound to play.
  CLR.W       ($1FC, A0)                ; Clears ($1FC, A0), default move code behavior (1A49A).
  JMP         $1BC50                    ; Jumps to the code that executes Chou Shinchuu Tetsuzankou.
  JMP         $1BC22                    ; Jumps back to where it stopped in the original code.


; All routines for the readjusted version of Lee.
; 
; 01BB38:   Removes Air Execution Restriction (Kick Button) 
; 01BBEA:   Add Support To New Moves Inputs (Punch Button)
; 01BC1C:   Add Support To New Moves Inputs (Kick Button)
; 0FE500:   Handles Ground And Air Move Interpretation
; 0FE530:   New Move 1 Interpretation (Long Ti)
; 0FE570:   New Mouko Kouhazan Interpretation
; 0FE5A0:   New Move 2 Interpretation (Chou Shinchuu Tetsuzankou)