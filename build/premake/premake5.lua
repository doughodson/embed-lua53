
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
   filter "configurations:Release"
      optimize "On"

   filter "system:windows"
         -- favor speed over size
         buildoptions { "/Ot" }
         defines { "WIN32", "_LIB", "NDEBUG" }

   -- common debug configuration flags and symbols
   filter "configurations:Debug"
      targetsuffix "_d"
      symbols "On"

   filter "system:windows"
         defines { "WIN32", "_LIB", "_DEBUG" }
   --
   -- stock lua library, interpreter and compiler
   --

   -- lua library
   project "lualib"
      targetname "lua"
      targetdir ("../../lua-5.3.5/lib/")
      kind "StaticLib"
      language "C"
      pic "On"
      includedirs { Lua_IncPath }
      files {
         "../../lua-5.3.5/src/**.*"
      }
      if os.ishost("linux") then
         defines { "LUA_COMPAT_MODULE_5_2", "LUA_USE_LINUX" }
      end

   -- lua interpreter (lua)
   project "lua"
      targetname "lua"
      targetdir ("../../lua")
      kind "ConsoleApp"
      language "C"
      includedirs { Lua_IncPath }
      files {
         "../../lua/lua.c"
      }
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end

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
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end

   --
   -- Related examples
   --

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
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end

   -- stack-dump (demostrates stack interface)"
   project "stack-dump"
      targetname "stack-dump"
      targetdir ("../../stack-dump")
      kind "ConsoleApp"
      language "C"
      includedirs { Lua_IncPath }
      files {
         "../../stack-dump/main.c"
      }
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end

   -- read-config (demostrates reading a config file)"
   project "read-config"
      targetname "read-config"
      targetdir ("../../read-config")
      kind "ConsoleApp"
      language "C"
      includedirs { Lua_IncPath }
      files {
         "../../read-config/main.c",
         "../../read-config/config.lua"
      }
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end

      -- shared library
      project "shared, C++ based library"
         targetname "shared"
         targetdir ("../../shared")
         kind "SharedLib"
         language "C++"
         pic "On"
         includedirs { Lua_IncPath }
         files {
            "../../shared/mylib.cpp",
            "../../shared/test.lua"
         }
--         links {"lualib"}
--         if os.ishost("linux") then
--            links {"dl", "m"}
--         end

   --
   -- examples from YouTube Lua tutorial
   --

   project "tutorial01"
      targetname "tutorial"
      targetdir ("../../tutorial01/")
      kind "ConsoleApp"
      language "C++"
      cppdialect "C++11"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../tutorial01/**.cpp"
      }
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end

   project "tutorial02"
      targetname "tutorial"
      targetdir ("../../tutorial02/")
      kind "ConsoleApp"
      language "C++"
      cppdialect "C++11"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../tutorial02/**.cpp"
      }
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end

   project "tutorial03"
      targetname "tutorial"
      targetdir ("../../tutorial03/")
      kind "ConsoleApp"
      language "C++"
      cppdialect "C++11"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../tutorial03/**.cpp"
      }
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end

   project "tutorial04"
      targetname "tutorial"
      targetdir ("../../tutorial04/")
      kind "ConsoleApp"
      language "C++"
      cppdialect "C++11"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../tutorial04/**.cpp"
      }
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end

   project "tutorial05"
      targetname "tutorial"
      targetdir ("../../tutorial05/")
      kind "ConsoleApp"
      language "C++"
      cppdialect "C++11"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../tutorial05/**.cpp"
      }
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end

   project "tutorial06"
      targetname "tutorial"
      targetdir ("../../tutorial06/")
      kind "ConsoleApp"
      language "C++"
      cppdialect "C++11"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../tutorial06/**.cpp"
      }
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end

   project "tutorial07"
      targetname "tutorial"
      targetdir ("../../tutorial07/")
      kind "ConsoleApp"
      language "C++"
      cppdialect "C++11"
      includedirs { Lua_IncPath }
      libdirs     { Lua_LibPath }
      files {
         "../../tutorial07/**.cpp"
      }
      links {"lualib"}
      if os.ishost("linux") then
         links {"dl", "m"}
      end
