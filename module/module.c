
#ifdef LUA_BUILD_AS_DLL
#define EXPORT_FUNCTION __declspec(dllexport)
#else
#define EXPORT_FUNCTION
#endif

// C headers
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

#include <stdio.h>

static int test(lua_State* l)
{
  printf("This is a C function\n");
  return 0;
}

// function registration info
EXPORT_FUNCTION int luaopen_module(lua_State* l)
{
   static const luaL_Reg map[] = {
       { "test", test },
       { NULL, NULL }
   };

   luaL_newlib(l, map);
   return 1;
}
