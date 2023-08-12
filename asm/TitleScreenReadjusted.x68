*----------------------------------------------------------------------------------------------
* Title:        KARNOVRE Title Screen Readjusted
* Written by:   GameHackFan
* Date:         
* Description:  It has a routine that adds the extra text to the title screen.
*----------------------------------------------------------------------------------------------

  JSR         $FDF00                    ; Replace 143E2, 5890.

; ORG         $FDF00

                                        ; Block of code that writes the hack text in the title screen.
  JSR         $DFFC.L                   ; Code from the original game that was replaced.
  LEA         $FDF30, A2                ; Stores FDF30 inside A2, rom address where the text is located.
  LEA         $7195, A3                 ; Stores 7095 inside A3, position where the text will be draw.
  JSR         $DFFC.L                   ; Calls the code that draws the text in the screen.
  LEA         $FDF60, A2                ; Stores FDF60 inside A2, rom address where the text is located.
  LEA         $7042, A3                 ; Stores 7042 inside A3, position where the text will be draw.
  JSR         $DFFC.L                   ; Calls the code that draws the text in the screen.
  RTS                                   ; Returns back to the routine that called this code.


; This module has a routine that adds the hack text
; to the title screen.
; 
; 0FDF00:   Draws Title Screen Extra Text
; 0FDF30:   Hack Name And Version Text
; 0FDF60:   Hack Link Text