*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Game Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  It contains several routines to fix the behavior of
*               the characters' moves, extra features added to the
*               game, and bug fixes.
*----------------------------------------------------------------------------------------------

  JSR         $FDB00                    ; Replace 9492.

; ORG         $FDB00

                                        ; Block of code that handles drawing extra things.
  BSR         $FDB50                    ; Calls the code that handles drawing the super indicator.
  BSR         $FDD00                    ; Calls the code that handles drawing the hit counter.
  MOVE.W      D0, $106940.L             ; Code from the original game that was replaced.
  RTS                                   ; Returns back to the routine that called this code.


  JSR         $FDB20                    ; Replace 3BDC.

; ORG         $FDB20

                                        ; Block of code that readjusts any damage above 5F to 20.
  MOVE.L      (A1, D4.W), ($11C, A0)    ; Stores (A1 + D4.W) inside ($11C + A0), the opponent attack data.
  MOVE.B      ($11E, A0), D2            ; Stores ($11E + A0) inside D2, the attack damage.
  AND.W       #$7F, D2                  ; 7F and D2, valid damage taken in this game is 0 to 7F.
  CMP.W       #$60, D2                  ; Compares 60 and D2, new maximum tolerated damage is 5F.
  BLT         $FDB3A                    ; If it is smaller, ignore the line below.
  MOVE.B      #$20, ($11E, A0)          ; Stores 20 inside ($11E + A0), default damage value as 20.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $FDB50

                                        ; Block of code that draws the super indicator.
  TST.B       ($103A72)                 ; Compares 0 and ($103A72), round status flag.
  BNE         $FDB8E                    ; If it is not 0, round is stopped, go to the RTS line.
  MOVEM.L     D0-D4/A1-A4, -(A7)        ; Stores D0 to D4 and A1 to A4 inside -(A7), save their values.
  LEA         $101420, A1               ; Stores 101420 inside A1, the print sprite memory region.
  LEA         $45BE.L, A2               ; Stores 45BE inside A2, the list of character names.
  MOVE.L      (A1), A4                  ; Stores (A1) inside A4, the empty sprite memory region.
  MOVE.W      ($10FE8A), D0             ; Stores ($10FE8A) inside D0, frames passed.
  AND.W       #$8, D0                   ; D0 and 8, the result is 0 or 8, blink effect data.
  LEA         ($2250, A1), A3           ; Stores ($2250 + A1) inside A3, P1 memory region.
  MOVE.W      #$7046, D1                ; Stores 7046 inside D1, P1 character name screen position.
  BSR         $FDB96                    ; Calls the code that draws the character name blinking.
  LEA         ($2450, A1), A3           ; Stores ($2450 + A1) inside A3, P2 memory region.
  MOVE.W      #$72C6, D1                ; Stores 72C6 inside D1, P2 character name screen position.
  BSR         $FDB96                    ; Calls the code that draws the character name blinking.
  MOVE.L      A4, (A1)                  ; Stores A4 inside (A1), the next empty sprite region.
  MOVEM.L     (A7)+, D0-D4/A1-A4        ; Stores (A7)+ inside D0 to D4 and A1 to A4, restore their values.
  RTS                                   ; Returns back to the routine that called this code.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  RTS                                   ; Returns back to the routine that called this code.

                                        ; Block of code that prints the character name with blink effect.
  CMP.B       #$7F, ($147, A3)          ; Compares 7F and ($147 + A3), the character HP.
  BHI         $FDBDE                    ; If it is higher than 7F, has at least 50% HP, go to the RTS line.
  TST.B       ($1FF, A3)                ; Compares 0 and ($1FF + A3), if a DM was executed already.
  BNE         $FDBDE                    ; If it is not 0, DM was already used, go to the RTS line.
  MOVE.W      #$20, D4                  ; Stores 20 inside D4, empty character and next letter position value.
  CLR.W       D2                        ; Clears D2.
  MOVE.B      (A3), D2                  ; Stores (A3) inside D2, the player ID.
  LSL.W       #$4, D2                   ; Shifts left D2 bits by 4, 0 to 0, 1 to 10.
  ADD.B       ($1, A3), D2              ; Adds ($1 + A3) to D2, the character ID.
  MOVE.B      ($2C, PC, D2.W), D2       ; Stores ($2C + PC + D2.W) inside D2, the name screen region shift.
  LSL.W       #$4, D2                   ; Shifts left D2 bits by 4, shift is stored shifted right by 4.
  ADD.W       D2, D1                    ; Adds D2 to D1, the correct initial character name screen region.
  CLR.W       D2                        ; Clears D2.
  MOVE.B      ($1, A3), D2              ; Stores ($1 + A3) inside D2, the character ID.
  LSL.W       #$4, D2                   ; Shifts left D2 bits by 4, 0 to 0, 1 to 10, 2 to 20, etc.
  MOVE.W      D0, D3                    ; Stores D0 inside D3, the blink effect.
  LSL.W       #$8, D3                   ; Shifts left D3 bits by 8, 0 to 0, 8 to 800.
  LSL.W       #$1, D3                   ; Shifts left D3 bits by 1, 0 to 0, 800 to 1000.
  ADD.W       #$3300, D3                ; Adds 3300 to D3, 3300 for red, 4300 for green.
  MOVE.B      (A2, D2.W), D3            ; Stores (A2 + D2.W) inside D3, the letter to be printed.
  CMP.B       D4, D3                    ; Compares D4 and D3, empty letter.
  BEQ         $FDBDE                    ; If it is 20, stop priting, go to the RTS line.
  ADDQ.W      #$1, D2                   ; Adds 1 to D2, go to the next letter.
  MOVE.W      D1, (A4)+                 ; Stores D1 inside (A4) and adds 2 to A4, the letter position.
  MOVE.W      D3, (A4)+                 ; Stores D3 inside (A4) and adds 2 to A4, the letter value.
  ADD.W       D4, D1                    ; Adds D4 to D1, go to the next letter screen position.
  BRA         $FDBCC                    ; Jumps back to the MOVE.B (A2, D2.W), D3 line.
  RTS                                   ; Returns back to the routine that called this code.


  JSR         $FDC00                    ; Replace 4D4A.

; ORG         $FDC00

                                        ; Block of code that handles resetting weak spot only on round 1.
  AND.B       #$2, ($BF, A0)            ; 2 and ($BF + A0), keeps only the weak spot flag.
  MOVE.B      ($7, A0), D0              ; Stores ($7 + A0) inside D0, current player amount of rounds won.
  MOVE.L      ($14, A0), A0             ; Stores ($14 + A0) inside A0, the other player memory address.
  ADD.B       ($7, A0), D0              ; Adds ($7 + A0) to D0, the other player amount of rounds won.
  MOVE.L      ($14, A0), A0             ; Stores ($14 + A0) inside A0, restore the current player memory address.
  TST.B       D0                        ; Compares 0 and D0.
  BNE         $FDC24                    ; If it is not 0, not the first round, ignore the 2 lines below.
  CLR.B       ($14A, A0)                ; Clears ($14A + A0), current player weak spot damage taken.
  MOVE.B      #$2, ($BF, A0)            ; Stores 2 inside ($BF + A0), activate weak spot protection.
  RTS                                   ; Returns back to the routine that called this code.


  JSR         $FDCC0                    ; Replace 3F20.
  NOP

; ORG         $FDCC0

                                        ; Block of code that updates the hit counter.
  MOVEM.L     D0-D1/A1, -(A7)           ; Stores D0 to D1 and A1 inside -(A7), save their values.
  LEA         $103AA0, A1               ; Stores 103AA0 inside A1, the hit counter memory region.
  CLR.W       D0                        ; Clears D0.
  MOVE.B      (A0), D0                  ; Stores (A0) inside D0, the player ID.
  LSL.W       #$1, D0                   ; Shifts left D0 bits by 1, 0 to 0, 1 to 2.
  ADD.W       D0, A1                    ; Adds D0 to A1, the player offset to hit counter memory.
  MOVE.B      ($BC, A0), D6             ; Code from the original game that was replaced.
  AND.B       #$3, D6                   ; Code from the original game that was replaced.
  BNE         $FDCDE                    ; If it is not 0, it is a combo, ignore the line below.
  CLR.B       (A1)                      ; Clears (A1), sets the hit counter to 0.
  MOVE.B      (A1), D0                  ; Stores (A1) inside D0, the hit amount.
  MOVEQ       #$1, D1                   ; Stores 1 inside D1, the amount it will increase.
  ABCD        D1, D0                    ; Adds D1 to D0 as decimal, increase the hit amount by 1.
  MOVE.B      D0, (A1)                  ; Stores D0 inside (A1), the updated hit amount.
  MOVE.B      D1, ($1, A1)              ; Stores D1 inside ($1 + A1), 1st frame of hit counter.
  MOVEM.L     (A7)+, D0-D1/A1           ; Stores (A7)+ inside D0 to D1 and A1, restore their values.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $FDD00

                                        ; Block of code that handles drawing the hit counter.
  MOVEM.L     D0-D2/A1-A4, -(A7)        ; Stores D0 to D2 and A1 to A4 inside -(A7), save their values.
  LEA         $101420, A1               ; Stores 101420 inside A1, the print sprite memory region.
  MOVE.L      (A1), A4                  ; Stores (A1) inside A4, the empty sprite memory region.
  LEA         ($2680, A1), A2           ; Stores ($2680 + A1) inside A2, P2 hit counter address.
  LEA         ($2250, A1), A3           ; Stores ($2250 + A1) inside A3, P1 memory address.
  MOVE.W      #$73E8, D0                ; Stores 73E8 inside D0, P2 hit counter screen position
  BSR         $FDD50                    ; Calls the code that draws the hit counter.
  BSR         $FDD34                    ; Calls the code that process hit counter step.
  LEA         ($2682, A1), A2           ; Stores ($2682 + A1) inside A2, P1 hit counter address.
  LEA         ($2450, A1), A3           ; Stores ($2450 + A1) inside A3, P2 memory address.
  MOVE.W      #$7048, D0                ; Stores 7048 inside D0, P1 hit counter screen position
  BSR         $FDD50                    ; Calls the code that draws the hit counter.
  BSR         $FDD34                    ; Calls the code that process hit counter step.
  MOVE.L      A4, (A1)                  ; Stores A4 inside (A1), the next empty sprite region.
  MOVEM.L     (A7)+, D0-D2/A1-A4        ; Stores (A7)+ inside D0 to D2 and A1 to A4, restore their values.
  RTS                                   ; Returns back to the routine that called this code.

                                        ; Block of code that process hit counter step.
  TST.B       ($1, A2)                  ; Compares 0 and ($1 + A2), hit counter current frame
  BMI         $FDD3E                    ; If it is a negative value, ignore the line below.
  ADDQ.B      #$2, ($1, A2)             ; Adds 2 to ($1 + A2), goes to the next frame.
  CMP.B       #$5, ($2652, A1)          ; Compares 5 and ($2652, A1), $103A72 end of round flag.
  BHI         $FDD4C                    ; If it is bigger than 5, ignore the 2 lines below.
  TST.B       ($BC, A3)                 ; Compares 0 and ($BC + A3), current player hitstun flag.
  BNE         $FDD4E                    ; If it is not 0, ignore the line below.
  CLR.B       (A2)                      ; Clears (A2), the amount of hits taken.
  RTS                                   ; Returns back to the routine that called this code.

                                        ; Block of code that draws the hit counter.
  CMP.B       #$2, (A2)                 ; Compares 2 and (A2), the amount of hits.
  BCS         $FDDA6                    ; If it is less than 2, don't draw hit counter, go to the line after RTS.
  CMP.B       #$1, ($1, A2)             ; Compares 1 and ($1 + A2), the hit counter current frame.
  BNE         $FDDA6                    ; If it is not 1, don't draw, go to the line after RTS.
  MOVE.W      #$2300, D1                ; Stores 2300 inside D1, the char color, yellow.
  MOVE.B      (A2), D1                  ; Stores (A2) inside D1, the hit amount.
  LSR.B       #$4, D1                   ; Shifts right D1 bits by 4, keeps only the left digit to print.
  ADD.B       #$30, D1                  ; Adds 30 to D1, 30 is the value of the char 0.
  MOVE.W      D0, (A4)+                 ; Stores D0 inside (A4) and adds 2 to A4, the char position.
  MOVE.W      D1, (A4)+                 ; Stores D1 inside (A4) and adds 2 to A4, the char value.
  ADD.W       #$20, D0                  ; Adds 20 to D0, go to the next char position.
  MOVE.B      (A2), D1                  ; Stores (A2) inside D1, the hit amount.
  AND.B       #$F, D1                   ; F and D1, keeps only the right digit to print.
  ADD.B       #$30, D1                  ; Adds 30 to D1, 30 is the value of the char 0.
  MOVE.W      D0, (A4)+                 ; Stores D0 inside (A4) and adds 2 to A4, the char position.
  MOVE.W      D1, (A4)+                 ; Stores D1 inside (A4) and adds 2 to A4, the char value.
  ADD.W       #$20, D0                  ; Adds 20 to D0, go to the next char position.
  MOVE.W      #$3300, D1                ; Stores 3300 inside D1, the char color, red.
  MOVE.L      #$73746948, D2            ; Stores 73746948 inside D2, the word "Hits" inverted.
  MOVE.B      D2, D1                    ; Stores D2 inside D1, the char to be drawn.
  MOVE.W      D0, (A4)+                 ; Stores D0 inside (A4) and adds 2 to A4, the char position.
  MOVE.W      D1, (A4)+                 ; Stores D1 inside (A4) and adds 2 to A4, the char value.
  ADD.W       #$20, D0                  ; Adds 20 to D0, go to the next char position.
  LSR.L       #$8, D2                   ; Shifts right D2 bits by 8, next char to be printed.
  BNE         $FDD8E                    ; If D2 is not 0, go to the MOVE.B D2, D1 line of code.
  MOVE.B      #$21, D1                  ; Stores 21 inside D1, the exclamation mark char value.
  MOVE.W      D0, (A4)+                 ; Stores D0 inside (A4) and adds 2 to A4, the char position.
  MOVE.W      D1, (A4)+                 ; Stores D1 inside (A4) and adds 2 to A4, the char value.
  RTS                                   ; Returns back to the routine that called this code.
  CMP.B       #$1, (A2)                 ; Compares 1 and (A2), hit amount.
  BEQ         $FDDB4                    ; If it is 1, clears the hit counter, ignore the 2 lines below.
  CMP.B       #$7F, ($1, A2)            ; Compares 7F and ($1 + A2), frame to clear the hit counter.
  BNE         $FDDC8                    ; If it is not 7F, go to the RTS line.
  MOVE.W      #$6, D2                   ; Store 6 inside D2, the amount of iterations -1.
  MOVE.W      #$3320, D1                ; Stores 3320 inside D1, the empty char with red color.
  MOVE.W      D0, (A4)+                 ; Stores D0 inside (A4) and adds 2 to A4, the char position.
  MOVE.W      D1, (A4)+                 ; Stores D1 inside (A4) and adds 2 to A4, the char value.
  ADD.W       #$20, D0                  ; Adds 20 to D0, go to the next char position.
  DBRA        D2, $FDDBC                ; If D2 is not -1, go the MOVE.W D0, (A4)+ line.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $FF000

                                        ; Block of code that handles the move custom behavior.
  MOVE.B      #$1, ($1FF, A0)           ; Stores 1 inside ($1FF, A0), DM executed flag active.
  CLR.L       D0                        ; Clears D0.
  BSR         $FF040                    ; Calls the code that forces a new translation.
  BSR         $FF080                    ; Calls the code that forces a new translation.
  MOVE.W      #$1F2, D0                 ; Stores 1F2 inside D0, the sound data offset.
  BSR         $FF100                    ; Calls the code that plays a sound.
  MOVE.W      #$1F4, D0                 ; Stores 1F4 inside D0, the sound data offset.
  BSR         $FF100                    ; Calls the code that plays a sound.
  CLR.L       D0                        ; Clears D0.
  MOVE.W      ($1FC, A0), D0            ; Stores ($1FC, A0), the code behavior data.
  BNE         $FF02A                    ; If it is not 0, ignore the line below.
  JMP         $1A49A                    ; Jumps to the code that handles a translating move.
  JMP         $1A5B8                    ; Jumps to the code that handles a jumping move.


; ORG         $FF040

                                        ; Block of code that sets the custom move translation
  MOVE.B      ($1F0, A0), D0            ; Stores ($1F0 + A0) inside D0, the translation speed.
  BEQ         $FF050                    ; If D0 is 0, no custom translation, go to the last line.
  SWAP        D0                        ; Invert D0 higher and lower bits, necessary.
  MOVE.L      D0, ($130, A0)            ; Stores D0 inside ($130 + A0), character translation speed.
  CLR.B       ($1F0, A0)                ; Clears ($1F0 + A0), the translation data.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $FF080

                                        ; Block of code that sets the custom move translation
  MOVE.B      ($1F1, A0), D0            ; Stores ($1F1 + A0) inside D0, the translation speed ID.
  BEQ         $FF094                    ; If D0 is 0, no custom translation, go to the last line.
  LSL.W       #$2, D0                   ; Shifts left D0 bits by 2, 0 to 0, 1 to 4, 2 to 8, etc.
  MOVE.L      ($16, PC, D0.W), D0       ; Stores ($16 + PC + D0.W) inside D0, the translation speed.
  MOVE.L      D0, ($130, A0)            ; Stores D0 inside ($130 + A0), character translation speed.
  CLR.B       ($1F1, A0)                ; Clears ($1F1 + A0), the translation data.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $FF100

                                        ; Block of code that handles playing a sound effect.
  TST.B       ($121, A0)                ; Compares ($121 + A0) and D0, the animation first frame.
  BNE         $FF12A                    ; If it is not 0, not the 1st frame, go to the last line.
  MOVE.W      D0, ($1FA, A0)            ; Stores D0 inside ($1FA + A0), save the offset.
  MOVE.W      (A0, D0.W), D0            ; Stores (A0 + D0.W) inside D0, the sound data.
  BEQ         $FF126                    ; If D0 is 0, go to the line before the last line.
  CMP.B       ($120, A0), D0            ; Compares ($120 + A0) and D0.
  BNE         $FF126                    ; If it is not equals, incorrect animation, go to the line before the last line.
  LSR.W       #$8, D0                   ; Shifts right D0 bits by 8, to have the sound ID.
  JSR         $195C8                    ; Calls the routine that handles playing the sound effect.
  MOVE.W      ($1FA, A0), D0            ; Stores ($1FA + A0) inside D0, restore the offset data.
  CLR.W       (A0, D0.W)                ; Clears (A0 + D0.W), the sound data.
  CLR.W       ($1FA, A0)                ; Clears (A0 + D0.W), the saved offset data.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $FF200

                                        ; Block of code that sets a custom move translation.
  MOVEQ       #$4, D0                   ; Stores 4 inside D0, translation speed.
  BRA         $FF21A                    ; Jumps to the TST line.
  MOVEQ       #$5, D0                   ; Stores 5 inside D0, translation speed.
  BRA         $FF21A                    ; Jumps to the TST line.
  MOVEQ       #$6, D0                   ; Stores 6 inside D0, translation speed.
  BRA         $FF21A                    ; Jumps to the TST line.
  MOVEQ       #$7, D0                   ; Stores 7 inside D0, translation speed.
  BRA         $FF21A                    ; Jumps to the TST line.
  MOVEQ       #$8, D0                   ; Stores 8 inside D0, translation speed.
  BRA         $FF21A                    ; Jumps to the TST line.
  MOVEQ       #$9, D0                   ; Stores 9 inside D0, translation speed.
  BRA         $FF21A                    ; Jumps to the TST line.
  MOVEQ       #$A, D0                   ; Stores A inside D0, translation speed.
  TST.B       ($120, A0)                ; Compares 0 and ($120 + A0), the current move animation index.
  BNE         $FF226                    ; If it is not 0, go to the last line.
  SWAP        D0                        ; Invert D0 higher and lower bits, necessary.
  MOVE.L      D0, ($130, A0)            ; Stores D0 inside ($130 + A0), the move translation speed.
  JMP         $1A49A                    ; Jumps to the code that handles a translating move.


; ORG         $FF240

                                        ; Block of code that sets a custom move translation.
  MOVE.L      #$04000400, D0            ; Stores 04000400 inside D0, translation speed.
  BRA         $FF266                    ; Jumps to the TST line.
  MOVE.L      #$05000200, D0            ; Stores 05000200 inside D0, translation speed.
  BRA         $FF266                    ; Jumps to the TST line.
  MOVE.L      #$05E003E0, D0            ; Stores 05E005E0 inside D0.
  BRA         $FF266                    ; Jumps to the TST line.
  MOVE.L      #$06000600, D0            ; Stores 06000600 inside D0, translation speed.
  BRA         $FF266                    ; Jumps to the TST line.
  MOVE.L      #$0B000B00, D0            ; Stores 0B000B00 inside D0, translation speed.
  TST.B       ($120, A0)                ; Compares 0 and ($120 + A0), the current move animation index.
  BNE         $FF270                    ; If it is not 0, go to the last line.
  MOVE.L      D0, ($130, A0)            ; Stores D0 inside ($130 + A0), the move translation speed.
  JMP         $1A5B8                    ; Jumps to the code that handles a jumping move.


; ORG         $FF290

                                        ; Block of code that fixes Karnov Teleport Bug.
  MOVE.L      #$50000, ($130, A0)       ; Stores 50000 inside ($130, A0), the move speed.
  CLR.L       ($134, A0)                ; Clears ($134 + A0), used to add to the translation.
  JMP         $1A49A                    ; Jumps to the code that handles a translating move.


; ORG         $FF2B0

                                        ; Block of code that changes Super Zesshouhohou translation speed (Lee).
  CMP.W       #$1000, ($130, A0)        ; Compares 1000 and ($130 + A0), translation speed.
  BNE         $FF2C0                    ; If it is not equals, go to the last line of code.
  MOVE.L      #$0C000C00, ($130, A0)    ; Stores 0C000C00 inside ($130 + A0), the translation speed.
  JMP         $1A5B8                    ; Jumps to the code that handles a jumping move.


; ORG         $FF2E0

                                        ; Block of code that activates the DM executed flag.
  MOVE.B      #$1, ($1FF, A0)           ; Stores 1 inside ($1FF, A0), DM executed flag active.
  JMP         $1A49A                    ; Jumps to the code that handles a translating move.


; ORG         $FF300

                                        ; Block of code that activates the DM executed flag.
  MOVE.B      #$1, ($1FF, A0)           ; Stores 1 inside ($1FF, A0), DM executed flag active.
  JMP         $1A5B8                    ; Jumps to the code that handles a jumping move.


; ORG         $FF320

                                        ; Block of code that activates the DM executed flag.
  MOVE.B      #$1, ($1FF, A0)           ; Stores 1 inside ($1FF, A0), DM executed flag active.
  JMP         $1A982                    ; Jumps to the code that handles a fireball move.


; ORG         $FF340

                                        ; Block of code that stores the opponent memory region inside A1.
  LEA         $103670, A1               ; Stores 103670 inside A1, P1 memory regions
  CMP.L       A0, A1                    ; Compares A0 and A1.
  BNE         $FE24E                    ; If they are not equals, ignore the line below.
  ADD.W       #$200, A1                 ; Adds 200 to A1, now it is 103870, P2 memory region.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $FF360

                                        ; Block of code that sets grab moves necessary flags.
  BCLR        #$0, ($BF, A0)            ; Clears the 1st bit of ($BF + A0), code for grabs.
  SUBQ.L      #$1, ($110, A0)           ; Subtracts 1 from ($110 + A0), code for grabs.
  MOVE.W      #$12, ($D0, A1)           ; Stores 12 inside ($D0 + A1), the opponent move ID.
  BCLR        #$0, ($BF, A1)            ; Clears the 1st bit of ($BF + A1), code for grabs.
  BCLR        #$3, ($BF, A1)            ; Clears the 4th bit of ($BF + A1), code for grabs.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $FF3A0

                                        ; Block of code that fixes Jean/Zazie wrong animation duration.
  TST.W       ($120, A0)                ; Compares 0 and ($120 + A0), current animation and duration.
  BNE         $FF3AC                    ; If it is not 0, go to the last line.
  MOVE.B      #$8, ($139, A0)           ; Stores 8 inside ($139 + A0), the currect amount of animations.
  JMP         $1C95E                    ; Jumps to the code that handles the move.


; ORG         $FF3E0

                                        ; Block of code that forces Ryoko to choke the opponent only 3 times.
  CLR.W       ($1E0, A0)                ; Clears ($1E0 + A0), Tateshihou Gatame cancel flag.
  MOVE.W      ($138, A0), D0            ; Stores ($138 + A0) inside D0, the choke timer.
  BEQ         $FF408                    ; If D0 is 0, go to the last line.
  CMP.W       #$3000, D0                ; Compares 3000 and D0, minimum 3 chokes value.
  BCS         $FF3F4                    ; If it is smaler than 3000, ignore the 2 lines below.
  CLR.W       D0                        ; Clears D0.
  BRA         $FF404                    ; Jump to the line before the last line.
  OR.W        #$FFF, D0                 ; FFF or D0, to make sure the opponent can't escape mashing.
  CMP.W       #$100, ($120, A0)         ; Compares 100 and ($120 + A0), first choke frame.
  BNE         $FF404                    ; If it is not 100, not last choke frame, ignore the line below.
  ADD.W       #$1000, D0                ; Adds 1000 to D0, increases the choke timer.
  MOVE.W      D0, ($138, A0)            ; Stores D0 inside ($138, A0), the updated choke timer.
  JMP         $1B236                    ; Jumps to the code that handles Tateshihou Gatame.


; ORG         $FF420

                                        ; Block of code that calculates the move shift amount for punch moves.
  LEA         $16488, A1                ; Stores 16488 inside A1, move shift data list.
  MOVE.B      ($B1, A0), D0             ; Stores ($B1 + A0) inside D0, buttons pressed.
  LSR.B       #4, D0                    ; Shifts right D0 bits by 4, buttons as the right digit.
  AND.W       #$3, D0                   ; D0 and 3, both punch buttons.
  MOVE.B      (A1, D0.W), D0            ; Stores (A1 + D0.W) inside D0, move shift ID.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $FF450

                                        ; Block of code that calculates the move shift amount for kick moves.
  LEA         $16488, A1                ; Stores 16488 inside A1, move shift data list.
  MOVE.B      ($B1, A0), D0             ; Stores ($B1 + A0) inside D0, buttons pressed.
  LSR.B       #4, D0                    ; Shifts right D0 bits by 4, buttons as the right digit.
  AND.W       #$0C, D0                  ; D0 and C, both kick buttons.
  MOVE.B      (A1, D0.W), D0            ; Stores (A1 + D0.W) inside D0, move shift ID.
  SUBQ.B      #$2, D0                   ; Subtracts 2 from D0, 2 to 0, 3 to 1.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $FF480

                                        ; Block of code that fixes Ryoko's Bakushin Behavior.
  TST.W       ($120, A0)                ; Compares 0 and ($120 + A0), current animation and duration.
  BNE         $FF4B0                    ; If it is not 0, go to the last line of code line.
  CMP.B       #$4, ($130, A0)           ; Compares 4 and ($130 + A0), strong version.
  BEQ         $FF498                    ; If it is 4, ignore the 2 lines below.
  MOVE.L      #$05000500, ($130, A0)    ; Stores 5000500 inside ($130 + A0), translation speed.
  BRA         $FF4A0                    ; Ignore the line below.
  MOVE.L      #$07000700, ($130, A0)    ; Stores 7000700 inside ($130 + A0), translation speed.
  MOVE.L      #$03800380, ($138, A0)    ; Stores 3800380 inside ($138 + A0), height.
  MOVE.L      #$FF60FF60, ($13C, A0)    ; Stores FF60FF60 inside ($13C + A0), gravity.
  JMP         $1A5B8                    ; Jumps to the code that handles the move.


; ORG         $FF4D0

                                        ; Block of code that fixes Lee's Long Ti Behavior.
  BTST        #$0, ($BF, A0)            ; Code from 1A5B8.
  BNE         $FF514                    ; Code from 1A5B8 readjusted.
  BSET        #$0, ($BF, A0)            ; Code from 1A5B8.
  JSR         $19476                    ; Code from 1A5B8.
  CMP.B       #$04, ($130, A0)          ; Compares 26 and ($12D + A0), strong version
  BEQ         $FF4F6                    ; Code from 1A5B8 readjusted.
  MOVE.L      #$FB00FB00, ($138, A0)    ; Stores FB00FB00 inside ($138 + A0), height.
  BRA         $FF4FE                    ; Ignore the line below.
  MOVE.L      #$FD00FD00, ($138, A0)    ; Stores FD00FD00 inside ($138 + A0), height.
  MOVE.L      #$05000500, ($130, A0)    ; Stores 5000500 inside ($130 + A0), translation speed.
  CLR.L       ($134, A0)                ; Clears ($134 + A0).
  CLR.L       ($13C, A0)                ; Clears ($13C + A0).
  JMP         $1A5D8                    ; Jumps to the code that handles initializing the move.
  JMP         $1A620                    ; Jumps to the code that handles the move.


; ORG         $95E2                     ; Replace 95E2 (There is space to replace everything).

                                        ; Block of code that randomizes the stage.
  MOVEM.L     D3-D5/A4, -(A7)           ; Stores D3 to D5 and A4 inside -(A7), save their values.
  JSR         $8F5C0                    ; Calls the code that randomizes a value in D5.
  DIVU.W      #$D, D5                   ; Divides D5 by D, stages go from 0 to C.
  SWAP        D5                        ; Invert D5 higher and lower bits, the rest of the division.
  LEA         $103464, A4               ; Code from the original game readjusted.
  MOVE.W      D5, ($34CE, A4)           ; Stores D5 inside ($34CE + A4), the stage ID at $106932.
  MOVE.W      D5, (A4)                  ; Code from the original game readjusted.
  MOVEM.L     (A7)+, D3-D5/A4           ; Stores (A7)+ inside D3 to D5 and A4, restore their values.


; ORG         $3F1C                     ; Replace 3F1C (There is space to replace everything).

                                        ; Block of code that decreases the weak spot damage.
  LSR.B       #2, D6                    ; Shifts right D6 bits by 2, 25% of damage instead of 50%.


; ORG         $40B2                     ; Replace 40B2 (There is space to replace everything).

                                        ; Block of code that increases the weak spot hit to 4.
  MOVE.B      ($14A, A0), D4            ; Stores ($14A + A0) inside D4, weak spot damage.
  ADDQ.B      #$1, D4                   ; Adds 1 to D4, increases the damage done.
  CMP.B       #$3, D4                   ; Compares 3 and D4, if the current hit is the 3rd one.
  BCS         $40C0                     ; If it is smaller than 3, ignore the line below.
  MOVEQ       #$FF, D4                  ; Store FF inside D4, the last hit value.
  MOVE.B      D4, ($14A, A0)            ; Stores D4 inside ($14A + A0), the updated weak spot damage.
  NOP                                   ; No operation, does nothing.


; ORG         $4CFE

                                        ; Block of code that clears the DM exectuted flag.
  CLR.B       ($1FF, A0)                ; Clears ($1FF + A0), the DM executed flag.


; ORG         $B188                     ; Replace B188 (There is space to replace everything).

                                        ; Block of code that fixes the P1 frame disadvantage (Attack Hit Freeze).
  MOVE.L      ($14, A0), A1             ; Code from the original game that was replaced.
  MOVE.B      ($14C, A1), D0            ; Stores ($14C + A1) inside D0, the player ID.
  CMP.B       (A1), D0                  ; Compares (A1) and D0, former TST, frame advantage bug fix.
  BLS         $B1AA                     ; If it is D0 or less, go to the B1AA line (previously only 0).
  BTST        #$2, ($146, A1)           ; Code from the original game that was replaced.
  BEQ         $B1FA                     ; Code from the original game readjusted.


; ORG         $3B32                     ; Replace 3B32 (There is space to replace everything).

                                        ; Block of code that fixes the round winner player not computing the hit taken.
  TST.B       ($147, A0)                ; Code from the original game.
  BEQ         $3B3E                     ; Code from the original game readjusted.
  TST.B       ($147, A1)                ; Code from the original game.
  BNE         $3B7C                     ; Code from the original game readjusted.
  MOVE.W      ($FE, A0), ($D0, A0)      ; Code from the original game.
  BCLR        #$0, ($BF, A0)            ; Code from the original game.
  MOVE.W      ($FE, A1), ($D0, A1)      ; Code from the original game.
  BCLR        #$0, ($BF, A1)            ; Code from the original game.
  MOVE.W      #$3, ($10346C)            ; Code from the original game.
  BRA         $3BB2                     ; Code from the original game.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.


; ORG         $6ABE                     ; Replace 6ABE (There is space to replace everything).

                                        ; Block of code that adds support for 3 stage palletes.
  LEA         $70FE0, A1                ; Stores 70FE0 inside A0, stage pallete list address.
  MOVE.W      ($10100C), D7             ; Stores ($10100C) inside D7, current round.
  LSL.W       #$2, D7                   ; Shifts left D7 bits by 2, 0 to 0, 1 to 4, 2 to 8, 3 to C.
  MOVE.L      (A1, D7.W), A0            ; Stores (A1, D7.W) inside A0, the 1st stage pallete with round shift address.


; ORG         $EA12                     ; Replace EA12 (There is space to replace everything).

                                        ; Block of code that adds support for 3 stage round style.
  LEA         $70EFC, A1                ; Stores 70EFC inside A1, stage round list address.
  MOVE.W      ($10100C), D7             ; Stores ($10100C) inside D7, round ID.
  MOVEQ       #$34, D0                  ; Stores 34 inside D0, the stage round list shift.
  ADD.W       D0, A1                    ; Adds D0 to A1, the stage round list shift
  SUBQ.W      #$1, D7                   ; Subtracts 1 from D7, the round ID.
  BGE         $EA20                     ; If D7 is bigger or equal 0, go to the ADD line above.
  MOVE.W      ($103464), D0             ; Code from the original game.


; This module has several features to handle the extra features
; added to the game, like extra moves, DM, bug fixes present
; in the move of some characters, and other bug fixes. It also 
; has helper routines that is used by new moves.
; 
; 0FDB00: Handles Drawing Extra Features On Screen
; 0FDB20: Readjusts Any Damage Above 5F to 20
; 0FDB50: Draws Super Indicator
; 0FDC00: Resets Weak Spot Damage On Round 1 Only
; 0FDCC0: Updates the Hit Counter
; 0FDD00: Handles Drawing The Hit Counter
; 0FDE00: Sets Stage Custom Pallete
; 0FF000: Handles Custom Move Behavior
; 0FF080: Sets Custom Move Translation (Ground Move)
; 0FF040: Sets Custom Move Translation (Jumping Move)
; 0FF100: Plays Custom Move Sound Effect
; 0FF200: Sets Custom Move Translation (Ground Move)
; 0FF240: Sets Custom Move Translation (Jumping Move)
; 0FF290: Fixes Karnov Teleport Bug
; 0FF2B0: Modifies Zesshouhohou
; 0FF2E0: Activates DM Executed Flag (1A49A)
; 0FF300: Activates DM Executed Flag (1A5B8)
; 0FF320: Activates DM Executed Flag (1A982)
; 0FF340: Stores Opponent Memory Region In A1
; 0FF360: Sets Grab Move Necessary Flags
; 0FF3A0: Fixes Zazie / Jean Wrong Animation Duration
; 0FF3E0: Forces Ryoko To Choke Only 3 Times
; 0FF420: Calculates Move Shift Amount (Punch Button)
; 0FF450: Calculates Move Shift Amount (Kick Button)
; 0FF480: Fixes Ryoko's Bakushin Translation Data
; 0FF4D0: Fixes Lee's Long Ti Translation Data
; 0095E2: Randomizes The Stage
; 003F1C: Decreases Weak Spot Damage
; 0040B2: Increases Weak Spot Resistance To 4 Hits
; 004CFE: Clears the DM executed Flag
; 00B188: Fixes P1 Frame Disadvantage (Attack Hit Freeze)
; 003B32: Fixes Round Winner Player Not Taking Hit When Trading Blows
; 006ABE: Adds Support For 3 Stage Palletes
; 00EA12: Adds Support For 3 Stage Round Style