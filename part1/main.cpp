
#include <iostream>

#include "Lua.hpp"

int main()
{
   lua_State* L = luaL_newstate();
   luaL_dostring(L, "x - 42");
   lua_close(L);
   return 0;
}
