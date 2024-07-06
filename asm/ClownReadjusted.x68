*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Clown Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  All changes made to Clown.
*----------------------------------------------------------------------------------------------

; ORG         $1C5E0                    ; Replace 1C5E0 (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FEB80                    ; Jumps to the code that handles the interpretation of the new moves.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.


; ORG         $1C674                    ; Replace 1C674 (There is space to replace everything).

                                        ; Block of code that adds the interpretation of the new moves.
  JMP         $FEB00                    ; Jumps to the code that handles the interpretation of the new moves.
  MOVEQ       #$6, D6                   ; Code from the original game readjusted.
  MOVEQ       #$28, D5                  ; Code from the original game readjusted.
  BSR         $166FC                    ; Code from the original game readjusted.
  TST.L       D6                        ; Code from the original game readjusted.


; ORG         $FEB00

                                        ; Block of code that handles the execution of Spin Kick.
  CMP.B       #$7F, ($147, A0)          ; Compares 7F and ($147 + A0), the character HP.
  BHI         $FEB34                    ; If it is higher than 7F, has at least 50% HP, go to the last line.
  TST.B       ($1FF, A0)                ; Compares 0 and ($1FF + A0), if a DM was executed already.
  BNE         $FEB34                    ; If it is not 0, DM was already used, go to the last line.
  MOVEQ       #$C, D6                   ; Stores C inside D6, 2xQCF input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FEB34                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$254, D7                 ; Stores 254 inside D7, New Move 2 ID (Spin Kick).
  MOVEQ       #$37, D6                  ; Stores 37 inside D6, behavior 3 ID.
  MOVE.W      #$700, ($1F0, A0)         ; Stores 700 inside ($1F0, A0), translation speed.
  CLR.L       ($1F2, A0)                ; Clears ($1F2, A0), no extra sound to play.
  CLR.W       ($1FC, A0)                ; Clears ($1FC, A0), default move code behavior (1A49A).
  JMP         $1C6EE                    ; Jumps to the code that executes Spin Kick.
  JMP         $1C67A                    ; Jumps back to where it stopped in the original code.


; ORG         $FEB80

                                        ; Block of code that handles the execution of Pick-A-Fake-Card.
  MOVEQ       #$1, D6                   ; Stores 1 inside D6, QCB input ID.
  JSR         $166A8.L                  ; Calls the routine that interprets the move execution.
  TST.L       D6                        ; Compares 0 and D6.
  BNE         $FEB98                    ; If it is not 0, the move wasn't executed, go to the last line.
  MOVE.W      #$256, D7                 ; Stores 256 inside D7, New Move 1 ID (Pick-A-Fake-Card).
  MOVEQ       #$36, D6                  ; Stores 36 inside D6, behavior 3 ID.
  JMP         $1C6EE                    ; Jumps to the code that executes Pick-A-Fake-Card.
  JMP         $1C5F0                    ; Jumps back to where it stopped in the original code.


; ORG         $FEBC0

                                        ; Block of code that handles the execution of Tricked.
  CMP.B       #$3, ($120, A0)           ; Compares 3 and ($120 + A0), current animation index
  BHI         $FEBE0                    ; If it is bigger than 3, can't execute Tricked, go to the last line.
  MOVE.B      ($B1, A0), D0             ; Stores ($B1 + A0) inside D0, buttons pressed.
  AND.W       #$00C0, D0                ; D0 and C0, both kick buttons.
  BEQ         $FEBE0                    ; If it is 0, didn't press a kick button, go to the last line.
  LSR.B       #4, D0                    ; Shifts right D0 bits by 4, buttons as the right digit.
  NEG.B       D0                        ; Inverts D0 polarity, 4 to FB, 8 to F7, 6 to F3.
  ADDQ.B      #$1, D0                   ; Adds 1 to D0, FB to FC, F7 to F8, F3 to F4.
  MOVE.B      D0, ($130, A0)            ; Stores D0 inside ($130 + A0), applies a negative motion.
  MOVE.B      D0, ($132, A0)            ; Stores D0 inside ($132 + A0), applies a negative motion.
  JMP         $1A814                    ; Jumps to the code that executes the move.


; All routines for the readjusted version of Clown.
; 
; 01C5E0: Add Support To New Moves Inputs (Punch Button)
; 01C674: Add Support To New Moves Inputs (Kick Button)
; 0FEB00: New Move 3 Interpretation (Loop Spin Kick)
; 0FEB80: New Move 1 Interpretation (Pick-A-Fake-Card)
; 0FEBC0: New Move 2 Execution (Tricked)