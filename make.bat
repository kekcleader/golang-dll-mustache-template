@ECHO OFF

ECHO First edit and run prepare.bat (edit by changing the PATH to gcc).
ECHO.

ECHO Building Go-program to an archive file...
go build -o mydll.a -buildmode=c-archive mydll.go
IF ERRORLEVEL 1 GOTO ERROR

ECHO =================
ECHO Compiling and linking the archive file and C-wrapper to DLL file...
gcc -shared -o mydll.dll mydllwrapper.c mydll.a
IF ERRORLEVEL 1 GOTO ERROR

ECHO =================
ECHO Compiling test program...
gcc -ocprog.exe cprog.c -L. -lmydll
IF ERRORLEVEL 1 GOTO ERROR

ECHO =================
ECHO Running the test program...
cprog.exe
IF ERRORLEVEL 1 GOTO ERROR

ECHO =================
ECHO Compilation successful.
GOTO END1

:ERROR
ECHO =================
ECHO An error occurred.

:END1