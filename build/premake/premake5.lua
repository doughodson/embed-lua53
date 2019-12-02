
--
-- If premake command is not supplied an action (target compiler), exit!
--
-- Targets of interest:
--     vs2019     (Visual Studio 2019)
--
if (_ACTION == nil) then
    return
end

Lua_IncPath  = "../../lua/src"
Lua_LibPath  = "../../lua/lib"
LuaLib       = "lua"
LuaLib_d     = "lua_d"

workspace "embed-lua"

   -- destination directory for generated solution/project files
   location ("../" .. _ACTION)

   --
   -- Build (solution) configuration options:
   --     Release        (Runtime library is Multi-threaded DLL)
   --     Debug          (Runtime library is Multi-threaded Debug DLL)
   --
   configurations { "Release", "Debug" }

   -- common release configuration flags and symbols
   filter { "Release" }
      optimize "On"
      -- favor speed over size
      buildoptions { "/Ot" }
      defines { "WIN32", "_LIB", "NDEBUG" }

   -- common debug configuration flags and symbols
   filter { "Debug" }
      targetsuffix "_d"
      symbols "On"
      -- enable compiler intrinsics
      defines { "WIN32", "_LIB", "_DEBUG" }

   --
   -- libraries
   --

-- lua library
project "lua"
   targetname "lua"
   targetdir ("../../lua/lib/")
   kind "StaticLib"
   language "C"
   includedirs { Lua_IncPath }
   files {
      "../../lua/src/**.*"
   }
   excludes {
      "../../lua/src/lua.c",
      "../../lua/src/luac.c"
   }

-- part1 executable
project "part1"
   targetname "part1"
   targetdir ("../../part1/")
   kind "ConsoleApp"
   language "C++"
   includedirs { Lua_IncPath }
   libdirs     { Lua_LibPath }
   files {
      "../../part1/**.*"
   }
   filter "configurations:Release"
      links {LuaLib}
   filter "configurations:Debug"
      links {LuaLib_d}
