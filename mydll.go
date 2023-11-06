package main

// #include <stdlib.h>
import "C"

import (
  //"fmt"
  "unsafe"
  "github.com/cbroglie/mustache"
  "encoding/json"
)

func jsonDecode(jsonStr string) interface{} {
  var data interface{}
  json.Unmarshal([]byte(jsonStr), &data)
  return data
}

func render(template, jsonStr string) string {
  data := jsonDecode(jsonStr)
  parsedStr, err := mustache.Render(template, data)
  if err != nil {
    //fmt.Println(err)
    parsedStr = ""
  }
  return parsedStr
}

//export RenderMustacheCdecl
func RenderMustacheCdecl(template, jsonStr *C.char) *C.char {
  parsedStr := render(C.GoString(template), C.GoString(jsonStr))
  return C.CString(parsedStr)
}

//export MustacheFreeCdecl
func MustacheFreeCdecl(str *C.char) {
  C.free(unsafe.Pointer(str))
}

func main() { }
