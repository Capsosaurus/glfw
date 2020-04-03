project "glfw"
	kind "StaticLib"
	language "C"
	
	staticruntime "on"

	--warnings "Extra"

	targetdir ("%{OutputDir.bin}")
	objdir ("%{OutputDir.obj}")


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

	includedirs
	{
		"include"
	}


	defines
	{
		"_GLFW_USE_OPENGL",
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

		files 
		{
			"src/win32*.c",
			"src/win32_joystick.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}
		
		links
		{
			
		}

	filter "configurations:Debug"

		optimize "Debug"
		runtime "Debug"

	filter "configurations:Release"

		optimize "On"
		runtime "Release"

