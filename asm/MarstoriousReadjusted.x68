*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Marstorius Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to the code of Marstorius.
*----------------------------------------------------------------------------------------------


; ORG         $1C0D4                    ; Replace 1C0D4 (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FE800                    ; Jumps to the code that handles the interpretation of the new moves.
  MOVEQ       #$1, D6                   ; Stores 1 inside D6, Kneel Kick as QCB input.
  JSR         $166A8                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.
  BNE         $1C10A                    ; Code from the original game readjusted.


  JMP         $FE800                    ; Replace 1C0E6.

; ORG         $FE800

                                        ; Block of code that handles the execution of Triple Dash Lariat.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FE842                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if the player used the DM already.
  BNE         $FE842                    ; If it is not 0, DM was already used, go to the last line.
  NOP                                   ; No operation, does nothing.
  MOVEQ       #$C, D6                   ; Stores C inside D6, 2xQCF input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FE842                    ; If it is not 0, the move wasn't executed, go to the last line.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  MOVE.W      #$1CA, D7                 ; Stores 1CA inside D7, New Move 1 ID (Triple Dash Lariat).
  MOVEQ       #$36, D6                  ; Stores 36 inside D6, behavior 3 ID.
  MOVE.W      #$800, ($1F0, A0)         ; Stores 800 inside ($1F0, A0), translation speed.
  CLR.L       ($1F2, A0)                ; Clears ($1F2, A0), no extra sound to play.
  CLR.W       ($1FC, A0)                ; Clears ($1FC, A0), default move code behavior (1A49A).
  JMP         $1C19A                    ; Jumps to the code that executes Triple Dash Lariat.
  JMP         $1C0DA                    ; Jumps back to where it stopped in the original code.


; ORG         $FE880

                                        ; Block of code that modifies Moonsault Press translation.
  TST.W       ($120, A0)                ; Compares 0 and ($120 + A0), current animation and duration.
  BNE         $FE8A0                    ; If it is not 0, go to the last line line.
  CMP.W       #$800, ($138, A0)         ; Compares 800 and ($138 + A0), 800 light version, 940 strong version.
  BNE         $FE898                    ; If it is not 800, go to the line before the last line.
  MOVE.L      #$03000300, ($130, A0)    ; Stores 3000300 inside ($130 + A0), light version translation speed.
  BRA         $FE8A0                    ; Jump to the last line.
  MOVE.L      #$04000400, ($130, A0)    ; Stores 4000400 inside ($130 + A0), strong version translation speed.
  JMP         $1A5B8                    ; Jumps to the code that executes Moonsault Press.


; All routines for the readjusted version of Marstorius.
; 
; 01C0D4:   Add Support To New Moves Inputs
; 0FE800:   New Move 1 Interpretation (Triple Dash Lariat)
; 0FE880:   Changes Moonsault Press Translation Speed