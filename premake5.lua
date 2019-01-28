project "GLFW"
	kind "StaticLib"
	language "C"
	
	staticruntime "Off"

	targetdir (OutTargetDir)
	objdir (OutObjDir)

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
		"src/win32*.c",
		"src/wgl_context.c",
		"src/egl_context.c",
		"src/osmesa_context.c"
		}
			
		filter "configurations:Debug"
			optimize "Debug"
			runtime "Debug"


		filter "configurations:Release"
			optimize "On"
			runtime "Release"

		filter "configurations:Dist"
			optimize "On"
			runtime "Release"