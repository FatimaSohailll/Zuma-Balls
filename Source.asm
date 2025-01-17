INCLUDE Irvine32.inc
include macros.inc
INCLUDELIB winmm.lib

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD
.data

; bottom frame: 27, top: , left1=95 , right1=20 mostinnerB=21, mostInnerRight=89

zumbaTitle1    db '                   ******* _________   ___   ___   __      __    ________',0
zumbaTitle2    db '                          |______  ||  | ||  | ||  | \    / ||  | ____  || ',0
zumbaTitle3    db '                                /  ||  | ||  | ||  |  \  /  ||  | ||  | ||  ',0 
zumbaTitle4    db '                               /  //   | ||  | ||  |   \/   ||  | ||__| ||    ',0 
zumbaTitle5    db '                              /  //    | ||  | ||  | |\  /| ||  |  ___| ||    ',0
zumbaTitle6    db '                             /  //     | ||  | ||  | ||\/ | ||  | ||  | ||     ',0 
zumbaTitle7    db '                            /  //      | ||  | ||  | ||   | ||  | ||  | ||     ', 0
zumbaTitle8    db '                           /  //_____  | |/__| ||  | ||   | ||  | ||  | ||    ', 0
zumbaTitle9    db '                          |_________/  |_______|/  |_|/   |_|/  |_|/  |_|/ ', 0
zumbaTitle10   db '                                                                           *******',0 
               db 0                                                      

START             DB '                                               ___  ___  ____  ____ ____   ',13,10
                  DB '                                              / __ |_ _|| __ || __ ||_ _|  ',13,10
                  DB '                                              \__ \ | | | || || -- / | |   ',13,10
                  DB '                                              <___/ |_| |_||_||_|\_\ |_|   ',13,10
                  DB 0

INSTRUCTIONS    DB '                                     _ _ _ ___ ___ ___ _  _ ____ ____ __ ___    _ ____',13,10
                DB '                                    | | \ / __|_ _| . ||| ||| __||_ _|| | | |\ | || __>',13,10
                DB '                                    | |   \__ \| ||   /||_||||__  | | | | | | \| | \ _\',13,10
                DB '                                    |_|_\_<___/|_||_\_`|___|`___/ |_| |_|___|_|\_|<___/',13,10
                DB 0
            
EXITED           DB '                                                  _____  _ _ ___   ',13,10
                 DB '                                                 | __\ \/ | |_ _|  ',13,10
                 DB '                                                 | _> \ \ | || |   ',13,10
                 DB '                                                 |____/\_\|_||_|   ',13,10
                 DB 0
                                           
 
pauseScreen         db" ", 13,10
                    db'                                            ___ ____  ___ _  _  _  _  ___ ',13,10
                    db'                                           | __|| __|/ __| || || \/ || __|',13,10
                    db'                                           | . /| _> \__ \ || ||    || _> ',13,10
                    db'                                           |_\_`|___|<___/\__/ |_||_||___|',13,10
                    db' ',13,10
                    db' ',13,10
                    db' ',13,10
                    DB '                                                  _____  _ _ ___ ',13,10
                    DB '                                                 | __\ \/ | |_ _|',13,10
                    DB '                                                 | _> \ \ | || |',13,10
                    DB '                                                 |____/\_\|_||_|',13,10
                    DB 0

winner              db" ", 13,10
                    db'                                            _   _  _  _   _  _   _ ____  ___',13,10
                    db'                                           | |_| || || | | || | | || __|| __|',13,10
                    db'                       >>>>>>>>>>>>>>>     | ___ || || _\| || _\| || _> | . /',13,10
                    db'                                           |/   \||_||_| \_||_| \_||___||_\_`',13,10
                    db 0

INSTRUCTIONS_SCREEN             db'Controls:',13,10
                               db' ',13,10
                               db' 1-Use the (q w e a z x s d) to rotate the frog.',13,10
                               db' 2-In level 2 & 3, use the (s) key to slow down the balls.',13,10
                               db' 3-In level 3, use the (o) key to use the explosion to get 3 bonus points',13,10
                               db' 4-Use (p) key to pause the game, and then press 1 for resume or 2 for exit.',13,10
                               db'  ',13,10
                               db' Gameplay:',13,10
                               db' ',13,10
                               db' 1-Hit the balls with the same color as the bullet.' ,13,10
                               db' 2-Avoid hitting a different colored ball as that will decrease the score.',13,10
                               db' 3-Speed increases in each level. ',13,10
                               db' 4-Variety of coloures also increases in each level.',13,10
                               db' 5-You need a score of min 5 points in level 1 to go to level 2. ',13,10
                               db' 6-You need a score of min 9 points in level 2 to go to level 3.  ',13,10
                               db' 7-You need a score of min 9 points in level 3 to win.',13,10
                               db' 8-You get a slow-down powerup, if you hit a chain of 3 same coloured balls . ',13,10
                               db'  ',13,10
                               db' Scoring:',13,10
                               db'  ',13,10
                               db' 1-If you hit the balls with the same color as the bullet, the score increment is the',13,10
                               db '  number of same colored balls shot.',13,10
                               db' 2-Hitting a different colored ball decreases the score by 1 point.',13,10
               
                               db' ',13,10
                               db' Game Over:',13,10
                               db' ',13,10
                              db' 3-if the score is 0 and you hit a different coloured ball, you loose a life.',13,10
                               db' 4-If you loose three Lives, game over.',13,10
                               db 0
                               
 gameOverScreen   db'                    ______        ______  _______     _____  _    _ _______ ______                                    ',13,10
                  db'                   / _____)  /\  |  ___ \(_______)   / ___ \| |  | (_______(_____ \                                    ',13,10
                  db'                  | /  ___  /  \ | | _ | |_____     | |   | | |  | |_____   _____) )                                   ',13,10
                  db'                  | | (___)/ /\ \| || || |  ___)    | |   | |\ \/ /|  ___) (_____ (                                    ',13,10
                  db'                  | \____/| |__| | || || | |_____   | |___| | \  / | |_____      | |                                   ',13,10
                  db'                   \_____/|______|_||_||_|_______)   \_____/   \/  |_______)     |_|                                   ',13,10
                  db 0 
pauseKey db 0
paused db 0

temp byte ?
temporary dw ?
addressTemp dd ?

strScore BYTE "Your score is: ",0
prompt1 db "Enter your name:",0
names db 20 dup (32)
strName db "Name:",0
tempAdd dd ?
livesString db "Lives:",0
lineCheck db 0
HighScores db "HIGHSCORES:",13,10,0
levelNumberCurr db 1
currBallNum db 1

dummyY db 13
walls     BYTE " _____________________________________________________________________________ ", 13,10
          BYTE "                   |                                                                             |", 13,10
          BYTE "                   |                                                                             |", 13,10
          BYTE "                   |                                                                             |", 13,10
          BYTE "                   |       ______________________________________________________________        |", 13,10
          BYTE "                   |       |                                                             |       |", 13,10
          BYTE "                   |       |                                                             |       |", 13,10
          BYTE "                   |       |                                                             |       |", 13,10
          BYTE "                   |       |                                                             |       |", 13,10
          BYTE "                   |       |                                                             |       |", 13,10
          BYTE "                   |       |                              ---                            |       |", 13,10
          BYTE "                   |       |                             |   |                           |       |", 13,10
          BYTE "                   |       |                             |   |                           |       |", 13,10
          BYTE "                   |       |       |                     |   |                           |       |", 13,10
          BYTE "                   |       |       |                      ---                            |       |", 13,10
          BYTE "                   |       |       |                                                     |       |", 13,10
          BYTE "                   |       |       |                                                     |       |", 13,10
          BYTE "                   |       |       |                                                     |       |", 13,10
          BYTE "                   |       |       |_____________________________________________________|       |", 13,10
          BYTE "                   |       |                                                                     |", 13,10
          BYTE "                   |       |                                                                     |", 13,10
          BYTE "                   |       |_____________________________________________________________________|", 13,10
          BYTE "                   |                                                                             |", 13,10
          BYTE "                   |                                                                             |", 13,10
          BYTE "                   |_____________________________________________________________________________|", 13,10
          BYTE 0

walls3     BYTE " _____________________________________________________________________________ ", 13,10
          BYTE "                   |                                                                             |", 13,10
          BYTE "                   |                                                                             |", 13,10
          BYTE "                   |                                                                             |", 13,10
          BYTE "                   |               _________         ____________________________________        |", 13,10
          BYTE "                   |       |       |        |       |                                    |       |", 13,10
          BYTE "                   |       |       |        |       |                                    |       |", 13,10
          BYTE "                   |       |       |        |       |                                    |       |", 13,10
          BYTE "                   |       |       |        |       |                                    |       |", 13,10
          BYTE "                   |       |       |        |       |                                    |       |", 13,10
          BYTE "                   |       |       |________|       |     ---                            |       |", 13,10
          BYTE "                   |       |                        |    |   |                           |       |", 13,10
          BYTE "                   |       |                        |    |   |                           |       |", 13,10
          BYTE "                   |       |________________________|    |   |         _______________   |       |", 13,10
          BYTE "                   |       |                              ---         |              |   |       |", 13,10
          BYTE "                   |       |                                          |              |   |       |", 13,10
          BYTE "                   |       |                                          |              |   |       |", 13,10
          BYTE "                   |       |                                          |      |       |   |       |", 13,10
          BYTE "                   |       |                                          |      |       |   |       |", 13,10
          BYTE "                   |       |                                          |      |       |   |       |", 13,10
          BYTE "                   |       |                                          |      |       |   |       |", 13,10
          BYTE "                   |       |__________________________________________|      |       |___|       |", 13,10
          BYTE "                   |                                                         |                   |", 13,10
          BYTE "                   |                                                         |                   |", 13,10
          BYTE "                   |_________________________________________________________|___________________|", 13,10
          BYTE 0
walls2     BYTE "             ________________________________________________________", 13,10
          BYTE "                                                                                        \", 13,10
          BYTE "                                                                                         \", 13,10
          BYTE "                                                                                          \", 13,10
          BYTE "                                 ___________________________________________________       \", 13,10
          BYTE "                                /                                                   \       \", 13,10
          BYTE "                               /                                                     \       \", 13,10
          BYTE "                              /                                                       \       \", 13,10
          BYTE "                             /                                                         \       \", 13,10
          BYTE "                            /                                                           \       \", 13,10
          BYTE "                           /                              ---                            \       \", 13,10
          BYTE "                           |       |                     |   |                           |       |", 13,10
          BYTE "                           |       |                     |   |                           |       |", 13,10
          BYTE "                           |       |                     |   |                           |       |", 13,10
          BYTE "                           |       |                      ---                            |       |", 13,10
          BYTE "                           |        \                                                    /      /", 13,10
          BYTE "                            \        \                                                  /      /", 13,10
          BYTE "                             \        \                                                /      /", 13,10
          BYTE "                              \        \______________________________________________/      /", 13,10
          BYTE "                               \                                                            /", 13,10
          BYTE "                                \                                                          /", 13,10
          BYTE "                                 \________________________________________________________/", 13,10
          BYTE 0
    ; Player sprite
    player_right BYTE "   ", 0
                 BYTE " O-", 0
                 BYTE "   ", 0 

    player_left BYTE "   ", 0
                BYTE "-O ", 0
                BYTE "   ", 0

    player_up BYTE " | ", 0
              BYTE " O ", 0
              BYTE "   ", 0

    player_down BYTE "   ", 0
                BYTE " O ", 0
                BYTE " | ", 0

    player_upright BYTE "  /", 0
                   BYTE " O ", 0
                   BYTE "   ", 0

    player_upleft BYTE "\  ", 0
                  BYTE " O ", 0
                  BYTE "   ", 0

    player_downright BYTE "   ", 0
                     BYTE " O ", 0
                     BYTE "  \", 0

    player_downleft BYTE "   ", 0
                    BYTE " O ", 0
                    BYTE "/  ", 0

                         anim4      db"       .---.     ",13,10
                                    db"       (\|/)     ",13,10
                                    db"       --0--     ",13,10
                                    db"       (/|\)     ",13,10,0
                                    db"                 ",13,10
                         anim5      db"      '.\|/.'    ",13,10
                                    db"      (\   /)    ",13,10
                                    db"      - -O- -    ",13,10
                                    db"      (/   \)    ",13,10
                                    db"      ,'/|\'.    ",13,10,0
                         anim6      db"   '.  \ | /  ,' ",13,10
                                    db"     `. `.' ,'   ",13,10
                                    db"    ( .`.|,' .)  ",13,10
                                    db"    - ~ -0- ~ -  ",13,10
                                    db"    (            ",13,10,0
                         anim7      db"                 ",13,10
                                    db"   ','|'.` )     ",13,10
                                    db"     .' .'. '.   ",13,10
                                    db"   ,'  / | \  '. ",13,10
                                    db"       \ '  '    ",13,10
                                    db"    ` . `.' ,'   ",13,10
                                    db"    . `` ,'. '   ",13,10
                                    db"      ~ (   ~ -  ",13,10
                                    db"   '             ",13,10,0
                        anim8       db"                 ",13,10
                                    db"   . ','|` ` .   ",13,10
                                    db"     .'  '  '    ",13,10
                                    db"   ,   ' , '  `  ",13,10,0
                        anim9       db"                 ",13,10
                                    db"      (  ) (     ",13,10
                                    db"       ) ( )     ",13,10
                                    db"       (  )      ",13,10
                                    db"        ) /      ",13,10
                                    db"       ,---.     ",13,10,0

    ; Player's starting position (center)
    xPos db 56      ; Column (X)
    yPos db 15      ; Row (Y)

    xDir db 0
    yDir db 0

    ; Default character (initial direction)
    inputChar db 0
    direction db "d"

    ; Colors for the emitter and player
    color_red db 4       ; Red
    color_green db 2     ; Green
    color_yellow db 14   ; Yellow (for fire symbol)

    current_color db 4   ; Default player color (red)

    emitter_color1 db 2  ; Green
    emitter_color2 db 4  ; Red

    fire_color db 14     ; Fire symbol color (Yellow)

    ; Emitter properties
    emitter_symbol db "#"
    emitter_row db 0    ; Two rows above player (fixed row for emitter)
    emitter_col db 1    ; Starting column of the emitter

    ; Fire symbol properties (fired from player)
    fire_symbol db "*", 0
    fire_row db 0        ; Fire will be fired from the player's position
    fire_col db 0        ; Initial fire column will be set in the update logic

    ; Interface variables
    score db 0          ; Player's score
    lives db 3          ; Player's lives
    levelInfo db 1
    
    ; Counter variables for loops
    counter1 db 0
    counter2 db 0
    timerBalls dd 0
      colorArray db 150 dup(?)
    colorRangeL1 dd 5
    colorRangeL2 dd 10
    colorRangeL3 dd 14
    currColorR dd 5
    startX db 26
    startY db 6
    x db 0

    timePassed db 5
    speed dd 700
    menuSelect db 0

    ;FileHandling
    nameBytes dd ?
    space2 db "        Level: ",0
    endLine db " ",13,10
    space1 db "        Score: ",0
    scoreFile db "Scores.txt",0
    fileHandle  HANDLE ?
    BUFSIZE = 5000
    buffer BYTE BUFSIZE DUP(?)
    bytesRead DWORD ?
    readfile1 db 255 dup(?)
    dataread db 255 dup(?)
    datareadbytes db ?
    numscr1 dw ?
    currBulletX db 0
    currBulletY db 0

    currScore db 0
    slowDown db 1
    explode db 2
    isSlow db 0
    isExplode db 0
    currSp db 0
    soundFile BYTE "Gameplay.wav", 0 
    deviceConnect BYTE "DeviceConnect",0
    levelComp BYTE "levelComplete.wav", 0
    Bonus   Byte "bonus.wav", 0
    won BYTE "winGame.wav", 0
    unlock BYTE "powerUpUnlock.wav", 0
   explosion BYTE "explosion.wav", 0
.code


main proc
    INVOKE PlaySound, OFFSET soundFile,NULL, 2001h

	call TitleScreen ;screen with title
    call NameScreen
    call MenuScreen  ; draw menu screen

    cmp menuSelect,1
    je startGame
    cmp menuSelect,2
    je INSTRUCTIONSSCREEN
    cmp menuSelect,3
    je exitGame

    INSTRUCTIONSSCREEN:
        call InstructionScreen

    startGame:
        call GamePlay
    exitGame:
        call ShowExitGame

invoke exitprocess, 0
main endp

Level3 proc
    mov levelInfo, 3
    mov startX, 29
    mov startY, 6
    mov lives, 3
    mov score, 0
    mov speed, 50
    mov currSp, 50
    mov currBallNum, 0
    mov slowDown, 1
    call randomizeBallColor
    call InitialiseScreen
    mov eax, 1000
    call delay
    gameLoop:
        call updateBalls3
        cmp isSlow, 0
        je skip
        cmp timePassed, 0
        jl skip
        jg decrease
        decrease:
        dec timePassed
        call checkPowerUp
        skip:
        call movePlayer
        push speed     ; Duration in milliseconds
        call Sleep       ; Call the Windows Sleep API
        cmp inputChar, "s"
        jne skipSlow
        mov timePassed, 10
        mov isSlow, 1
        call checkPowerUp
        skipSlow:
        cmp inputChar, "o"
        jne skipExp
        call checkRandomExplosion
        skipExp:
        cmp inputChar, "p"
        jne skipPause
        PauseMenu:
            call ShowPauseScreen
            call InitialiseScreen
        skipPause:
        cmp score, 1
        jge endL
        cmp lives, 0
    jg gameLoop
   endL:
   ret
Level3 endp

checkBallPos3 proc
    movsx ecx, currBallNum
    cmp ecx, (lengthof colorArray)*3/4
    jl nothing
    mov dh, startY
    mov dl, startX
    call gotoxy
    mwrite " "
    cmp startX, 29
    jle incY
        cmp startX,47
        jl incX
        cmp startX, 93
        jl moveUp
        jge decB
    jmp return
    incY:
        cmp startY, 16
        jge incX
        inc startY
        jmp nothing
    goDown:
          inc startY
        jmp nothing
    incX:
        inc startX
        jmp nothing
    decB:
        cmp startY,27
        jge decX
        inc startY
        jmp nothing
    decX:
        cmp startX, 73
        jle t
        cmp startX, 80
        jle goUp
      t:  dec startX
        jmp nothing
    goUp:
        cmp startY, 20
        jle goLeft
        dec startY
        jmp nothing
    goLeft:
        cmp startX,47
        jle decY
        cmp startX, 73
        jle goDown
        dec startX
        jmp nothing
    moveUp:
        cmp startY, 6
        jle incX
        cmp startY, 27
        jge decX
        cmp startY, 20
        jle goLeft
        cmp startX, 73
        jle goDown
     decY:
        dec startY
    nothing:
        inc currBallNum
    return:
        ret
checkBallPos3 endp

updateBalls3 proc
    cmp startX, 35
    jnge check
    cmp startY, 16
    jle noCheck
    check:
        call checkBallPos3

    noCheck:
        mov ecx,0
        mov cl, currBallNum
        mov esi, offset colorArray
        mov eax, 0
        inc esi
        mov bl, startX ; starting x
        mov dl, startY ;starting y
    L1:
        mov al,[esi]
        cmp bl, 29
        jle incY
        cmp bl,47
        jl incX
        cmp bl, 93
        jl moveUp
        jge decB
        jmp nothing
    incY:
        cmp dl, 16
        jge incX
        inc dl
        jmp nothing
    goDown:
          inc dl
        jmp nothing
    incX:
        inc bl
        jmp nothing
    decB:
        cmp dl,27
        jge decX
        ;cmp bl, 34
        ;jle moveup
        inc dl
        jmp nothing
    decX:
        cmp bl, 73
        jle t
        cmp bl, 80
        jle goUp
      t:  dec bl
        jmp nothing
    goUp:
        cmp dl, 20
        jle goLeft
        dec dl
        jmp nothing
    goLeft:
        cmp bl,47
        je decY
        jl decX
        cmp bl, 73
        jle goDown
        dec bl
        jmp nothing
    moveUp:
        cmp dl, 6
        jle incX
        cmp dl, 27
        jge decX
        cmp dl, 20
        jle goLeft
        cmp bl, 73
        jle goDown
     decY:
       dec dl
    nothing:
       call doNothing
    noCollide:
        cmp bl, 93
        jge next
      call noColl
    next:
    inc esi
    loop L1

    break1:
        mov eax, white
        call settextcolor
    ret
updateBalls3 endp
noColl proc
     mov al, [esi]
        call settextcolor
        mWrite "O"
    ret
noColl endp

Level2 proc
    mov levelInfo, 2
    mov startX, 34
    mov startY, 6
    mov lives, 3
    mov score, 0
    mov currSp, 100
    mov speed, 100
    mov currBallNum, 0
    call randomizeBallColor
    call InitialiseScreen
    mov eax, 1000
    call delay
    gameLoop:
        call updateBalls2
        cmp isSlow, 0
        je skip
        cmp timePassed, 0
        jl skip
        jg decrease
        decrease:
        dec timePassed
        call checkPowerUp
        skip:
        call movePlayer
        push speed     ; Duration in milliseconds
        call Sleep       ; Call the Windows Sleep API
        cmp inputChar, "s"
        jne skipSlow
        mov timePassed, 10
        mov isSlow, 1
        call checkPowerUp
        skipSlow:
        cmp inputChar, "p"
        jne skipPause
        PauseMenu:
            call ShowPauseScreen
            call InitialiseScreen
        skipPause:
        cmp score, 1
        jge endL
        cmp lives, 0
    jg gameLoop
   ; call gameOver
   endL:
   ret
Level2 endp

checkRandomExplosion proc
    cmp explode, 0
    jle return
    mov eax,1000
    call delay 
    ;call clrscr
    INVOKE PlaySound, OFFSET explosion,NULL, 2001h
    mov dl,startX
    mov dh,startY
    call gotoxy
    mov eax,white
    call settextcolor
    mov edx,offset anim4
    call writestring
    mov eax,100
    call delay
    ;call clrscr

    mov dl,startX
    mov dh,startY
    call gotoxy
    mov eax,red
    call settextcolor
    mov edx,offset anim5
    call writestring
    mov eax,100
    call delay
    ;call clrscr

    mov dl,startX
    mov dh,startY
    call gotoxy
    mov eax,white
    call settextcolor
    mov edx,offset anim6
    call writestring
    mov eax,100
    call delay
    ;call clrscr

    mov dl,startX
    mov dh, startY
    call gotoxy
    mov eax,red
    call settextcolor
    mov edx,offset anim7
    call writestring
    mov eax,100
    call delay
    ;call clrscr

    mov dl,startX
    mov dh,startY
    call gotoxy
    mov eax,white
    call settextcolor
    mov edx,offset anim8
    call writestring
    mov eax,100
    call delay
    ;call clrscr

    mov dl,startX
    mov dh,startY
    call gotoxy
    mov eax,red
    call settextcolor
    mov edx,offset anim9
    call writestring
    mov eax,100
    call delay
    call clrscr
    dec explode
    add score, 2
    call initialiseScreen
    INVOKE PlaySound, OFFSET soundFile,NULL, 2001h
    return:
        mov currScore, 0
        ret
checkRandomExplosion endp



checkPowerUp proc
    cmp isSlow, 1
    jne return
    cmp slowDown, 0
    jle return
    cmp timePassed, 10
    jne next
    next:
    mov speed, 900
    cmp timePassed, 0
    jg return
     dec slowDown
      mov eax, gray + (black*16)
	    call SetTextColor
        mov dl, 100
	    mov dh,6
	    call Gotoxy
        mWrite "Slow Down: " 
        mov al, slowDown
	    call WriteDec
    movsx ecx, currSp
     mov speed, ecx
     mov isSlow, 0
     mov timePassed, 10
    return:
        mov currScore, 0
        ret
checkPowerUp endp

updateBalls2 proc
    cmp startX, 50
    jnge check
    cmp startY, 6
    jge noCheck
    check:
        call checkBallPos2

    noCheck:
        mov ecx,0
        mov cl, currBallNum
        mov esi, offset colorArray
        mov eax, 0
        inc esi
        mov bl, startX ; starting x
        mov dl, startY ;starting y
    L1:
        mov al,[esi]
        cmp bl, 84
        jl incX
        cmp dl,19
        jge decB
        inc dl
        cmp dl,16
        jge nothing
        inc bl
        jmp nothing
    incX:
        cmp dl,6 
        jg decB
        inc bl
        jmp nothing
    decB:
        cmp dl,24
        jge decX
        cmp bl, 34
        jle moveup
        inc dl
    decX:
        cmp bl, 34
        jle moveUp
        dec bl
        jmp nothing
    moveUp:
        dec dl
        cmp dl, 19
        jle nothing
        dec bl
    nothing:
       call doNothing
    noCollide:
        mov al, [esi]
        call settextcolor
        mWrite "O"
        inc esi
    loop L1

    break1:
        mov eax, white
        call settextcolor
    ret
updateBalls2 endp

doNothing proc
        mov dh, dl
        mov dl, bl
        call gotoxy
        cmp dl, currBulletX
        mov dl, dh
        jne return
        cmp dh, currBulletY
        jne return
        push eax
        push ecx
        push esi
        call adjustCollide
        pop esi
        pop ecx
        pop eax
        mov dl, bl
        call gotoxy
        mov dl, dh
    return:
    ret
doNothing endp

checkBallPos2 proc
    movsx ecx, currBallNum
    cmp ecx, (lengthof colorArray)*3/4
    jl nothing
    mov dh, startY
    mov dl, startX
    call gotoxy
    mwrite " "
    cmp startX, 84
    jl incX
    cmp startY,19
    jge decB
    cmp startY, 24
    jl incY
    jmp return

    incY:
        inc startY
        jmp return
    incX:
        cmp startY,6 
        jg decB
        inc startX
        jmp return
    decB:
        cmp startX, 34
        jle moveUp
        dec startX
        jmp return
    moveUp:
        dec startY
        dec startX
        jmp return
    nothing:
        inc currBallNum
    return:
        ret
checkBallPos2 endp

showTitle proc
    mov eax, cyan
    call settextcolor
    mov edx, offset zumbaTitle1
    call WriteString
    mov dl,10 
    mov dh,11
    call gotoxy
    mov edx, offset zumbaTitle2
    call WriteString
    mov dl,10 
    mov dh,12
    call gotoxy
    mov edx, offset zumbaTitle3
    call WriteString
    mov dl,10 
    mov dh,13
    call gotoxy
    mov edx, offset zumbaTitle4
    call WriteString
    mov dl,10 
    mov dh,14
    call gotoxy
    mov edx, offset zumbaTitle5
    call WriteString
    mov dl,10 
    mov dh,15
    call gotoxy
    mov edx, offset zumbaTitle6
    call WriteString
    mov dl,10 
    mov dh,16
    call gotoxy
    mov edx, offset zumbaTitle7
    call WriteString
    mov dl,10 
    mov dh,17
    call gotoxy
    mov edx, offset zumbaTitle8
    call WriteString
    mov dl,10 
    mov dh,18
    call gotoxy
    mov edx, offset zumbaTitle9
    call WriteString
    mov dl,10 
    mov dh,19
    call gotoxy
    mov edx, offset zumbaTitle10
    call WriteString
    mov dl,40 
    mov dh,22
    call gotoxy
    mov eax, white
    call settextcolor
    ret
showTitle endp

FireBall PROC
    ; Fire a projectile from the player's current face direction

    mov dl, xPos      ; Fire column starts at the player's X position
    mov dh, yPos      ; Fire row starts at the player's Y position

    mov fire_col, dl  ; Save the fire column position
    mov fire_row, dh  ; Save the fire row position

    mov al, direction
    cmp al, "w"
    je fire_up

    cmp al, "x"
    je fire_down

    cmp al, "a"
    je fire_left

    cmp al, "d"
    je fire_right

    cmp al, "q"
    je fire_upleft

    cmp al, "e"
    je fire_upright

    cmp al, "z"
    je fire_downleft

    cmp al, "c"
    je fire_downright

    jmp end_fire

fire_up:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, -1
    jmp fire_loop

fire_down:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 57         ; Center fire position
    mov xDir, 0
    mov yDir, 1
    jmp fire_loop

fire_left:
    mov fire_col, 55         ; Move fire position leftwards
    mov fire_row, 16         ; Center fire position
    mov xDir, -1
    mov yDir, 0
    jmp fire_loop

fire_right:
    mov fire_col, 59         ; Move fire position rightwards
    mov fire_row, 16         ; Center fire position
    mov xDir, 1
    mov yDir, 0
    jmp fire_loop

fire_upleft:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, -1
    jmp fire_loop

fire_upright:
    mov fire_row, 14         ; Move fire position upwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, -1
    jmp fire_loop

fire_downleft:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 55         ; Move fire position leftwards
    mov xDir, -1
    mov yDir, 1
    jmp fire_loop

fire_downright:
    mov fire_row, 18         ; Move fire position downwards
    mov fire_col, 59         ; Move fire position rightwards
    mov xDir, 1
    mov yDir, 1
    jmp fire_loop

fire_loop:
    ; Initialise fire position
    mov dl, fire_col
    mov dh, fire_row
    call GoToXY

    ; Loop to move the fireball in the current direction
    L1:

        ; Ensure fire stays within the bounds of the emitter wall
        cmp dl, 20            ; Left wall boundary
        jle end_fire

        cmp dl, 96            ; Right wall boundary
        jge end_fire

        cmp dh, 5             ; Upper wall boundary
        jle end_fire

        cmp dh, 27            ; Lower wall boundary
        jge end_fire

        ; Print the fire symbol at the current position
        movzx eax, fire_color    ; Set fire color
        call SetTextColor

        add dl, xDir
        add dh, yDir
        call Gotoxy

        mov currBulletX, dl
        mov currBulletY, dh

        mWrite "*"
        mov eax, speed
        call Delay
        push edx
        push eax
        push ecx
        cmp levelInfo, 1
        jne L2
	    call updateBalls
        jmp popX
    L2:
        cmp levelInfo, 2
        jne L3
        call updateBalls2
        jmp popX
    L3:
        call updateBalls3
    popX:
        pop ecx
        pop eax
        pop edx
        ; Continue moving fire in the current direction (recursive)

        ; erase the fire before redrawing it
        call GoToXY
        mWrite " "

        jmp L1

    end_fire:
        ;reset bullet's current position
        mov currBulletX, 0  
        mov currBulletY, 0

        mov dx, 0
        mov dl, 19
	    mov dh, 4
        mov eax, gray
        call setTextColor
        call GoToXY
        cmp levelInfo, 1
        jne J2
	    mov edx,offset walls
        jmp write
    J2:
        cmp levelInfo, 2
        jne J3
        mov edx, offset walls2
        jmp write
    J3:
        mov edx, offset walls3
    write:
        call writestring 
    ret
FireBall ENDP

DrawWall PROC
	call clrscr

    mov dl,19
	mov dh,2
	call Gotoxy
    mov eax, white + (black * 16)
	call SetTextColor
	mWrite <"Score: ">
	mov al, score
	call WriteDec

    mov eax, White + (black * 16)
	call SetTextColor

	mov dl,90
	mov dh,2
	call Gotoxy
	mWrite <"Lives: ">
	mov eax, white + (black * 16)
	call SetTextColor
	mov al, lives
	call WriteDec

	mov eax, white + (black * 16)
	call SetTextColor

	mov dl,55
	mov dh,2
	call Gotoxy

	mWrite "LEVEL " 
	mov al, levelInfo
	call WriteDec

	mov eax, gray + (black*16)
	call SetTextColor

	mov dl, 19
	mov dh, 4
	call Gotoxy
    cmp levelInfo, 1
    jne L2
	mov edx,offset walls
    jmp write
    L2:
        mov dl, 100
	    mov dh,4
	    call Gotoxy
        mov eax, red + (black*16)
	    call SetTextColor
        mWrite "PowerUps: " 
        mov eax, gray + (black*16)
	    call SetTextColor
        mov dl, 100
	    mov dh,6
	    call Gotoxy
        mWrite "Slow Down: " 
        mov al, slowDown
	    call WriteDec
        cmp levelInfo, 2
        jne L3
        mov dl, 19
	    mov dh, 4
	    call Gotoxy
        mov edx, offset walls2
        jmp write
    L3:
        mov dl, 100
	    mov dh,7
	    call Gotoxy
        mWrite "Random Explosion: " 
        mov al, explode
	    call WriteDec
        mov dl, 19
	    mov dh, 4
	    call Gotoxy
        mov edx, offset walls3
    write:
        call writestring 
	ret
DrawWall ENDP

PrintPlayer PROC
    call Randomize
    mov eax, currColorR
    call randomrange
    add al, 1
    mov fire_color, al
    call settextcolor

    mov al, direction
    cmp al, "w"
    je print_up

    cmp al, "x"
    je print_down

    cmp al, "a"
    je print_left

    cmp al, "d"
    je print_right

    cmp al, "q"
    je print_upleft

    cmp al, "e"
    je print_upright

    cmp al, "z"
    je print_downleft

    cmp al, "c"
    je print_downright

    ret

    print_up:
        mov esi, offset player_up
        jmp print

    print_down:
        mov esi, offset player_down
        jmp print

    print_left:
        mov esi, offset player_left
        jmp print

    print_right:
        mov esi, offset player_right
        jmp print

    print_upleft:
        mov esi, offset player_upleft
        jmp print

    print_upright:
        mov esi, offset player_upright
        jmp print

    print_downleft:
        mov esi, offset player_downleft
        jmp print

    print_downright:
        mov esi, offset player_downright
        jmp print

    print:
    mov dl, xPos
    mov dh, yPos
    call GoToXY

    mov counter1, 3
	mov counter2, 4
	movzx ecx, counter1
	printcolumn:
		mov counter1, cl
		movzx ecx, counter2
		printrow:
			mov eax, [esi]
			call WriteChar
            
			inc esi
		loop printrow

		movzx ecx, counter1

		mov dl, xPos
		inc dh
		call Gotoxy
	loop printcolumn
    mov eax, white + (black * 16)
    call SetTextColor
ret
PrintPlayer ENDP

MovePlayer PROC
    mov dx, 0
    call GoToXY

    checkInput:

    mov eax, 5
    call Delay

    ; Check for key press
    mov eax, 0
    call ReadKey
    mov inputChar, al

    cmp inputChar, VK_SPACE
    je shoot

    cmp inputChar, VK_ESCAPE
    ;je paused

    cmp inputChar, "w"
    je move

    cmp inputChar, "a"
    je move

    cmp inputChar, "x"
    je move

    cmp inputChar, "d"
    je move

    cmp inputChar, "q"
    je move

    cmp inputChar, "e"
    je move

    cmp inputChar, "z"
    je move

    cmp inputChar, "c"
    je move
         ; if character is invalid, check for a new keypress
    jmp return

    move:
        mov al, inputChar
        mov direction, al
        jmp chosen

    ;paused:
        ; call your pause menu here... once you make it. for now, this will exit the game.
        ;ret
        
    shoot:
        call FireBall

    chosen:
        call PrintPlayer
        call MovePlayer
return:
    ret
MovePlayer ENDP

InitialiseScreen PROC
    call DrawWall       ; Draw the level layout at the start
    call PrintPlayer     ; Set the initial player cannon position
    ret
InitialiseScreen ENDP

randomizeBallColor proc
    mov ecx, lengthof colorArray
    mov esi, offset colorArray
    mov bl, levelInfo
    cmp bl, 1
    jne l2
    mov  edx,colorRangeL1    ;0-5
    jmp Random
    l2:
        cmp bl, 2
        jne l3
        mov  edx,colorRangeL2    ; range = 0-10
        jmp Random
    l3:
        mov  edx,colorRangeL3    ; 0-15
    Random:
         mov currColorR, edx
        call Randomize
    L1:
        mov eax, edx
        call RandomRange  ;generate random number 
        cmp levelInfo, 1
        jg  add5
        inc al            ; to avoid black color
        jmp next
    add5:
        cmp levelInfo, 2
        jg add10
        cmp al,6
        jg next
        add al, 6
        jmp next
    add10:
        cmp al,6
        jg next
        add al, 9
    next:
        mov [esi],al
        inc esi;
    Loop L1
    ret
randomizeBallColor endp

ResetTimer proc
    mov timerBalls, 0
    ret
ResetTimer endp

updateScore proc
    cmp score, 0
    jg setScore
    dec lives
    mov dl,90
	mov dh,2
	call Gotoxy
    mov eax, white + (black * 16)
	call SetTextColor
	mWrite <"Lives: ">
	mov al, lives
	call WriteDec
    setScore:
        INVOKE PlaySound, OFFSET bonus,NULL, 2001h
        mov eax, 1500
        call delay
        INVOKE PlaySound, OFFSET soundFile,NULL, 2001h
         mov dl,19
	    mov dh,2
	    call Gotoxy
        mov eax, white
        call SetTextColor
	    mWrite <"Score: ">
	    mov al, score
	    call WriteDec
         cmp levelInfo, 1
    jne L2
    jmp write
    L2:
        mov dl, 100
	    mov dh,4
	    call Gotoxy
        mov eax, red + (black*16)
	    call SetTextColor
        mWrite "PowerUps: " 
        mov eax, gray + (black*16)
	    call SetTextColor
        mov dl, 100
	    mov dh,6
	    call Gotoxy
        mWrite "Slow Down: " 
        mov al, slowDown
	    call WriteDec
        cmp levelInfo, 2
        jne L3
        jmp write
    L3:
        mov dl, 100
	    mov dh,7
	    call Gotoxy
        mWrite "Random Explosion: " 
        mov al, explode
	    call WriteDec
   write:
    ret
updateScore endp

checkBallPos proc
    movsx ecx, currBallNum
    cmp ecx, (lengthof colorArray)/2
    jl nothing
    mov dh, startY
    mov dl, startX
    call gotoxy
    mwrite " "
    cmp startX, 94
    jl incX
    cmp startY,24
    jge decB
    cmp startY, 24
    jle incY
    jmp return

    incY:
        inc startY
        jmp return
    incX:
        cmp startY,6 
        jg decB
        inc startX
        jmp return
    decB:
        cmp startX, 30
        jle moveUp
        dec startX
        jmp return
    moveUp:
        dec startY
        jmp return
    nothing:
        inc currBallNum
    return:
        ret
checkBallPos endp

adjustCollide proc
     mov al, fire_color ; check if same color
     cmp al, [esi]
     jne addNew      ; if not same add a new ball
     moveBack:
        cmp [esi-1], al
        jne shiftBalls
        dec esi
     jmp moveBack
     shiftBalls:
        mov edi, esi
        mov temp, cl
        L1:
             mov ah, [esi+1]
             mov [esi], ah
             inc esi
        Loop L1
        dec currBallNum
        inc currScore
        mov esi, edi
        mov cl, temp
        dec cl
        cmp [esi], al
     je shiftBalls
     mov cl,currScore
     cmp cl, 3
     jle next
     inc slowDown
     next:
     add score, cl
     push edx
     call updateScore  ;ball popped so increase score  
     pop edx
     ret
    addNew:
        mov al, [esi]
        mov ah,  fire_color
        mov [esi], ah
        L2:
            mov ah, [esi+1]    ;shift every element forward to mske space for new ball
            mov [esi+1], al
            mov al, ah
            inc esi
        Loop L2
        inc currBallNum
        cmp score, 0
        jle nothing
        dec score
        nothing:
        push edx
        call updateScore  ;decrease score  and lives (if needed)
        pop edx
        ret
adjustCollide endp

updateBalls proc
    cmp startX, 94
    jnge check
    cmp startY, 24
    jge noCheck
    check:
        call checkBallPos

    noCheck:
        mov ecx,0
        mov cl, currBallNum
        mov esi, offset colorArray
        mov eax, 0
        inc esi
        mov bl, startX ; starting x
        mov dl, startY ;starting y
    L1:
        mov al,[esi]
        cmp al, 0
        je nextL
        cmp bl, 94
        jl incX
        cmp dl,24
        jge decB
        inc dl
        jmp nothing
    incX:
        cmp dl,6 
        jg decB
        inc bl
        jmp nothing
    decB:
        cmp bl, 30
        jle moveUp
        dec bl
        jmp nothing
    moveUp:
        dec dl
    nothing:
        mov dh, dl
        mov dl, bl
        call gotoxy
        cmp dl, currBulletX
        mov dl, dh
        jne noCollide
        cmp dh, currBulletY
        jne noCollide
        push eax
        push ecx
        push esi
        call adjustCollide
        pop esi
        pop ecx
        pop eax
        mov dl, bl
        call gotoxy
        mov dl, dh
    noCollide:
        mov al, [esi]
        call settextcolor
        mWrite "O"
    nextL: 
        inc esi
    loop L1

    break1:
        mov eax, white
        call settextcolor
    ret
updateBalls endp

GamePlay proc
  call Level1
  call gameOver
  cmp score, 1
  jl gameO
   INVOKE PlaySound, OFFSET levelComp,NULL, 2001h
        mov eax, 1500
        call delay
        INVOKE PlaySound, OFFSET soundFile,NULL, 2001h
  call Level2  
  call gameOver
  cmp score, 1
  jl gameO
   INVOKE PlaySound, OFFSET levelComp,NULL, 2001h
        mov eax, 1500
        call delay
        INVOKE PlaySound, OFFSET soundFile,NULL, 2001h 
  call Level3
  call gameOver
  cmp score, 1
  jl gameO
  call winningScreen
  gameO:
    ret
GamePlay endp

winningScreen proc 

    call clrscr
     INVOKE PlaySound, OFFSET won,NULL, 2001h
        mov eax,1500
        call delay
        INVOKE PlaySound, OFFSET soundFile,NULL, 2001h
    mov dh, 2
    mov dl, 50
    call gotoxy
    mov eax, red
    call setTextColor
    mov edx, offset winner
    call writestring
    mov eax, white
    call setTextColor
    push 1000
    call sleep
    ret
winningScreen endp

Level1 proc

    call randomizeBallColor
    call InitialiseScreen
    gameLoop:
        call updateBalls
        call movePlayer
        push speed      ; Duration in milliseconds
        call Sleep       ; Call the Windows Sleep API
         mov eax, 0
        cmp inputChar, "p"
        jne skipPause
        PauseMenu:
            call ShowPauseScreen
            call InitialiseScreen
        skipPause:
        cmp score, 1
        jge endL
        cmp lives, 0
    jg gameLoop
   ; call gameOver
   endL:
    ret
Level1 endp

ShowPauseScreen proc
    pauseMenu:
        call clrscr
        mov eax, 6
        call setTextColor
        mov dl,70
        mov dh,8
        call gotoxy
        mov edx,offset pauseScreen
        call writestring
        call readchar
        cmp al, '2'
        je exitGame
        cmp al,'1'
        jne PauseMenu
        call clrscr
        dec pauseKey
        jmp Return
    exitGame:
       call gameOver
       call showExitGame
       invoke exitprocess, 0
    Return:
      ret
ShowPauseScreen endp

GameOver proc

	mov edx,OFFSET scoreFile
    call OpenInputFile
    mov fileHandle,eax

    mov  edx,OFFSET buffer
    mov  ecx,BUFSIZE
    call ReadFromFile
    mov bytesread, eax
    mov eax,fileHandle
    call CloseFile

    mov eax,fileHandle
    mov  edx,OFFSET scoreFile
    call CreateOutputFile
    mov fileHandle,eax

    mov  edx,OFFSET buffer
    mov  ecx,bytesread
    mov eax,fileHandle
    call WriteToFile

    mov  edx,OFFSET names
    mov  ecx,nameBytes
    mov eax,fileHandle
    call WriteToFile

    mov  edx,OFFSET space1
    mov  ecx,lengthof space1
    mov eax,fileHandle
    call WriteToFile

    mov eax, 0
    mov al, score
    add al, 30h
    mov numscr1, ax
    mov  edx,OFFSET numscr1
    mov  ecx,1
    mov eax,fileHandle
    call WriteToFile

     mov  edx,OFFSET space2
    mov  ecx,lengthof space2
    mov eax,fileHandle
    call WriteToFile

    mov eax, 0
    mov al, levelInfo
    add al, 30h
    mov numscr1, ax
     mov  edx,OFFSET numscr1
    mov  ecx,1
    mov eax,fileHandle
    call WriteToFile

    mov  edx,OFFSET endLine
    mov  ecx,lengthof endLine
    mov eax,fileHandle
    call WriteToFile
    ret
GameOver endp

ShowExitGame proc
    exitGame:
    mov edx,OFFSET scoreFile
    call OpenInputFile
    mov fileHandle,eax

    mov  edx,OFFSET buffer
    mov  ecx,BUFSIZE
    call ReadFromFile
    mov bytesread, eax
    mov eax,fileHandle
    call CloseFile
    mov eax, white
    call setTextColor
    call clrscr
    mwrite "HIGHEST SCORE: "
    mov edx, offset buffer
    mov ecx, bytesread
    call writeString
    call crlf
    call crlf
    mwrite "YOUR SCORE: "
    mov al, score
    call writeDec
    call crlf
    ret
ShowExitGame endp

InstructionScreen proc
    INSTRUCTIONSSCREEN:
        mov eax, white
        call settextcolor
        mov dl,0 
        mov dh,0
        call gotoxy
        mov edx,offset INSTRUCTIONS_SCREEN
        call writestring
        call readchar
        call clrscr
        cmp al,27
        je point2
        jmp INSTRUCTIONSSCREEN
    point2:
        call MenuScreen
    ret
InstructionScreen endp

TitleScreen proc
    mov dl,10 
    mov dh,10
    mov eax,white
    call settextcolor
    call gotoxy
    call showTitle ; calling function to show title 
    call waitmsg
    call clrscr
    ret
TitleScreen endp

NameScreen proc
    mov dh,0
    mov dl,0
    call gotoxy
    mov edx,offset prompt1
    mov ecx,lengthof prompt1
    call writestring
    mov edx,offset names
    mov ecx,20
    call readstring
    mov nameBytes, eax
    call clrscr
    ret
NameScreen endp

adjustAsciiScore proc
    ret
adjustAsciiScore endp

MenuScreen proc
    mov eax, 13
    call setTextColor
    selection:

    point1:
        mov dl,70
        mov dh,3
        call gotoxy
        call writestring
        mov menuSelect,1
    jmp start_tab

    point2:
        mov dl,80
        mov dh,12
        call gotoxy
        mov menuSelect,2
    jmp start_tab

    point3:
        mov dl,70
        mov dh,22
        call gotoxy
        mov menuSelect,3
    jmp start_tab


    start_tab:
    mov dl,0
    mov dh,1
    call gotoxy
    mov edx,offset START
    call writestring

    mov dl,0
    mov dh,10
    call gotoxy
    mov edx,offset INSTRUCTIONS
    call writestring

    mov dl,0
    mov dh,20
    call gotoxy
    mov edx,offset EXITED
    call writestring

    call readchar
    call clrscr
    cmp al,'1'
    je point1
    cmp al,'2'
    je point2
    cmp al,'3'
    je point3
    cmp al,13
    jne selection

    ret
MenuScreen endp
end main