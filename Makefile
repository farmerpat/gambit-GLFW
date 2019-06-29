CC_OPTIONS=-cc-options "-I/usr/include/GLFW -I/usr/include/GL -g"
LD_OPTIONS=-ld-options "-L/usr/lib/x86_64-linux-gnu/ -Wl,-rpath,/usr/lib/x86_64-linux-gnu/ -lglfw -lGLEW"

all:
	rm glfw.o1
	gsc $(CC_OPTIONS) $(LD_OPTIONS) glfw.scm
	#gsc -ld-options "-lglfw -lGLEW" glfw.scm
