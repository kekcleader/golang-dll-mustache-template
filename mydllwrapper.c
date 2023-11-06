#include "mydll.h"

extern __declspec(dllexport) __stdcall char* RenderMustache (char* template, char* jsonStr) {

  return RenderMustacheCdecl(template, jsonStr);
}

extern __declspec(dllexport) __stdcall void MustacheFree(char* str) {
  MustacheFreeCdecl(str);
}
