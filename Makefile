# Alternative GNU Make workspace makefile autogenerated by Premake

ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifeq ($(config),debug)
  ImGui_config = debug
  GLFW_config = debug
  yaml_cpp_config = debug
  stb_image_config = debug
  SOIL_config = debug
  main_config = debug

else ifeq ($(config),release)
  ImGui_config = release
  GLFW_config = release
  yaml_cpp_config = release
  stb_image_config = release
  SOIL_config = release
  main_config = release

else ifeq ($(config),dist)
  ImGui_config = dist   
  GLFW_config = dist   
  yaml_cpp_config = dist   
  stb_image_config = dist   
  SOIL_config = dist   
  main_config = dist   

else
  $(error "invalid configuration $(config)")
endif

PROJECTS := ImGui GLFW yaml-cpp stb_image SOIL main

.PHONY: all clean help $(PROJECTS) Dependencies

all: $(PROJECTS)

Dependencies: GLFW ImGui SOIL stb_image yaml-cpp

ImGui:
ifneq (,$(ImGui_config))
	@echo "==== Building ImGui ($(ImGui_config)) ===="
	@${MAKE} --no-print-directory -C vendor/imgui -f Makefile config=$(ImGui_config)
endif

GLFW:
ifneq (,$(GLFW_config))
	@echo "==== Building GLFW ($(GLFW_config)) ===="
	@${MAKE} --no-print-directory -C vendor/GLFW -f Makefile config=$(GLFW_config)
endif

yaml-cpp:
ifneq (,$(yaml_cpp_config))
	@echo "==== Building yaml-cpp ($(yaml_cpp_config)) ===="
	@${MAKE} --no-print-directory -C vendor/yaml-cpp -f Makefile config=$(yaml_cpp_config)
endif

stb_image:
ifneq (,$(stb_image_config))
	@echo "==== Building stb_image ($(stb_image_config)) ===="
	@${MAKE} --no-print-directory -C vendor/stb_image -f Makefile config=$(stb_image_config)
endif

SOIL:
ifneq (,$(SOIL_config))
	@echo "==== Building SOIL ($(SOIL_config)) ===="
	@${MAKE} --no-print-directory -C vendor/SOIL -f Makefile config=$(SOIL_config)
endif

main: ImGui stb_image SOIL GLFW
ifneq (,$(main_config))
	@echo "==== Building main ($(main_config)) ===="
	@${MAKE} --no-print-directory -C main -f Makefile config=$(main_config)
endif

clean:
	@${MAKE} --no-print-directory -C vendor/imgui -f Makefile clean
	@${MAKE} --no-print-directory -C vendor/GLFW -f Makefile clean
	@${MAKE} --no-print-directory -C vendor/yaml-cpp -f Makefile clean
	@${MAKE} --no-print-directory -C vendor/stb_image -f Makefile clean
	@${MAKE} --no-print-directory -C vendor/SOIL -f Makefile clean
	@${MAKE} --no-print-directory -C main -f Makefile clean

help:
	@echo "Usage: make [config=name] [target]"
	@echo ""
	@echo "CONFIGURATIONS:"
	@echo "  debug"
	@echo "  release"
	@echo "  dist"
	@echo ""
	@echo "TARGETS:"
	@echo "   all (default)"
	@echo "   clean"
	@echo "   ImGui"
	@echo "   GLFW"
	@echo "   yaml-cpp"
	@echo "   stb_image"
	@echo "   SOIL"
	@echo "   main"
	@echo ""
	@echo "For more information, see https://github.com/premake/premake-core/wiki"