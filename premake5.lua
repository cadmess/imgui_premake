--if our specified target output starts with "vs" for "visual studio", run our tweaks file.
iif(string.sub(_ACTION,1,string.len("vs"))=="vs", include("premake5vstweaks.lua"), "")

workspace "imgui_premake"
    configurations { "Debug", "Release" }
    -- startproject "imgui_glfw_vulkan"
    startproject "test_project"

output_dir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
vulkan_sdk = os.getenv("VULKAN_SDK")

print("using vulkan sdk path: " .. vulkan_sdk)

-- root-level projects should go before submodule scripts, lest they override your solution.
include "projects/common"
include "projects/imgui_glfw_opengl3"
include "projects/imgui_glfw_vulkan"
include "projects/test_project"

group "submodules"
    include "submodules/premake5_glad.lua"
    include "submodules/premake5_glfw.lua"
    include "submodules/premake5_glm.lua"
    include "submodules/premake5_imgui.lua"
group ""