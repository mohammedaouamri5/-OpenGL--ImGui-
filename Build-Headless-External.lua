-- WalnutExternal-Headless.lua

IncludeDir = {


}
IncludeDir["glm"] = "../vendor/glm"
IncludeDir["spdlog"] = "../vendor/spdlog/include"
IncludeDir["vendor"] = "../vendor/"
IncludeDir["X11"] = "../vendor/X11"
 
group "Dependencies"
   include "vendor/yaml-cpp"
group ""

-- group "Core"
--     include "Walnut/Build-Headless.lua"

     
group ""