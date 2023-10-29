SET CGO_ENABLED=1

SET PATH=%PATH%;C:\prg\mingw64\bin

REM go build -o mydll.dll -buildmode=c-shared mydll.go 
REM gcc cprog.c -L. -lmydll