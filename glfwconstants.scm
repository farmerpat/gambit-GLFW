(include "tffi.scm")

(declare 
 (block)
 (mostly-fixnum)
 )
(c-constants
  #||--- Version info ---||#
 GLFW_VERSION_MAJOR 
 GLFW_VERSION_MINOR
 GLFW_VERSION_REVISION
 
 
 #||--- ERROR CODES ---||#
 GLFW_NOT_INITIALIZED
 
 GLFW_NO_CURRENT_CONTEXT
 
 GLFW_INVALID_ENUM
 
 GLFW_INVALID_VALUE
 
 GLFW_OUT_OF_MEMORY
 
 GLFW_API_UNAVAILABLE
 
 GLFW_VERSION_UNAVAILABLE
 
 GLFW_PLATFORM_ERROR
 
 GLFW_FORMAT_UNAVAILABLE
  #||--- HINTS ---||#

  #|| Window hints ||#
 
 ;; specifies whether the window will be resizable by the user. The window will still be resizable using the glfwSetWindowSize function. This hint is ignored for full screen windows.
 GLFW_RESIZABLE
 
 ;; specifies whether the window will be initially visible. This hint is ignored for full screen windows.
 GLFW_VISIBLE
 
 ;; specifies whether the window will have window decorations such as a border, a close widget, etc. This hint is ignored for full screen windows.
 GLFW_DECORATED
 
 #|| Framebuffer hints ||#
 
 ;; specify the desired bit depths of the various components of the default framebuffer.
 GLFW_RED_BITS
 GLFW_GREEN_BITS
 GLFW_BLUE_BITS
 GLFW_ALPHA_BITS
 GLFW_DEPTH_BITS
 GLFW_STENCIL_BITS
 
 ;;specify the desired bit depths of the various components of the accumulation buffer.
 GLFW_ACCUM_RED_BITS
 GLFW_ACCUM_GREEN_BITS
 GLFW_ACCUM_BLUE_BITS
 GLFW_ACCUM_ALPHA_BITS
 
 ;; hint specifies the desired number of auxiliary buffers.
 GLFW_AUX_BUFFERS
 
 ;;specifies whether to use stereoscopic rendering.
 GLFW_STEREO
 
 ;; specifies the desired number of samples to use for multisampling. Zero disables multisampling.
 GLFW_SAMPLES 
 ;; specifies the desired refresh rate for full screen windows. If set to zero, the highest available refresh rate will be used. This hint is ignored for windowed mode windows.
 GLFW_REFRESH_RATE
 
  #|| Context hints ||#
 
 ;; specifies which client API to create the context for
 GLFW_CLIENT_API  ;; Possible values are :
 GLFW_OPENGL_API GLFW_OPENGL_ES_API
 
 ;; specify the client API version that the created context must be compatible with.
 ;;  glfwCreateWindow will fail if the resulting OpenGL version is less than the one requested.
 GLFW_CONTEXT_VERSION_MAJOR GLFW_CONTEXT_VERSION_MINOR
 
 #||--- INPUT ---||#
 GLFW_RELEASE 
 GLFW_PRESS
 GLFW_REPEAT
 
 
 #|| joystick buttons ||#
 GLFW_JOYSTICK_1
 GLFW_JOYSTICK_2
 GLFW_JOYSTICK_3
 GLFW_JOYSTICK_4
 GLFW_JOYSTICK_5
 GLFW_JOYSTICK_6
 GLFW_JOYSTICK_7
 GLFW_JOYSTICK_8
 GLFW_JOYSTICK_9
 GLFW_JOYSTICK_10
 GLFW_JOYSTICK_11
 GLFW_JOYSTICK_12
 GLFW_JOYSTICK_13
 GLFW_JOYSTICK_14
 GLFW_JOYSTICK_15
 GLFW_JOYSTICK_16
 GLFW_JOYSTICK_LAST
 
  #|| keyboard keys ||#
GLFW_KEY_UNKNOWN
GLFW_KEY_SPACE
GLFW_KEY_APOSTROPHE
GLFW_KEY_COMMA
GLFW_KEY_MINUS
GLFW_KEY_PERIOD
GLFW_KEY_SLASH
GLFW_KEY_0
GLFW_KEY_1
GLFW_KEY_2
GLFW_KEY_3
GLFW_KEY_4
GLFW_KEY_5
GLFW_KEY_6
GLFW_KEY_7
GLFW_KEY_8
GLFW_KEY_9
GLFW_KEY_SEMICOLON
GLFW_KEY_EQUAL
GLFW_KEY_A
GLFW_KEY_B
GLFW_KEY_C
GLFW_KEY_D
GLFW_KEY_E
GLFW_KEY_F
GLFW_KEY_G
GLFW_KEY_H
GLFW_KEY_I
GLFW_KEY_J
GLFW_KEY_K
GLFW_KEY_L
GLFW_KEY_M
GLFW_KEY_N
GLFW_KEY_O
GLFW_KEY_P
GLFW_KEY_Q
GLFW_KEY_R
GLFW_KEY_S
GLFW_KEY_T
GLFW_KEY_U
GLFW_KEY_V
GLFW_KEY_W
GLFW_KEY_X
GLFW_KEY_Y
GLFW_KEY_Z
GLFW_KEY_LEFT_BRACKET
GLFW_KEY_BACKSLASH
GLFW_KEY_RIGHT_BRACKET
GLFW_KEY_GRAVE_ACCENT
GLFW_KEY_WORLD_1
GLFW_KEY_WORLD_2
GLFW_KEY_ESCAPE
GLFW_KEY_ENTER
GLFW_KEY_TAB
GLFW_KEY_BACKSPACE
GLFW_KEY_INSERT
GLFW_KEY_DELETE
GLFW_KEY_RIGHT
GLFW_KEY_LEFT
GLFW_KEY_DOWN
GLFW_KEY_UP
GLFW_KEY_PAGE_UP
GLFW_KEY_PAGE_DOWN
GLFW_KEY_HOME
GLFW_KEY_END
GLFW_KEY_CAPS_LOCK
GLFW_KEY_SCROLL_LOCK
GLFW_KEY_NUM_LOCK
GLFW_KEY_PRINT_SCREEN
GLFW_KEY_PAUSE
GLFW_KEY_F1
GLFW_KEY_F2
GLFW_KEY_F3
GLFW_KEY_F4
GLFW_KEY_F5
GLFW_KEY_F6
GLFW_KEY_F7
GLFW_KEY_F8
GLFW_KEY_F9
GLFW_KEY_F10
GLFW_KEY_F11
GLFW_KEY_F12
GLFW_KEY_F13
GLFW_KEY_F14
GLFW_KEY_F15
GLFW_KEY_F16
GLFW_KEY_F17
GLFW_KEY_F18
GLFW_KEY_F19
GLFW_KEY_F20
GLFW_KEY_F21
GLFW_KEY_F22
GLFW_KEY_F23
GLFW_KEY_F24
GLFW_KEY_F25
GLFW_KEY_KP_0
GLFW_KEY_KP_1
GLFW_KEY_KP_2
GLFW_KEY_KP_3
GLFW_KEY_KP_4
GLFW_KEY_KP_5
GLFW_KEY_KP_6
GLFW_KEY_KP_7
GLFW_KEY_KP_8
GLFW_KEY_KP_9
GLFW_KEY_KP_DECIMAL
GLFW_KEY_KP_DIVIDE
GLFW_KEY_KP_MULTIPLY
GLFW_KEY_KP_SUBTRACT
GLFW_KEY_KP_ADD
GLFW_KEY_KP_ENTER
GLFW_KEY_KP_EQUAL
GLFW_KEY_LEFT_SHIFT
GLFW_KEY_LEFT_CONTROL
GLFW_KEY_LEFT_ALT
GLFW_KEY_LEFT_SUPER
GLFW_KEY_RIGHT_SHIFT
GLFW_KEY_RIGHT_CONTROL
GLFW_KEY_RIGHT_ALT
GLFW_KEY_RIGHT_SUPER
GLFW_KEY_MENU
GLFW_KEY_LAST

  #|| keyboard modifier key flags ||#
GLFW_MOD_SHIFT
GLFW_MOD_CONTROL
GLFW_MOD_ALT
GLFW_MOD_SUPER

 #|| mouse keys ||#
GLFW_MOUSE_BUTTON_1
GLFW_MOUSE_BUTTON_2
GLFW_MOUSE_BUTTON_3
GLFW_MOUSE_BUTTON_4
GLFW_MOUSE_BUTTON_5
GLFW_MOUSE_BUTTON_6
GLFW_MOUSE_BUTTON_7
GLFW_MOUSE_BUTTON_8
GLFW_MOUSE_BUTTON_LAST
GLFW_MOUSE_BUTTON_LEFT
GLFW_MOUSE_BUTTON_RIGHT
GLFW_MOUSE_BUTTON_MIDDLE

#|| just missing ||#
GLFW_CONTEXT_ROBUSTNESS
GLFW_FOCUSED
GLFW_ICONIFIED
GLFW_LOSE_CONTEXT_ON_RESET
GLFW_NO_RESET_NOTIFICATION
GLFW_NO_ROBUSTNESS
GLFW_OPENGL_ANY_PROFILE
GLFW_OPENGL_COMPAT_PROFILE
GLFW_OPENGL_CORE_PROFILE
GLFW_OPENGL_DEBUG_CONTEXT
GLFW_OPENGL_FORWARD_COMPAT
GLFW_OPENGL_PROFILE
GL_FALSE
GL_TRUE

 )
