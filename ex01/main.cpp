
#include <cstring>

#include "lua.hpp"

int main()
{
   lua_State* L{luaL_newstate()};  // open Lua interpreter
   luaL_openlibs(L);               // load all standard libraries (modules)

   // execute script
   const char script[]{"x=25; print(x)"};
   int status{luaL_loadbuffer(L, script, std::strlen(script), "name")};
   lua_pcall(L, 0, 0, 0);

   lua_close(L);
   return 0;
}


