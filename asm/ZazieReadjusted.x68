*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Zazie Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to the code of Zazie Muhaba.
*----------------------------------------------------------------------------------------------

; ORG         $1C4A6                    ; Replace 1C4A6 (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FEA00                    ; Jumps to the code that handles the interpretation of the new moves.
  MOVEQ       #$7, D6                   ; Code from the original game readjusted.
  BSR         $166A8                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $FEA00

                                        ; Block of code that handles the execution of Hell Deshi Kakato.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FEA3C                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FEA3C                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$10, D6                  ; Stores 10 inside D6, QCF-HCB input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FEA3C                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$224, D7                 ; Stores 224 inside D7, New Move 2 ID (Hell Deshi Kakato).
  MOVEQ       #$36, D6                  ; Stores 36 inside D6, behavior 3 ID.
  MOVE.W      #$600, ($1F0, A0)         ; Stores 600 inside ($1F0, A0), translation speed.
  MOVE.W      #$A611, ($1F2, A0)        ; Stores A611 inside ($1F2, A0), 2nd sound to be played.
  MOVE.W      #$A61B, ($1F4, A0)        ; Stores A61B inside ($1F4, A0), 3rd sound to be played.
  CLR.W       ($1FC, A0)                ; Clears ($1FC, A0), default move code behavior (1A49A).
  JMP         $1C55E                    ; Jumps to the code that executes Hell Deshi Kakato.
  JMP         $1C4AC                    ; Jumps back to where it stopped in the original code.


; All routines for the readjusted version of Zazie.
; 
; 01C4A6:   Add Support To New Moves Inputs
; 0FEA00:   New Move 1 Interpretation (Hell Deshi Kakato)