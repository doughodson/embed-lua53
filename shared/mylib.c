
// C headers
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

#include <stdio.h>

static int myCfunc(lua_State* l)
{
  printf("This is a C++ function\n");
  return 0;
}

// function registration info
int luaopen_mylib(lua_State* l)
{
   static const luaL_Reg map[] = {
       { "dothis", myCfunc },
       { NULL, NULL }
   };

   luaL_register(l, "mylib", map);
   return 1;
}
