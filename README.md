# MUSTACHE RENDERER

The DLL file `mydll.dll` exports two functions:

In C-notation:
  ```c
  char *RenderMustache(char *template, char *jsonStr);
  void MustacheFree(char *str);
  ```

In Go-notation:
  ```go
  func RenderMustache(template, jsonStr *C.char) *C.char
  func MustacheFree(str *C.char)
  ```

The first function has two parameters being a pointer to a
null-terminated ANSI strings containing a template and a pointer to
a JSON structure (in a string) and returns a pointer to a
null-terminated string containing the filled in template.

The returned string is allocated using C malloc function and must be
freed using either C free function or MustacheFree, which just calls
C free function from Go.

# FILES

`go.mod` is the Go module file, required to compile the Go program

`mydll.go` is the Go source file of the DLL, but it compiles to a ".a"-file

`mydll.a` is the archive (object) file, the result of compilation of "mydll.go" *(autogenerated)*

`mydll.h` is the C-header file, auto-generated by Go compiler for "mydll.go" *(autogenerated)*

`mydllwrapper.c` is a simple wrapper that converts Go functions to the stdcall calling convention

`mydllwrapper.h` is the C-header file for "mydllwrapper.c", the file is written manually

`mydll.dll` is the compiled DLL *(autogenerated)*

`cprog.c` is a C test program to check if DLL is working

`cprog.exe` is the compiled test program

`prepare.bat` is a Batch file with some commands to prepare the
compilation process, namely set `CGO_ENABLED` environment
variable to 1, and add MinGW-w64 path to the `PATH` environment
variable (path to the 64-bit version of `gcc.exe`). GCC is
required by Go compiler when it is used in "c-shared" build
mode.

# COMPILATION

(To compile in 32-bit mode, first run `SET GOARCH=386`)

To compile Go ".a"-file, first set `CGO_ENABLED=1`, add path to
`gcc.exe` to PATH, then run the following:
  ```
  go build -o mydll.a -buildmode=c-archive mydll.go 
  ```

To compile the wrapper and the ".a"-file to the final DLL run:
  ```
  gcc -shared -o mydll.dll mydllwrapper.c mydll.a
  ```

To compile the test program, type:
  ```
  gcc -ocprog.exe cprog.c -L. -lmydll
  ```

To run it, type:
  ```
  cprog.exe
  ```
