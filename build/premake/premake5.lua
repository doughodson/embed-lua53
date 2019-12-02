
--
-- If premake command is not supplied an action (target compiler), exit!
--
-- Targets of interest:
--     vs2019     (Visual Studio 2019)
--
if (_ACTION == nil) then
    return
end

LUA_IncPath  = "../../lua/src"
LUA_LibPath  = "../../lua/lib"

workspace "embed-lua"

   -- destination directory for generated solution/project files
   location ("../" .. _ACTION)

   -- common include directories (all configurations/all projects)
   includedirs { LUA_IncPath }

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
   kind "StaticLib"
   language "C"
   files {
      "../../lua/src/**.*"
   }
   excludes {
      "../../lua/src/lua.c",
      "../../lua/src/luac.c"
   }
   targetdir ("../../lua/lib/")
   targetname "lua"

-- part1 executable
project "part1"
   kind "StaticLib"
   language "C++"
   files {
      "../../part1/**.*"
   }
   targetname "part1"
