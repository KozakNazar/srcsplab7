.386
.model flat, stdcall
includelib user32.lib
includelib kernel32.lib;
MessageBoxA PROTO      :DWORD, :DWORD, :DWORD, :DWORD 
.data
    tit db "Labor #7, asm dll function", 0
.code

DllEntry PROC hInstDLL:DWORD, reason:DWORD, reserved:DWORD
    mov eax, 1
	ret
DllEntry ENDP

TestFunction PROC msg:DWORD
    invoke MessageBoxA, 0, msg, addr tit, 0
	ret
TestFunction ENDP


End DllEntry