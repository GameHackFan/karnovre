*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Yungmie Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to the code of Liu Yungmie.
*----------------------------------------------------------------------------------------------

; ORG         $1C2EE                    ; Replace 1C2EE (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE940                    ; Jumps to the code that handles the interpretation of the new moves.
  MOVEQ       #$4, D6                   ; Code from the original game readjusted.
  BSR         $166A8.L                  ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $FE900

                                        ; Block of code that interprets Foot Rush.
  MOVEQ       #$1, D6                   ; Stores 1 inside D6, QCB input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE918                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$1EC, D7                 ; Stores 1EC inside D7, New Move 1 ID (Foot Rush).
  MOVEQ       #$36, D6                  ; Stores 36 inside D6, behavior 3 ID.
  JMP         $1C358                    ; Jumps to the code that executes Foot Rush.
  JMP         $1C2F4                    ; Jumps back to where it stopped in the original code.


; ORG         $FE940

                                        ; Block of code that interprets Grand Foot Rush.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE966                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE966                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$11, D6                  ; Stores 11 inside D6, QCB-HCF input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE966                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$1EE, D7                 ; Stores 1EE inside D7, New Move 2 ID (Grand Foot Rush).
  MOVEQ       #$36, D6                  ; Stores 5B inside D6, behavior 3 ID.
  JMP         $1C358                    ; Jumps to the code that executes Grand Foot Rush.
  JMP         $FE900                    ; Jumps to the code that handles the execution of other move.


; ORG         $FE980

                                        ; Block of code that sets the Foot Rush behavior values.
  TST.W       ($120, A0)                ; Compares 0 and ($120 + A0), current animation and duration.
  BNE         $FE99A                    ; If it is not 0, go to the line before the last line.
  MOVE.W      #$500, ($1F0, A0)         ; Stores 500 inside ($1F0, A0), translation speed.
  MOVE.W      #$B905, ($1F2, A0)        ; Stores B905 inside ($1F2, A0), 2nd sound to be played.
  CLR.W       ($1F4, A0)                ; Clears ($1F4, A0), no 3rd extra sound to play.
  CLR.W       ($1FC, A0)                ; Clears ($1FC, A0), default move code behavior (1A49A).
  JMP         $FF006                    ; Jumps to the code that executes Foot Rush.


; ORG         $FE9C0

                                        ; Block of code that sets the Grand Foot Rush behavior values.
  TST.W       ($120, A0)                ; Compares 0 and ($120 + A0), current animation and duration.
  BNE         $FE9DC                    ; If it is not 0, go to the line before the last line.
  MOVE.W      #$600, ($1F0, A0)         ; Stores 900 inside ($1F0, A0), translation speed.
  MOVE.W      #$B708, ($1F2, A0)        ; Stores B708 inside ($1F2, A0), 2nd sound to be played.
  MOVE.W      #$B80F, ($1F4, A0)        ; Stores B80F inside ($1F4, A0), 3rd sound to be played.
  CLR.W       ($1FC, A0)                ; Clears ($1FC, A0), default move code behavior (1A49A).
  JMP         $FF000                    ; Jumps to the code that executes Grand Foot Rush.


; All routines for the readjusted version of Liu Yungmie.
; 
; 01C2EE:   Add Support To New Moves Inputs
; 0FE900:   New Move 1 Interpretation (Foot Rush)
; 0FE980:   New Move 2 Interpretation (Grand Foot Rush)