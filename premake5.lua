
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "GLFW"
	kind "StaticLib"
	language "C"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/".. outputdir .. "/%{prj.name}")

	files
	{
		"include/**.h",
		"src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
		"src/window.c"
	}

	filter "system:windows"
		cppdialect "C++11"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"

		}
		
		
			files
	{
		"src/win32*.h",
		"src/wgl_context.c",
		"src/egl_context.c",
		"src/osmesa_context.c"
	}

	filter { "system:windows", "configurations:Release"}
		buildoptions "/MT"