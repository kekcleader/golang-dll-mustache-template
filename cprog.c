#include <stdio.h>

#include "mydll.h"

int main() {
  printf("HELLO, THIS IS DLL TEST.\n");

  char template[] = "Buy new {{#fruits}}{{name}}, {{/fruits}}and others.";
  char json[] = "{\"fruits\":"
      "[{\"name\": \"Apple\"},"
      "{\"name\": \"Orange\"},"
      "{\"name\": \"Banana\"},"
      "{\"name\": \"Morkva\"}"
      "]}";

  char *parsedStr;

  printf("template:\n%s\n\nJSON:\n%s\n", template, json);

  
  parsedStr = RenderMustache(template, json);
  printf("%s\n", parsedStr);
  MustacheFree(parsedStr);

  printf("END OF PROGRAM.\n");
  return 0;
}