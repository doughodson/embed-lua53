rem delete old solution/workspace files
rem
rmdir /S /Q ..\gmake
rmdir /S /Q ..\vs2019
rmdir /S /Q ..\obj
rem
rem delete old compiled libraries
rem
del ..\..\lib\*.lib
rem
rem create new solution/workspace files
rem
premake5_alpha14.exe --os=windows --file=premake5.lua vs2019
