ORG 0x7C00
BITS 16

init:
    mov si, welcome_message
    call print_some_fucking_text
    call generate_random_number
    call start_the_goddamn_game
    jmp $

generate_random_number:
    ; somehow xor operation is faster and uses less code space, I can't confirm
    ; this crap now but it's definetely a thing to have a look into.
    xor ah, ah
    int 0x1A
    mov ax, dx
    xor dx, dx
    mov cx, 10
    div cx
    mov bx, dx
    ret

start_the_goddamn_game:
    call play_this_crap
    ret

play_this_crap:
    mov si, guess_prompt
    call print_some_fucking_text_without_newline
    call read_user_input
    sub al, '0'
    cmp al, bl
    je nailed_it
    jl too_freaking_low
    jmp too_freaking_high

too_freaking_low:
    mov si, too_low_message
    call print_some_fucking_text
    jmp play_this_crap

too_freaking_high:
    mov si, too_high_message
    call print_some_fucking_text
    jmp play_this_crap

nailed_it:
    mov si, correct_message
    call print_some_fucking_text
    ret

print_some_fucking_text:
    .do_it:
        lodsb
        cmp al, 0
        je .done
        call show_a_fucking_char
        jmp .do_it
    .done:
        mov al, 10
        call show_a_fucking_char
        mov al, 13
        call show_a_fucking_char
        ret

print_some_fucking_text_without_newline:
    .do_it:
        lodsb
        cmp al, 0
        je .done
        call show_a_fucking_char
        jmp .do_it
    .done:
        ret

show_a_fucking_char:
    mov ah, 0eh
    int 0x10
    ret

read_user_input:
    mov ah, 00h
    int 16h
    mov ah, 0eh
    int 10h
    ret

welcome_message: db 'Welcome to the number guessing game you piece of shit', 0
guess_prompt: db 'Enter your damn guess (0-9): ', 0
too_low_message: db ' -> Too low, moron! Try again: ', 0
too_high_message: db ' -> Too high, idiot! Try again: ', 0
correct_message: db ' -> Holy shit! You are a fucking genius', 0

times 510-($ - $$) db 0
dw 0xAA55
