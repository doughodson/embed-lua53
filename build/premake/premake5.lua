
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

   -- lua library (lua.lib)
   project "lua"
      targetname "lua"
      targetdir ("../../lua-5.3.5/lib/")
      kind "StaticLib"
      language "C"
      includedirs { Lua_IncPath }
      files {
         "../../lua-5.3.5/src/**.*"
      }

   -- lua stock interpreter (lua)
   project "lua-repl"
      targetname "lua"
      targetdir ("../../lua-repl")
      kind "ConsoleApp"
      language "C"
      includedirs { Lua_IncPath }
      files {
         "../../lua-repl/lua.c"
      }
      links {"lua"}

   -- lua compiler (luac)
   project "lua-compiler"
      targetname "luac"
      targetdir ("../../luac")
      kind "ConsoleApp"
      language "C"
      includedirs { Lua_IncPath }
      files {
         "../../luac/luac.c"
      }
      links {"lua"}

   -- lua bare interpreter (lua)
   project "lua-bare-repl"
      targetname "lua"
      targetdir ("../../lua-bare-repl")
      kind "ConsoleApp"
      language "C"
      includedirs { Lua_IncPath }
      files {
         "../../lua-bare-repl/main.c"
      }
      links {"lua"}

   -- stack-manipulate (use stack dump)"
   project "stack-manipulate"
      targetname "stack-manipulate"
      targetdir ("../../stack-manipulate")
      kind "ConsoleApp"
      language "C"
      includedirs { Lua_IncPath }
      files {
         "../../stack-manipulate/main.c"
      }
      links {"lua"}

   project "ex01"
      targetname "ex01"
      targetdir ("../../ex01/")
      kind "ConsoleApp"
      language "C++"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../ex01/**.cpp"
      }
      links {"lua"}

   project "ex02"
      targetname "ex02"
      targetdir ("../../ex02/")
      kind "ConsoleApp"
      language "C++"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../ex02/**.cpp"
      }
      links {"lua"}

   project "ex03"
      targetname "ex03"
      targetdir ("../../ex03/")
      kind "ConsoleApp"
      language "C++"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../ex03/**.cpp"
      }
      links {"lua"}

   project "ex04"
      targetname "ex04"
      targetdir ("../../ex04/")
      kind "ConsoleApp"
      language "C++"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../ex04/**.cpp"
      }
      links {"lua"}

   project "ex05"
      targetname "ex05"
      targetdir ("../../ex05/")
      kind "ConsoleApp"
      language "C++"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../ex05/**.cpp"
      }
      links {"lua"}

   project "ex06"
      targetname "ex06"
      targetdir ("../../ex06/")
      kind "ConsoleApp"
      language "C++"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../ex06/**.cpp"
      }
      links {"lua"}

   project "ex07"
      targetname "ex07"
      targetdir ("../../ex07/")
      kind "ConsoleApp"
      language "C++"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../ex07/**.cpp"
      }
      links {"lua"}
