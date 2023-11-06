SET CGO_ENABLED=1
SET SET GOARCH=386

SET PATH=%PATH%;C:\mingw32\bin

@ECHO OFF
REM SET PATH=%PATH%;C:\prg\mingw64\bin

REM go build -o mydll.a -buildmode=c-archive mydll.go
REM gcc -shared -o mydll.dll mydllwrapper.c mydll.a
REM gcc cprog.c -L. -lmydll

REM Directly to DLL, but only with cdecl:
REM go build -o mydll.dll -buildmode=c-shared mydll.go