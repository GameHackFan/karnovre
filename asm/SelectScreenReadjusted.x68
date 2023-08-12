*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Select Screen Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  It contains several routines that handles the changes
*               made to add support to features in the select screen.
*----------------------------------------------------------------------------------------------

  JMP         $8F000                    ; Replace CD3A.

; ORG         $8F000

                                        ; Block of code that initializes the select screen extra features.
  JSR         $6BE6.L                   ; Code from the original game that was replaced.
  MOVEM.L     D0-D7/A0-A6, -(A7)        ; Stores all registers inside -(A7), save their values.
  BSR         $8F5C0                    ; Calls the code that do some frame based randomizations.
  BSR         $8F580                    ; Calls the code that resets the select screen data.
  LEA         ($24C, A1), A1            ; Stores ($24C + A1) inside A1, 103424 to 103670, P1 memory region.
  MOVEQ       #$0, D1                   ; Stores 0 inside D1, P1 active bit index.
  BSR         $8F100                    ; Calls the code that randomizes the character.
  BSR         $8F400                    ; Calls the code that resets the player data.
  LEA         ($200, A1), A1            ; Stores ($200 + A1) inside A1, 103670 to 103870, P1 memory region.
  MOVEQ       #$1, D1                   ; Stores 1 inside D1, P1 active bit index.
  BSR         $8F100                    ; Calls the code that randomizes the character and pallete.
  BSR         $8F400                    ; Calls the code that resets the player data.
  MOVEM.L     (A7)+, D0-D7/A0-A6        ; Stores (A7)+ inside all registers, restore their values.
  JMP         $CD40.L                   ; Jumps back to where it stopped in the original code.


  JMP         $8F050                    ; Replace D4DE.
  NOP

; ORG         $8F050

                                        ; Block of code that handles the select screen extra features.
  MOVE.B      ($B0, A1), D0             ; Stores ($B0 + A1) inside D0, the buttons pressed.
  AND.W       #$30, D0                  ; D0 and 30, both punch button.
  BNE         $8F080                    ; If it is not 0, then character was selected, go to the 2nd block of code.
  MOVEM.L     D0-D7/A0-A6, -(A7)        ; Stores all registers inside -(A7), save their values.
  BSR         $8F130                    ; Calls the code that stores the player ID inside D1.
  BSR         $8F150                    ; Calls the code that stores the player start press inside D2.
  BSR         $8F170                    ; Calls the code that handles the pallete selection.
  BSR         $8F500                    ; Calls the code that randomizes the character and pallete.
  BSR         $8F300                    ; Calls the code that updates the palletes.
  BSR         $8F1C0                    ; Calls the code that draws the character sprite.
  MOVEM.L     (A7)+, D0-D7/A0-A6        ; Stores (A7)+ inside all registers, restore their values.
  JMP         $D57A                     ; Jumps to the code that handles the character not confirmed.

                                        ; Block of code that handles the character confirmation;
  MOVEM.L     D0-D7/A0-A6, -(A7)        ; Stores all registers inside -(A7), save their values.
  BSR         $8F130                    ; Calls the code that stores the player ID inside D1.
  BSR         $8F150                    ; Calls the code stores the player start press inside D2.
  BSR         $8F240                    ; Calls the code that handles the character confirmation.
  BSR         $8F300                    ; Calls the code that updates the palletes.
  MOVEM.L     (A7)+, D0-D7/A0-A6        ; Stores (A7)+ inside all registers, restore their values.
  JMP         $D4E6.L                   ; Jumps to the code that handles the character confirmed.


  JSR         $8F0B0                    ; Replace D57A.

; ORG         $8F0B0

                                        ; Block of code that handles the character selection.
  TST.B       ($1EE, A1)                ; Compares 0 and ($1EE + A1), random select flag.
  BNE         $8F0BC                    ; If it is not 0, random select is active, go to the last line.
  MOVEQ       #$0, D0                   ; Code from the original game that was replaced.
  MOVE.B      ($B2, A1), D0             ; Code from the original game that was replaced.
  RTS                                   ; Returns back to the routine that called this code.


  JSR         $8F0D0                    ; Replace D28C, D2A8.

; ORG         $8F0D0

                                        ; Block of code that randomizes CPU pallete.
  JSR         $6CD8.L                   ; Calls the code that selects the CPU character.
  BSR         $8F3C0                    ; Calls the code that randomizes the CPU pallete.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F100

                                        ; Block of code that randomizes character and pallete screen start.
  BTST        D1, ($101000)             ; Compares D1 and the 1st bit of ($101000), player active flag.
  BEQ         $8F11A                    ; If it is 0, not active, go to the last line.
  TST.B       ($1EE, A1)                ; Compares 0 and ($1EE + A1), random select flag.
  BEQ         $8F11A                    ; If it is 0, not random selected, go to the last line.
  BSR         $8F506                    ; Calls the code that randomizes the character and pallete.
  BSR         $8F24E                    ; Calls the code that solves color conflict.
  BSR         $8F300                    ; Calls the code that updates the palletes.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F130

                                        ; Block of code that saves the player ID inside D1.
  MOVE.W      A1, D1                    ; Stores A1 inside D1, the current player memory address.
  AND.W       #$800, D1                 ; D1 and 800, 3600 to 0, 3800 to 800.
  LSR.W       #$8, D1                   ; Shifts right D1 bits by 8, 0 to 0, 800 to 8.
  LSR.W       #$3, D1                   ; Shifts right D1 bits by 3, 0 to 0, 8 to 1.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F150

                                        ; Block of code that saves start press inside D2.
  MOVEQ       #$1, D2                   ; Stores 1 inside D2.
  LSL.W       D1, D2                    ; Shifts left D2 bits by D1, 1 for P1, 2 for P2.
  LSL.W       D1, D2                    ; Shifts left D2 bits by D1, 1 for P1, 4 for P2.
  AND.B       ($10FDAC), D2             ; D2 and ($10FDAC), 1 if P1 pressed start, 4 if P2 pressed start, 0 otherwise.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F170

                                        ; Block of code that handles the pallete selection.
  TST.B       D2                        ; Compares 0 and D2, if start was pressed.
  BNE         $8F192                    ; If it is not 0, start was pressed, go to the RTS line.
  MOVE.B      ($B0, A1), D3             ; Stores ($B0 + A1) inside D3, the buttons pressed.
  AND.W       #$00C0, D3                ; D3 and C, both kick buttons.
  BEQ         $8F192                    ; If it is 0, no kick button pressed, go to the RTS line.
  LSR.W       #$6, D3                   ; Shifts right D3 bits by 6, C0 to 3, 80 to 2, 40 to 1.
  BSET        #$0, D3                   ; Sets the 1st bit of D3 to 1, 3 to 3, 2 to 3, 1 to 1.
  SUBQ.B      #$2, D3                   ; Subtracts 2 from D3, 3 to 1, 1 to -1.
  ADD.B       ($1EF, A1), D3            ; Adds ($1EF + A1) to D3, the current pallete ID.
  AND.W       #$7, D3                   ; D3 and 7, to keep the pallete ID inside the 0 to 7 range.
  MOVE.B      D3, ($1EF, A1)            ; Stores D3 inside ($1EF + A1), the updated pallete ID.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F1C0

                                        ; Block of code that draw the character sprite.
  MOVE.B      D1, ($3, A1)              ; Stores D1 inside ($3 + A1), 1st pallete to P1, 2nd pallete to P2.
  MOVE.W      #$58, ($00C4, A1)         ; Stores 58 inside ($C4 + A1), character position Y.
  MOVE.W      #$260, D3                 ; Stores 260 inside D3, P1 character position X.
  MOVE.W      D1, D4                    ; Stores D1 inside D4, player ID.
  LSL.W       #$6, D4                   ; Shifts left D4 bits by 6, 0 to 0, 1 to 40.
  ADD.W       D4, D3                    ; Adds D4 to D3, P1 is 260, P2 is 2A0.
  MOVE.W      D3, ($00C0, A1)           ; Stores D3 inside ($C0 + A1), character position X.
  CLR.W       D3                        ; Clears D3.
  MOVE.B      ($1, A1), D3              ; Stores ($1 + A1) inside D3, the player character ID.
  CMP.B       #$D, D3                   ; Compares D and D3, D is Ox ID.
  BHI         $8F1F4                    ; If it is bigger than D, don't draw, go to the last line.
  ADD.W       D3, D3                    ; Add D3 to D3, doubles it, the sprite is 2 bytes.
  MOVE.W      ($18, PC, D3.W), D3       ; Stores ($18 + PC + D3.W) inside D3, the character sprite.
  MOVE.W      D3, ($22, A1)             ; Stores D3 inside ($22, A1), updates the sprite.
  JSR         $9D4A.L                   ; Calls the code that draws the sprite.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F240

                                        ; Block of code that confirms the character selection.
  MOVE.B      D1, ($3, A1)              ; Stores D1 inside ($3 + A1), 1st pallete to P1, 2nd pallete to P2.
  BSET        #$1, ($B8, A1)            ; Sets the 2nd bit of ($B8 + A1), confirm the character is selected.
  MOVE.B      D2, ($1EE, A1)            ; Stores D2 inside ($1EE + A1), the random select flag.

                                        ; Block of code that handles pallete conflict and confirms it.
  CLR.L       D3                        ; Clears D3.
  CLR.W       D4                        ; Clears D4.
  MOVE.L      A1, D3                    ; Stores A1 inside D3, current player memory address.
  ADD.W       #$200, D3                 ; Adds 200 to D3, 3600 to 3800, 3800 to 3A00.
  MOVE.B      D1, D4                    ; Stores D1 inside D4 inside, P1 is 0, P2 is 1.
  LSL.W       #$8, D4                   ; Shifts left D4 bits by 8, 0 to 0, 1 to 100.
  LSL.W       #$2, D4                   ; Shifts left D4 bits by 2, 0 to 0, 100 to 400.
  SUB.W       D4, D3                    ; Subtracts D4 from D3, 3800 to 3800, 3A00 to 3600.
  MOVE.L      D3, A3                    ; Stores D3 inside A3, the other player memory address.
  BTST        #$1, ($B8, A3)            ; Test the 2nd bit of ($B8 + A3), player character confirmed.
  BEQ         $8F288                    ; If the bit is 0, not confirmed, go to the line before the last line.
  MOVE.B      ($1, A3), D4              ; Stores ($1 + A3) inside D4, the other player character ID.
  CMP.B       ($1, A1), D4              ; Compares ($1 + A1) and D4, both players character ID.
  BNE         $8F288                    ; If they are not equals, go to the line before the last line.
  MOVE.B      ($1EF, A1), D4            ; Stores ($1EF + A1) inside D4, the player pallete ID.
  CMP.B       ($1EF, A3), D4            ; Compares ($1EF + A3) and D4, both players pallete ID.
  BNE         $8F288                    ; If they are not equals, go to the line before the last line.
  ADDQ.B      #$1, D4                   ; Adds 1 to D4, go to the next pallete ID.
  AND.W       #$7, D4                   ; D4 and 7, to keep the pallete ID inside the 0 to 7 range.
  MOVE.B      D4, ($1EF, A1)            ; Stores D4 inside ($1EF + A1), the pallete ID selected.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F300

                                        ; Block of code that updates the player character pallete.
  LEA         $71000, A3                ; Stores 71000 inside A3, 1st pallete address.
  LEA         $400000, A5               ; Stores 400000 inside A5, pallete base video address.
  CLR.W       D5                        ; Clears D5.
  MOVE.B      D1, D5                    ; Stores D1 inside D5, the player ID.
  LSL.W       #$8, D5                   ; Shifts left D5 bits by 8, 0 to 0, 1 to 100.
  LSL.W       #$1, D5                   ; Shifts left D5 bits by 1, 0 to 0, 100 to 200.
  CLR.W       D3                        ; Clears D3.
  MOVE.B      ($1, A1), D3              ; Stores ($1 + A1) inside D3, the player character ID.
  MOVE.W      D3, D4                    ; Stores D3 inside D4, save it to use later.
  LSL.W       #$8, D3                   ; Shifts left D3 bits by 8, 0 to 0, 1 to 100, 2 to 200.
  LSL.W       #$1, D3                   ; Shifts left D3 bits by 1, 0 to 0, 100 to 200, 200 to 400.
  ADD.W       D3, A3                    ; Adds D3 to A3, the selected pallete ID address.
  CLR.W       D3                        ; Clears D3.
  MOVE.B      ($1EF, A1), D3            ; Stores ($1FE + A1) inside D3, the player pallete ID.
  LSL.W       #$5, D3                   ; Shifts left D3 bits by 5, 0 to 0, 1 to 20, 2 to 40.
  ADD.W       D3, A3                    ; Adds D3 to A3, the selected pallete ID address.
  LSL.W       #$2, D4                   ; Shifts left D4 bits by 2, 0 to 0, 1 to 4, 2 to 8.
  MOVE.W      ($30, PC, D4.W), D3       ; Stores ($30 + PC + D4.W) inside D3, the pallete video offset.
  LEA         (A5, D3.W), A4            ; Stores (A5 + D3.W) inside A4, the final pallete video address.
  ADD.W       D5, A4                    ; Adds D5 to A4, the player pallete video offset.
  BSR         $8F34E                    ; Calls the code that sets the pallete from (A3) inside (A4).
  ADD.W       #$E0, A3                  ; Adds E0 to A3, the weak spot ROM pallete address.
  ADDQ.W      #$2, D4                   ; Adds 2 to D4, the weak spot pallete video address offset.
  MOVE.W      ($1E, PC, D4.W), D3       ; Stores ($1E + PC + D4.W) inside D3, the pallete video offset.
  LEA         (A5, D3.W), A4            ; Stores (A5 + D3.W) inside A4, the final pallete video address.
  ADD.W       D5, A4                    ; Adds D5 to A4, the player pallete video offset.
  BSR         $8F34E                    ; Calls the code that sets the pallete from (A3) inside (A4).
  RTS                                   ; Returns back to the routine that called this code.
  TST.W       D3                        ; Compares 0 and D3.
  BEQ         $8F35A                    ; If it is 0, empty offset, go to the RTS line.
  MOVEQ       #$7, D3                   ; Stores 7 inside D3, 7 + 1 iterations.
  MOVE.L      (A3)+, (A4)+              ; Stores (A3)+ inside (A4)+, the color to the video memory.
  DBRA        D3, $8F354                ; Loops back to the code that sets the color, line above.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F3C0

                                        ; Block of code that randomizes the CPU pallete.
  MOVEM.L     D0-D7/A0-A6, -(A7)        ; Stores all registers inside -(A7), save their values.
  MOVE.L      A0, A1                    ; Stores A0 inside A1, the CPU memory region.
  BSR         $8F480                    ; Calls the code that randomizes a value.
  AND.W       #$7, D5                   ; D5 and 7, valid pallete ID is between 0 and 7.
  MOVE.B      D5, ($1EF, A1)            ; Stores D5 inside ($1EF + A1), the new pallete ID.
  BSR         $8F130                    ; Calls the code that stores the player ID inside D1.
  BSR         $8F24E                    ; Calls the code that solves color conflict.
  BSR         $8F300                    ; Calls the code that updates the palletes.
  MOVEM.L     (A7)+, D0-D7/A0-A6        ; Stores (A7)+ inside all registers, restore their values.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F400

                                        ; Block of code that resets the player data.
  BSET        #$1, ($BF, A1)            ; Sets the 2nd bit of ($BF + A1) to 1, set weak spot to visible.
  MOVEQ       #$0, D0                   ; Stores 0 inside D0, sprite flag.
  ADD.W       D1, D0                    ; Adds D1 to D0, sprite orientation, P1 is 0, P2 is 1.
  MOVE.B      D0, ($21, A1)             ; Stores D0 inside ($21 + A1), the player sprite flag.
  CLR.B       ($14A, A1)                ; Clears ($14A + A1), the weak spot points.
  MOVE.W      D1, D0                    ; Stores D1 inside D0, the player ID.
  LSL.W       #$2, D0                   ; Shifts left D0 bits by 2, 0 to 0, 1 to 4.
  ADD.W       D1, D0                    ; Adds D1 to D0, 0 to 0, 4 to 5.
  LSL.W       #$4, D0                   ; Shifts left D0 bits by 4, 0 to 0, 5 to 50.
  MOVE.B      D0, ($20, A1)             ; Stores D0 inside ($20 + A1), the player pallete flag.
  MOVEQ       #$58, D0                  ; Stores 58 inside D0, sprite position Y.
  MOVE.W      D0, ($00C4, A1)           ; Stores D0 inside ($C4 + A0), player sprite position Y.
  BSR         $8F540                    ; Calls the code that updates the sprite.
  BTST        D1, ($101000)             ; Compares 0 and the 1st bit of ($101000).
  BEQ         $8F44A                    ; If it is 0, inactive player, go to the line below 1st RTS.
  BTST        #$1, ($B8, A1)            ; Test the 2nd bit of ($B8 + A1), player character confirmed.
  BNE         $8F43C                    ; If it is not 0, confirmed, ignore the line below.
  CLR.W       ($1EE, A1)                ; Clears ($1EE, A1), random select flag and pallete ID.
  MOVE.W      D1, D0                    ; Stores D1 inside D0, player ID.
  LSL.W       #$6, D0                   ; Shifts left D0 bits by 6, 0 to 0, 1 to 40.
  ADD.W       #$260, D0                 ; Adds 260 to D0, P1 is 260, P2 is 2A0.
  MOVE.W      D0, ($00C0, A1)           ; Stores D0 inside ($C0 + A0), player sprite position X.
  RTS                                   ; Returns back to the routine that called this code.
  CLR.W       ($1EE, A1)                ; Clears ($1EE, A1), random select flag and pallete ID.
  MOVE.W      #$180, ($00C0, A1)        ; Stores 180 inside ($C0 + A0), out of screen sprite position X.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F480

                                        ; Block of code that randomizes a value inside D5.
  LEA         $10FE88, A4               ; Stores 10FE88 inside A4, the frames passed address.
  TST.W       ($172, A4)                ; Compares 0 and ($172 + A4), amount of times randomized.
  BEQ         $8F492                    ; If it is 0, change the seed ignore the 2 lines below.
  MOVE.L      ($174, A4), D5            ; Stores ($174 + A4) inside D5, current seed.
  BNE         $8F494                    ; If it is not 0, ignore the line below.
  MOVE.L      (A4), D5                  ; Stores (A4) inside D5, frames passed.
  ADD.W       #$FC15, D5                ; Adds FC15 to D5, part of the randomizer calculation.
  MULU.W      #$2AB, D5                 ; Multiplies D5 by 2AB, part of the randomizer calculation.
  MOVE.L      D5, D4                    ; Stores D5 inside D4, part of the randomizer calculation.
  LSR.L       #$8, D4                   ; Shifts right D4 bits by 8, part of the randomizer calculation.
  LSR.L       #$8, D4                   ; Shifts right D4 bits by 8, part of the randomizer calculation.
  EOR.L       D4, D5                    ; D5 exclusive or D4, part of the randomizer calculation.
  ADDQ.W      #$1, ($172, A4)           ; Adds 1 to ($172 + A4), the amount of times it randomized.
  AND.L       #$00FFFF, D5              ; D5 and FFFF, 16 bits randomizer.
  MOVE.W      D5, ($174, A4)            ; Stores D5 inside ($174 + A4), the new seed.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F500

                                        ; Block of code that randomizes the character and pallete.
  MOVE.B      D2, ($1EE, A1)            ; Stores D2 inside ($1EE + A1), the random select flag.
  BEQ         $8F524                    ; If it is 0, start wasn't pressed, go to the RTS line.
  CLR.L       D5                        ; Clears D5.
  BSR         $8F480                    ; Calls the code that randomizes a value.
  DIVU.W      #$D, D5                   ; Divides D5 by D, character ID goes from 0 to C, D is OX.
  SWAP        D5                        ; Invert D5 higher and lower bits, the rest of the division.
  MOVE.B      D5, ($1, A1)              ; Stores D5 inside ($1 + A1), the randomized character.
  CLR.L       D5                        ; Clears D5.
  BSR         $8F480                    ; Calls the code that randomizes a value.
  AND.W       #$7, D5                   ; D5 and 7, valid pallete ID is between 0 and 7.
  MOVE.B      D5, ($1EF, A1)            ; Stores D5 inside ($1EF + A1), the new pallete ID.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F540

                                        ; Block of code that updates the sprite.
  CLR.W       D3                        ; Clears D3.
  MOVE.B      ($1, A1), D3              ; Stores ($1 + A1) inside D3, the player character ID.
  ADD.W       D3, D3                    ; Add D3 to D3, doubles it, the sprite is 2 bytes.
  ADD.W       #$FCB2, D3                ; Adds FCB2 to D3, the sprite list offset at 8F200.
  MOVE.W      (PC, D3.W), D3            ; Stores (PC + D3.W) inside D3, the character sprite.
  MOVE.W      D3, ($22, A1)             ; Stores D3 inside ($22 + A1), updates the sprite.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F580

                                        ; Block of code that resets select screen data.
  LEA         $103424, A1               ; Stores 103424 inside A1, camera position address.
  MOVE.W      #$1E0, (A1)               ; Stores 1E0 inside (A1), resets camera position X.
  CLR.W       ($4, A1)                  ; Clears ($4 + A1), resets camera position Y.
  LEA         $66000, A3                ; Stores 66000 inside A3, 1st portrait ROM pallete address.
  LEA         $403280, A4               ; Stores 403280 inside A4, 2nd portrait video pallete address.
  MOVE.W      #$9F, D5                  ; Stores 9F inside D5, the amount of colors to copy - 1.
  MOVE.L      (A3)+, (A4)+              ; Stores (A3)+ inside (A4)+, the color to the video memory.
  DBRA        D5, $8F59E                ; Loops back to the code that sets the color, line above.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $8F5C0

                                        ; Block of code that randomizes a value inside D5.
  MOVE.W      ($10FE8A), D3             ; Stores ($10FE8A) inside D3, the frames passed.
  AND.W       #$3F, D3                  ; D3 and FF, a range from 0 to 3F, 1 to 64 iterations.
  BSR         $8F480                    ; Calls the code that randomizes a value.
  DBRA        D3, $8F5CA                ; Loops back to the code that randomizes a value, line above.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $D52E                     ; Replace D52E (There is space to replace everything).

                                        ; Block of code that removes a line that sets the pallete page.
  NOP                                   ; No operation, does nothing.
  NOP                                   ; No operation, does nothing.


; This module has several routines that handles the new features
; for the select screen present in this hack, things like pallete
; selection, drawing sprites, random select and everthing else
; that ensures the new select screen features will work as intended.
; 
; 08F000:   Initialize Extra Features (Select Screen Init)
; 08F050:   Executes Extra Features (Select Screen Loop)
; 08F0B0:   Handles Character Selection
; 08F0D0:   Randomizes CPU Pallete
; 08F100:   Randomizes Character And Pallete (Select Screen Init)
; 08F130:   Saves Player ID In D1
; 08F150:   Saves Player Start Press In D2
; 08F170:   Handles Pallete Selection
; 08F1C0:   Draws Player Character Sprite
; 08F240:   Confirms Character And Pallete Selected
; 08F300:   Updates Pallete
; 08F3C0:   Randomizes CPU Pallete
; 08F400:   Resets Player Data (Select Screen Init)
; 08F480:   Randomizes A Value In D5
; 08F500:   Randomizes Character And Pallete (Start Pressed)
; 08F540:   Updates The Sprite
; 08F580:   Resets Select Screen Data (Select Screen Init)
; 08F5C0:   Executes Frame Based Randomization (1 to 64)
; 00D52E:   Removes Default Pallete Selection
