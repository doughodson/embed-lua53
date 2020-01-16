

#include <iostream>

#include "sol/sol.hpp"
#include <cassert>

int main()
{
   sol::state lua;
   int x{};
   lua.set_function("beep", [&x]{ ++x; });
   lua.script("beep()");
   assert(x == 1);

   std::cout << "x = " << x << std::endl;
   return 0;
}


