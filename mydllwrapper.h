#include "mydll.h"

extern __declspec(dllexport) __stdcall char* RenderMustache (char* template, char* jsonStr);
extern __declspec(dllexport) __stdcall void MustacheFree(char* str);
