ORG 100h

JMP START

;====================================================
; VOTING MACHINE - DATA SECTION
; This section contains all messages and variables
;====================================================

MSG_TITLE DB 13,10,'***** VOTING MACHINE *****',13,10,'$'

MENU1 DB '1. Candidate A',13,10,'$'
MENU2 DB '2. Candidate B',13,10,'$'
MENU3 DB '3. Candidate C',13,10,'$'
MENU4 DB '4. Show Result and Exit',13,10,'$'

PROMPT  DB 13,10,'Enter Vote (1-4): $'
INVALID DB 13,10,'Invalid Input!',13,10,'$'

RESULTMSG DB 13,10,13,10,'===== FINAL RESULT =====',13,10,'$'

MSGA DB 13,10,'Candidate A Votes: $'
MSGB DB 13,10,'Candidate B Votes: $'
MSGC DB 13,10,'Candidate C Votes: $'

WINA DB 13,10,'Winner: Candidate A','$'
WINB DB 13,10,'Winner: Candidate B','$'
WINC DB 13,10,'Winner: Candidate C','$'

; Vote counters (initially zero)
VOTEA DB 0
VOTEB DB 0
VOTEC DB 0

;====================================================
; CODE SECTION - PROGRAM START
;====================================================

START:

MAINMENU:

    ;--------------------------------------------
    ; Display system title
    ;--------------------------------------------
    MOV DX, OFFSET MSG_TITLE
    MOV AH, 09H
    INT 21H

    ;--------------------------------------------
    ; Display voting menu options
    ;--------------------------------------------
    MOV DX, OFFSET MENU1
    MOV AH, 09H
    INT 21H

    MOV DX, OFFSET MENU2
    MOV AH, 09H
    INT 21H

    MOV DX, OFFSET MENU3
    MOV AH, 09H
    INT 21H

    MOV DX, OFFSET MENU4
    MOV AH, 09H
    INT 21H

    ;--------------------------------------------
    ; Ask user to enter vote
    ;--------------------------------------------
    MOV DX, OFFSET PROMPT
    MOV AH, 09H
    INT 21H

    ;--------------------------------------------
    ; Take single character input from user
    ;--------------------------------------------
    MOV AH, 01H
    INT 21H

    ;--------------------------------------------
    ; Compare input and redirect accordingly
    ;--------------------------------------------
    CMP AL, '1'
    JE CAND_A

    CMP AL, '2'
    JE CAND_B

    CMP AL, '3'
    JE CAND_C

    CMP AL, '4'
    JE SHOWRESULT

    ;--------------------------------------------
    ; If invalid input, show error message
    ;--------------------------------------------
    MOV DX, OFFSET INVALID
    MOV AH, 09H
    INT 21H

    JMP MAINMENU

;====================================================
; VOTING SECTION - INCREMENT VOTES
;====================================================

CAND_A:
    INC BYTE PTR [VOTEA]
    JMP MAINMENU

CAND_B:
    INC BYTE PTR [VOTEB]
    JMP MAINMENU

CAND_C:
    INC BYTE PTR [VOTEC]
    JMP MAINMENU

;====================================================
; RESULT SECTION - DISPLAY FINAL OUTPUT
;====================================================

SHOWRESULT:

    ; Print result header
    MOV DX, OFFSET RESULTMSG
    MOV AH, 09H
    INT 21H

    ;--------------------------------------------
    ; Display Candidate A votes
    ;--------------------------------------------
    MOV DX, OFFSET MSGA
    MOV AH, 09H
    INT 21H

    MOV DL, [VOTEA]
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    ;--------------------------------------------
    ; Display Candidate B votes
    ;--------------------------------------------
    MOV DX, OFFSET MSGB
    MOV AH, 09H
    INT 21H

    MOV DL, [VOTEB]
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    ;--------------------------------------------
    ; Display Candidate C votes
    ;--------------------------------------------
    MOV DX, OFFSET MSGC
    MOV AH, 09H
    INT 21H

    MOV DL, [VOTEC]
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

;====================================================
; WINNER CALCULATION LOGIC
;====================================================

    ; Start comparison from Candidate A
    MOV AL, [VOTEA]

    CMP AL, [VOTEB]
    JB CHECK_B

    CMP AL, [VOTEC]
    JB CHECK_C

    ; If A is highest or equal
    MOV DX, OFFSET WINA
    MOV AH, 09H
    INT 21H
    JMP EXIT

CHECK_B:

    ; Compare B with C
    MOV AL, [VOTEB]

    CMP AL, [VOTEC]
    JB CHECK_C

    ; If B is highest
    MOV DX, OFFSET WINB
    MOV AH, 09H
    INT 21H
    JMP EXIT

CHECK_C:

    ; If C is highest
    MOV DX, OFFSET WINC
    MOV AH, 09H
    INT 21H

;====================================================
; PROGRAM TERMINATION
;====================================================

EXIT:
    MOV AH, 4CH
    INT 21H