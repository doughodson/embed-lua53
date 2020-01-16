
#include <cstring>

#include "lua.hpp"

int main()
{
   lua_State* L{luaL_newstate()};  // open Lua interpreter
   luaL_openlibs(L);               // load all standard libraries (modules)

   // execute script
   const char lua_script[]{"x=25; print(x)"};
   int load_stat{luaL_loadbuffer(L, lua_script, std::strlen(lua_script), lua_script)};
   lua_pcall(L, 0, 0, 0);

   lua_close(L);
   return 0;
}


