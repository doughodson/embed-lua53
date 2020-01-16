
#include <cstdio>
#include <iostream>

#include "lua.hpp"

int main() {
   lua_State* L{luaL_newstate()};  // open Lua interpreter
   luaL_openlibs(L);               // load all standard libraries

   char buff[256];
   while (std::fgets(buff, sizeof(buff), stdin) != NULL) {
      int error{luaL_loadstring(L, buff) || lua_pcall(L, 0, 0, 0)};
      if (error) {
         std::cout << lua_tostring(L, -1) << std::endl;
         lua_pop(L, 1);            // pop error message from the stack
      }
   }

   lua_close(L);
   return 0;
}

