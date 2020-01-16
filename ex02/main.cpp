

#include "lua.hpp"

int main()
{
   lua_State* L{luaL_newstate()};  // open Lua interpreter
   luaL_openlibs(L);               // load all standard libraries (modules)

   // load a standard Lua function from global table
   lua_getglobal(L, "print");

   // push an argument onto Lua C API stack
   lua_pushstring(L, "Hello C API!");

   // call Lua function with 1 argument and 0 results
   lua_call(L, 1, 0);

   lua_close(L);
   return 0;
}


