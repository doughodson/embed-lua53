
// C headers
#include "lua.hpp"

#include <iostream>

// functions

static int myCfunc(lua_State* l)
{
  std::cout << "This is a C++ function\n";
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
