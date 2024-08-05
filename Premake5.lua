project "fastgltf"
    kind "StaticLib"
    language "C++"
    staticruntime "On"
	flags { "MultiProcessorCompile" }
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("obj/" .. outputdir .. "/%{prj.name}")

    files
    {
        "src/*",
        "deps/simdjson/simdjson.cpp"
    }

    includedirs
    {
        "include/",
        "deps/simdjson/"
    }

    filter "system:windows"
        systemversion "latest"
        cppdialect "C++20"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"
		optimize "Debug"

	filter "configurations:Release"
		runtime "Debug"
		symbols "On"
		optimize "On"

	filter "configurations:Distribution"
		runtime "Release"
		symbols "Off"
		optimize "Full"

