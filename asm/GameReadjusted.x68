*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Game Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  It contains several routines to fix the behavior of
*               the characters' moves, extra features added to the
*               game, and bug fixes.
*----------------------------------------------------------------------------------------------

  JSR         $FDB00                    ; Replace 4CBE.

; ORG         $FDB00

                                        ; Block of code that handles resetting the DM exectuted flag.
  MOVE.B      #$FF, ($147, A0)          ; Code from the original game that was replaced.
  CLR.B       ($1FF, A0)                ; Clears the DM executed flag.
  RTS                                   ; Returns back to the routine that called this code.


  JSR         $FDB20                    ; Replace 9492.

; ORG         $FDB20

                                        ; Block of code that draws the super indicator.
  TST.B       ($103A72)                 ; Compares 0 and ($103A72), round status flag.
  BNE         $FDB5C                    ; If it is not 0, round is stopped, go to the ADDQ last line.
  MOVEM.L     D0-D1/A3-A4, -(A7)        ; Stores D0 to D1 and A3 to A4 inside -(A7), save their values.
  MOVE.L      ($101420), A4             ; Stores ($101420) inside A4, the empty sprite memory region.
  MOVE.W      ($10FE8A), D0             ; Stores ($10FE8A) inside D0, frames passed.
  AND.W       #$8, D0                   ; D0 and 8, the result is a value between 0 and 7, blink effect.
  LEA         $103670, A3               ; Stores $103670 inside A3, P1 memory region.
  MOVE.W      #$7025, D1                ; Stores 7025 inside D1, P1 super indicator position.
  BSR         $FDB64                    ; Calls the code that draws the super indicator sprite.
  LEA         ($200, A3), A3            ; Stores ($200 + A3) inside A3, P2 memory region.
  MOVE.W      #$74C5, D1                ; Stores 74C5 inside D1, P2 super indicator position.
  BSR         $FDB64                    ; Calls the code that draws the super indicator sprite.
  MOVE.L      A4, ($101420)             ; Stores A4 inside ($101420), the next empty sprite region.
  MOVEM.L     (A7)+, D0-D1/A3-A4        ; Stores (A7)+ inside D0 to D1 and A3 to A4, restore their values.
  MOVE.W      D0, $106940               ; Code from the original game that was replaced.
  RTS                                   ; Returns back to the routine that called this code.
  CMP.B       #$7F, ($147, A3)          ; Compares 7F and ($147 + A3), the character HP.
  BHI         $FDB86                    ; If it is higher than 7F, has at least 50% HP, go to the RTS line.
  MOVE.W      D1, (A4)+                 ; Stores D1 inside (A4+), the super indicator position.
  TST.B       ($1FF, A3)                ; Compares 0 and ($1FF + A3), if a DM was executed already.
  BNE         $FDB80                    ; If it is not 0, DM was already used, go to the below the RTS line.
  MOVE.W      D0, D1                    ; Stores D0 inside D1, 0 to 7.
  LSL.W       #$8, D1                   ; Shifts left D1 bits by 8, 8 to 800, 0 to 0.
  LSL.W       #$1, D1                   ; Shifts left D1 bits by 8, 800 to 1000, 0 to 0.
  ADD.W       #$2352, D1                ; Stores 2352 inside D1, the super indicator R letter.
  BRA         $FDB84                    ; Ignore the line below.
  MOVE.W      #$2320, D1                ; Stores 2320 inside D1, the empty sprite.
  MOVE.W      D1, (A4)+                 ; Stores D1 inside (A4)+, the sprite in the video layer memory region.
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
  LSR.B       #4, D0                    ; Shifts right D0 bits by 4, butons as the left digit.
  AND.W       #$3, D0                   ; D0 and 3, both punch buttons.
  MOVE.B      (A1, D0.W), D0            ; Stores (A1 + D0.W) inside D0, move shift ID.
  RTS                                   ; Returns back to the routine that called this code.


; ORG         $FF450

                                        ; Block of code that calculates the move shift amount for kick moves.
  LEA         $16488, A1                ; Stores 16488 inside A1, move shift data list.
  MOVE.B      ($B1, A0), D0             ; Stores ($B1 + A0) inside D0, buttons pressed.
  LSR.B       #4, D0                    ; Shifts right D0 bits by 4, butons as the left digit.
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


; ORG         $95E2                    ; Replace 95E2 (There is space to replace everything).

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

                                        ; Block of code that increases the weak spot hit to 5.
  MOVE.B      ($14A, A0), D4            ; Stores ($14A + A0) inside D4, weak spot damage.
  ADDQ.B      #$1, D4                   ; Adds 1 to D4, increases the damage done.
  CMP.B       #$4, D4                   ; Compares 4 and D4, if the current hit is the 4th one.
  BCS         $40C0                     ; If it is smaller than 4, ignore the line below.
  MOVEQ       #$FF, D4                  ; Store FF inside D4, the last hit value.
  MOVE.B      D4, ($14A, A0)            ; Stores D4 inside ($14A + A0), the updated weak spot damage.
  NOP                                   ; No operation, does nothing.


; ORG         $B188                     ; Replace B188 (There is space to replace everything).

                                        ; Block of code that fixes the P1 frame disadvantage (Attack Hit Freeze).
  MOVE.L      ($14, A0), A1             ; Code from the original game that was replaced.
  MOVE.B      ($14C, A1), D0            ; Stores ($14C + A1) inside D0, the player ID.
  CMP.B       (A1), D0                  ; Compares (A1) and D0, former TST, frame advantage bug fix.
  BLS         $B1AA                     ; If it is D0 or less, go to the B1AA line (previously only 0).
  BTST        #$2, ($146, A1)           ; Code from the original game that was replaced.
  BEQ         $B1FA                     ; Code from the original game readjusted.


; This module has several features to handle the extra features
; added to the game, like extra moves, DM, bug fixes present
; in the move of some characters, and other bug fixes. It also 
; has helper routines that is used by new moves.
; 
; 0FDB00:   Resets DM Executed Flag
; 0FDB20:   Draws Super Indicator
; 0FF000:   Handles Custom Move Behavior
; 0FF080:   Sets Custom Move Translation (Ground Move)
; 0FF040:   Sets Custom Move Translation (Jumping Move)
; 0FF100:   Plays Custom Move Sound Effect
; 0FF200:   Sets Custom Move Translation (Ground Move)
; 0FF240:   Sets Custom Move Translation (Jumping Move)
; 0FF290:   Fixes Karnov Teleport Bug
; 0FF2B0:   Modifies Zesshouhohou
; 0FF2E0:   Activates DM Executed Flag (1A49A)
; 0FF300:   Activates DM Executed Flag (1A5B8)
; 0FF320:   Activates DM Executed Flag (1A982)
; 0FF340:   Stores Opponent Memory Region In A1
; 0FF360:   Sets Grab Move Necessary Flags
; 0FF3A0:   Fixes Zazie / Jean Wrong Animation Duration
; 0FF3E0:   Forces Ryoko To Choke Only 3 Times
; 0FF420:   Calculates Move Shift Amount (Punch Button)
; 0FF450:   Calculates Move Shift Amount (Kick Button)
; 0FF480:   Fixes Ryoko's Bakushin Translation Data
; 0FF4D0:   Fixes Lee's Long Ti Translation Data
; 0095E2:   Randomizes The Stage
; 003F1C:   Decreases Weak Spot Damage
; 0040B2:   Increases Weak Spot Resistance To 5 Hits
; 00B188:   Fixes P1 Frame Disadvantage (Attack Hit Freeze)