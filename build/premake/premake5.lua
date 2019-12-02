
--
-- If premake command is not supplied an action (target compiler), exit!
--
-- Targets of interest:
--     vs2019     (Visual Studio 2019)
--
if (_ACTION == nil) then
    return
end

Lua_IncPath  = "../../lua-5.3.5/src"
Lua_LibPath  = "../../lua-5.3.5/lib"
Lua_LibFile  = "lua"

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

-- lua library
project "lua-5.3.5"
   targetname "lua"
   targetdir ("../../lua-5.3.5/lib/")
   kind "StaticLib"
   language "C"
   includedirs { Lua_IncPath }
   files {
      "../../lua-5.3.5/src/**.*"
   }
   excludes {
      "../../lua-5.3.5/src/lua.c",
      "../../lua-5.3.5/src/luac.c"
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
   links {"lua-5.3.5"}
