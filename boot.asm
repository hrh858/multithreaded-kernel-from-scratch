ORG 0x7c00
BITS 16

message: db 'Hello World!', 0

start:
  mov si, message
  call print
  jmp $ ;jump to this line constantly

print:
  mov bx, 0
.loop:
  lodsb ;loads what si is pointing to in the al register and increment si
  cmp al, 0
  je .done
  call print_char
  jmp .loop
.done:
  ret

print_char:
  mov ah, 0eh ;0eh is rquired by int 10
  int 0x10 ;video - teletype output
  ret

times 510-($ - $$) db 0 ;pad with 0s until 510 bytes
dw 0xAA55 ;bot signature (just puts this as binary into our file)
