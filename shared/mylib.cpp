
// C headers
#include "lua.hpp"

#include <iostream>
#include <cmath>

// functions

static int mylib_str(lua_State* l)
{
  std::cout << "This is a string from C++ function\n";
  return 0;
}

static int mylib_sin(lua_State* l)
{
   double d = luaL_checknumber(l, 1);
   lua_pushnumber(l, std::sin(d));
   return 1;
}

// function registration info

int luaopen_mylib(lua_State* l)
{
   static const luaL_Reg map[] = {
       { "str", mylib_str },
       { "sin", mylib_sin },
       { NULL, NULL }
   };

   luaL_newlib(l, map);
   return 1;
}
