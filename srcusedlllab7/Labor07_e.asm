;----------------------------------------------------------------
;                          Labor07_e.asm
;----------------------------------------------------------------
.386
.model flat, stdcall
option casemap:none
LoadLibraryA 	PROTO      	:DWORD
LoadLibrary equ LoadLibraryA
GetProcAddress 	PROTO      	:DWORD, :DWORD
FreeLibrary 	PROTO      	:DWORD
MessageBoxA      PROTO      :DWORD,:DWORD,:DWORD,:DWORD
MessageBox equ MessageBoxA
ExitProcess 	PROTO      	:DWORD
NULL equ 0
MB_OK equ 0
.data
	LibName db "Labor07.dll",0
	FunctionName db "TestFunction",0 ;
	DllNotFound db "Cannot load library",0
	AppName db "Load explisit Library",0
	NotFound db "TestFunction function not found",0
	msg db "hello it explisit dll function call",0

.data?
	hLib dd ?
	TestFunctionAddr dd ?

.code
start:
	invoke LoadLibrary,addr LibName	; ������������ ��������
	.if eax == NULL					; ���� ������������ �� �������
		invoke MessageBox,NULL,addr DllNotFound,addr AppName,MB_OK
	.else
		mov hLib,eax				; ���������� ��������� ��������
		; ���������� ������ �������
		invoke GetProcAddress,hLib,addr FunctionName
		.if eax == NULL				; ���� �� ������� ����� ������
			invoke MessageBox,NULL,addr NotFound,addr AppName,MB_OK
		.else
			push offset msg
			mov TestFunctionAddr,eax
			call [TestFunctionAddr]			; ������ �������
		.endif
		invoke FreeLibrary,hLib				; ������������ ��������
	.endif
	invoke ExitProcess,NULL
end start
;----------------------------------------------------------------