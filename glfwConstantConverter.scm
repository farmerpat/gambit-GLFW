

(declare 
 (block)
 (mostly-fixnum)
 )

(define (glfw-error->symbol error-code)
  (cond
    ((eq? error-code GLFW_NOT_INITIALIZED)     'glfw-not-initialized)
    ((eq? error-code GLFW_NO_CURRENT_CONTEXT)  'glfw-no-current-context)
    ((eq? error-code GLFW_INVALID_ENUM)        'glfw-invalid-enum)
    ((eq? error-code GLFW_INVALID_VALUE)       'glfw-invalid-value)
    ((eq? error-code GLFW_OUT_OF_MEMORY)       'glfw-out-of-memory)
    ((eq? error-code GLFW_API_UNAVAILABLE)     'glfw-api-unavailable)
    ((eq? error-code GLFW_VERSION_UNAVAILABLE) 'glfw-version-unavailable)
    ((eq? error-code GLFW_PLATFORM_ERROR)      'glfw-platform-error)
    ((eq? error-code GLFW_FORMAT_UNAVAILABLE)  'glfw-format-unavailable)
    (else (error "Invalid constant passed " error-code))
    )
  )
(define (symbol->glfw-error-code symbol)
  (case symbol
    ((glfw-not-initialized)     GLFW_NOT_INITIALIZED)
    ((glfw-no-current-context)  GLFW_NO_CURRENT_CONTEXT)
    ((glfw-invalid-enum)        GLFW_INVALID_ENUM)
    ((glfw-invalid-value)       GLFW_INVALID_VALUE)
    ((glfw-out-of-memory)       GLFW_OUT_OF_MEMORY)
    ((glfw-api-unavailable)     GLFW_API_UNAVAILABLE)
    ((glfw-version-unavailable) GLFW_VERSION_UNAVAILABLE)
    ((glfw-platform-error)      GLFW_PLATFORM_ERROR)
    ((glfw-format-unavailable)  GLFW_FORMAT_UNAVAILABLE)
    (else (error "Invalid symbol passed " symbol))
    )
  )

(define (symbol->glfw-hint symbol)
  (case symbol
    ((glfw-resizable)             GLFW_RESIZABLE)
    ((glfw-visible)               GLFW_VISIBLE)
    ((glfw-decorated)             GLFW_DECORATED)
    ((glfw-red-bits)              GLFW_RED_BITS)
    ((glfw-blue-bits)             GLFW_BLUE_BITS)
    ((glfw-alpha-bits)            GLFW_ALPHA_BITS)
    ((glfw-depth-bits)            GLFW_DEPTH_BITS)
    ((glfw-stencil-bits)          GLFW_STENCIL_BITS)
    ((glfw-accum-red-bits)        GLFW_ACCUM_RED_BITS)
    ((glfw-accum-green-bits)      GLFW_ACCUM_GREEN_BITS)
    ((glfw-accum-blue-bits)       GLFW_ACCUM_BLUE_BITS)
    ((glfw-accum-alpha-bits)      GLFW_ACCUM_ALPHA_BITS)
    ((glfw-aux-buffers)           GLFW_AUX_BUFFERS)
    ((glfw-glfw-stereo)           GLFW_STEREO)
    ((glfw-samples)               GLFW_SAMPLES)
    ((glfw-refresh-rate)          GLFW_REFRESH_RATE)
    ((glfw-client-api)            GLFW_CLIENT_API)
    ((glfw-context-version-major) GLFW_CONTEXT_VERSION_MAJOR)
    ((glfw-context-version-minor) GLFW_CONTEXT_VERSION_MINOR)
    ((focused?)                   GLFW_FOCUSED)
    ((forward-compatible?)   GLFW_OPENGL_FORWARD_COMPAT)
    ((opengl-debug-context?) GLFW_OPENGL_DEBUG_CONTEXT)
    ((opengl-profile)        GLFW_OPENGL_PROFILE)
    ;((context-robustness)    GLFW_CONTEXT_ROBUSTNESS)
    (else (if (fixnum? symbol)
              symbol
              (error "Invalid symbol passed " symbol)
              ))
    ))

(define (symbol->glfw-hint-value symbol)
  (case symbol
    ((#t)                 1)
    ((#f)                 0)
    ((glfw-opengl-api)    GLFW_OPENGL_API)
    ((glfw-opengl-es-api) GLFW_OPENGL_ES_API)    
    (else 
     (if (fixnum? symbol)
         symbol
         (error "Invalid symbol passed " symbol)
         )
     )))

(define (symbol->glfw-attribute symbol)
(case symbol
  ((focused?)              GLFW_FOCUSED)
  ((iconified?)            GLFW_ICONIFIED)
  ((decorated?)            GLFW_DECORATED)
  ((forward-compatible?)   GLFW_OPENGL_FORWARD_COMPAT)
  ((opengl-debug-context?) GLFW_OPENGL_DEBUG_CONTEXT)
  ((opengl-profile)        GLFW_OPENGL_PROFILE)
  ((context-robustness)    GLFW_CONTEXT_ROBUSTNESS)
  (else (error "Invalid symbol passed " symbol))
  ))
(define (glfw-attribute-value->symbol glfw-attribute)
  (cond 
   ((eq? glfw-attribute GL_TRUE)                     #t)
   ((eq? glfw-attribute GL_FALSE)                    #f) 
   ((eq? glfw-attribute GLFW_OPENGL_CORE_PROFILE)    'opengl-core-profile)
   ((eq? glfw-attribute GLFW_OPENGL_COMPAT_PROFILE)  'opengl-compatible-profile)
   ((eq? glfw-attribute GLFW_OPENGL_ANY_PROFILE)     'opengl-any-profile)   
   ((eq? glfw-attribute GLFW_LOSE_CONTEXT_ON_RESET)  'lose-context-on-reset)
   ((eq? glfw-attribute GLFW_NO_RESET_NOTIFICATION)  'no-reset-notification)
   ((eq? glfw-attribute GLFW_NO_ROBUSTNESS)          'no-robustness)
   (else glfw-attribute)
   )
  )

(define (glfw-action->symbol action)
  (cond 
    ((eq? action GLFW_RELEASE)   'glfw-release)
    ((eq? action GLFW_PRESS)     'glfw-press)
    ((eq? action GLFW_REPEAT)    'glfw-repeat) 
    (else (error "Invalid action passed " action))
    ))

(define (symbol->glfw-action symbol)
  (case symbol
    ((glfw-release)    GLFW_RELEASE)
    ((glfw-press)      GLFW_RELEASE)
    ((glfw-repeat)     GLFW_REPEAT)
   
    (else (error "Invalid symbol passed " symbol))
    ))

(define (glfw-mod-key->symbol glfw-mod-key)
  (cond
   ((eq? glfw-mod-key GLFW_MOD_SHIFT)    'shift)
   ((eq? glfw-mod-key GLFW_MOD_CONTROL)  'control)
   ((eq? glfw-mod-key GLFW_MOD_ALT)      'alt)
   ((eq? glfw-mod-key GLFW_MOD_SUPER)    'super)
   (else (error "Invalid mod key passed " glfw-mod-key))
   ))
(define (symbol->glfw-mod-key symbol)
  (case symbol
    ((shift)     GLFW_MOD_SHIFT)
    ((controlL)  GLFW_MOD_CONTROL)
    ((alt)       GLFW_MOD_ALT)
    ((super)     GLFW_MOD_SUPER)
    (else (error "Invalid symbol passed " symbol))
    ))

(define (symbol->glfw-mouse-button symbol)
  (case symbol
    ((mouse-button-1)       GLFW_MOUSE_BUTTON_1)
    ((mouse-button-2)       GLFW_MOUSE_BUTTON_2)
    ((mouse-button-3)       GLFW_MOUSE_BUTTON_3)
    ((mouse-button-4)       GLFW_MOUSE_BUTTON_4)
    ((mouse-button-5)       GLFW_MOUSE_BUTTON_5)
    ((mouse-button-6)       GLFW_MOUSE_BUTTON_6)
    ((mouse-button-7)       GLFW_MOUSE_BUTTON_7)
    ((mouse-button-8)       GLFW_MOUSE_BUTTON_8)
    ((mouse-button-last)    GLFW_MOUSE_BUTTON_LAST)
    ((mouse-button-left)    GLFW_MOUSE_BUTTON_LEFT)
    ((mouse-button-right)   GLFW_MOUSE_BUTTON_RIGHT)
    ((mouse-button-middle)  GLFW_MOUSE_BUTTON_MIDDLE)
    (else (error "Invalid symbol passed " symbol))
    ))
(define (glfw-mouse-button->symbol glfw-mouse-button)
  (cond
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_1)       'mouse-button-1)
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_2)       'mouse-button-2)
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_3)       'mouse-button-3)
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_4)       'mouse-button-4)
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_5)       'mouse-button-5)
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_6)       'mouse-button-6)
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_7)       'mouse-button-7)
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_8)       'mouse-button-8)
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_LAST)    'mouse-button-last)
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_LEFT)    'mouse-button-left)
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_RIGHT)   'mouse-button-right)
    ((eq? glfw-mouse-button GLFW_MOUSE_BUTTON_MIDDLE)  'mouse-button-middle)
    (else (error "Invalid mouse button passed " glfw-mouse-button))
    ))

(define (glfw-key->schmobj glfw-key)
  (cond
   ((eq? glfw-key GLFW_KEY_UNKNOWN)        #f)
   ((eq? glfw-key GLFW_KEY_SPACE)          #\space)
   ((eq? glfw-key GLFW_KEY_APOSTROPHE)     #\')
   ((eq? glfw-key GLFW_KEY_COMMA)          #\,)
   ((eq? glfw-key GLFW_KEY_MINUS)          #\-)
   ((eq? glfw-key GLFW_KEY_PERIOD)         #\.)
   ((eq? glfw-key GLFW_KEY_SLASH)          #\/)
   ((eq? glfw-key GLFW_KEY_0)              #\0)
   ((eq? glfw-key GLFW_KEY_1)              #\1)
   ((eq? glfw-key GLFW_KEY_2)              #\2)
   ((eq? glfw-key GLFW_KEY_3)              #\3)
   ((eq? glfw-key GLFW_KEY_4)              #\4)
   ((eq? glfw-key GLFW_KEY_5)              #\5)
   ((eq? glfw-key GLFW_KEY_6)              #\6)
   ((eq? glfw-key GLFW_KEY_7)              #\7)
   ((eq? glfw-key GLFW_KEY_8)              #\8)
   ((eq? glfw-key GLFW_KEY_9)              #\9)
   ((eq? glfw-key GLFW_KEY_SEMICOLON)      #\;)
   ((eq? glfw-key GLFW_KEY_EQUAL)          #\=)
   ((eq? glfw-key GLFW_KEY_A)              #\A)
   ((eq? glfw-key GLFW_KEY_B)              #\B)
   ((eq? glfw-key GLFW_KEY_C)              #\C)
   ((eq? glfw-key GLFW_KEY_D)              #\D)
   ((eq? glfw-key GLFW_KEY_E)              #\E)
   ((eq? glfw-key GLFW_KEY_F)              #\F)
   ((eq? glfw-key GLFW_KEY_G)              #\G)
   ((eq? glfw-key GLFW_KEY_H)              #\H)
   ((eq? glfw-key GLFW_KEY_I)              #\I)
   ((eq? glfw-key GLFW_KEY_J)              #\J)
   ((eq? glfw-key GLFW_KEY_K)              #\K)
   ((eq? glfw-key GLFW_KEY_L)              #\L)
   ((eq? glfw-key GLFW_KEY_M)              #\M)
   ((eq? glfw-key GLFW_KEY_N)              #\N)
   ((eq? glfw-key GLFW_KEY_O)              #\O)
   ((eq? glfw-key GLFW_KEY_P)              #\P)
   ((eq? glfw-key GLFW_KEY_Q)              #\Q)
   ((eq? glfw-key GLFW_KEY_R)              #\R)
   ((eq? glfw-key GLFW_KEY_S)              #\S)
   ((eq? glfw-key GLFW_KEY_T)              #\T)
   ((eq? glfw-key GLFW_KEY_U)              #\U)
   ((eq? glfw-key GLFW_KEY_V)              #\V)
   ((eq? glfw-key GLFW_KEY_W)              #\W)
   ((eq? glfw-key GLFW_KEY_X)              #\X)
   ((eq? glfw-key GLFW_KEY_Y)              #\Y)
   ((eq? glfw-key GLFW_KEY_Z)              #\Z)
   ((eq? glfw-key GLFW_KEY_LEFT_BRACKET)   #\')
   ((eq? glfw-key GLFW_KEY_BACKSLASH)      #\\)
   ((eq? glfw-key GLFW_KEY_RIGHT_BRACKET)  #\])
   ((eq? glfw-key GLFW_KEY_GRAVE_ACCENT)   #\`)
   ((eq? glfw-key GLFW_KEY_WORLD_1)        'key-world-1)
   ((eq? glfw-key GLFW_KEY_WORLD_2)        'key-world-2)
   ((eq? glfw-key GLFW_KEY_ESCAPE)         'esc)
   ((eq? glfw-key GLFW_KEY_ENTER)          #\return)
   ((eq? glfw-key GLFW_KEY_TAB)            #\tab)
   ((eq? glfw-key GLFW_KEY_BACKSPACE)      #\backspace)
   ((eq? glfw-key GLFW_KEY_INSERT)         'insert)
   ((eq? glfw-key GLFW_KEY_DELETE)         #\delete)
   ((eq? glfw-key GLFW_KEY_RIGHT)          'key-right)
   ((eq? glfw-key GLFW_KEY_LEFT)           'key-left)
   ((eq? glfw-key GLFW_KEY_DOWN)           'key-down)
   ((eq? glfw-key GLFW_KEY_UP)             'key-up)
   ((eq? glfw-key GLFW_KEY_PAGE_UP)        'page-up)
   ((eq? glfw-key GLFW_KEY_PAGE_DOWN)      'page-down)
   ((eq? glfw-key GLFW_KEY_HOME)           'home)
   ((eq? glfw-key GLFW_KEY_END)            'end)
   ((eq? glfw-key GLFW_KEY_CAPS_LOCK)      'caps-cok)
   ((eq? glfw-key GLFW_KEY_SCROLL_LOCK)    'scroll-lock)
   ((eq? glfw-key GLFW_KEY_NUM_LOCK)       'num-lock)
   ((eq? glfw-key GLFW_KEY_PRINT_SCREEN)   'print-screen)
   ((eq? glfw-key GLFW_KEY_PAUSE)          'pause)
   ((eq? glfw-key GLFW_KEY_F1)             'f1)
   ((eq? glfw-key GLFW_KEY_F2)             'f2)
   ((eq? glfw-key GLFW_KEY_F3)             'f3)
   ((eq? glfw-key GLFW_KEY_F4)             'f4)
   ((eq? glfw-key GLFW_KEY_F5)             'f5)
   ((eq? glfw-key GLFW_KEY_F6)             'f6)
   ((eq? glfw-key GLFW_KEY_F7)             'f7)
   ((eq? glfw-key GLFW_KEY_F8)             'f8)
   ((eq? glfw-key GLFW_KEY_F9)             'f9)
   ((eq? glfw-key GLFW_KEY_F10)            'f10)
   ((eq? glfw-key GLFW_KEY_F11)            'f11)
   ((eq? glfw-key GLFW_KEY_F12)            'f12)
   ((eq? glfw-key GLFW_KEY_F13)            'f13)
   ((eq? glfw-key GLFW_KEY_F14)            'f14)
   ((eq? glfw-key GLFW_KEY_F15)            'f15)
   ((eq? glfw-key GLFW_KEY_F16)            'f16)
   ((eq? glfw-key GLFW_KEY_F17)            'f17)
   ((eq? glfw-key GLFW_KEY_F18)            'f18)
   ((eq? glfw-key GLFW_KEY_F19)            'f19)
   ((eq? glfw-key GLFW_KEY_F20)            'f20)
   ((eq? glfw-key GLFW_KEY_F21)            'f21)
   ((eq? glfw-key GLFW_KEY_F22)            'f22)
   ((eq? glfw-key GLFW_KEY_F23)            'f23)
   ((eq? glfw-key GLFW_KEY_F24)            'f24)
   ((eq? glfw-key GLFW_KEY_F25)            'f25)
   ((eq? glfw-key GLFW_KEY_KP_0)           'kp1)
   ((eq? glfw-key GLFW_KEY_KP_1)           'kp2)
   ((eq? glfw-key GLFW_KEY_KP_2)           'kp3)
   ((eq? glfw-key GLFW_KEY_KP_3)           'kp4)
   ((eq? glfw-key GLFW_KEY_KP_4)           'kp5)
   ((eq? glfw-key GLFW_KEY_KP_5)           'kp6)
   ((eq? glfw-key GLFW_KEY_KP_6)           'kp7)
   ((eq? glfw-key GLFW_KEY_KP_7)           'kp8)
   ((eq? glfw-key GLFW_KEY_KP_8)           'kp9)
   ((eq? glfw-key GLFW_KEY_KP_9)           'kp10)
   ((eq? glfw-key GLFW_KEY_KP_DECIMAL)     'kp-decimal)
   ((eq? glfw-key GLFW_KEY_KP_DIVIDE)      'kp/)
   ((eq? glfw-key GLFW_KEY_KP_MULTIPLY)    'kp*)
   ((eq? glfw-key GLFW_KEY_KP_SUBTRACT)    'kp-)
   ((eq? glfw-key GLFW_KEY_KP_ADD)         'kp+)
   ((eq? glfw-key GLFW_KEY_KP_ENTER)       'kp-enter)
   ((eq? glfw-key GLFW_KEY_KP_EQUAL)       'kp=)
   ((eq? glfw-key GLFW_KEY_LEFT_SHIFT)     'l-shift)
   ((eq? glfw-key GLFW_KEY_LEFT_CONTROL)   'l-control)
   ((eq? glfw-key GLFW_KEY_LEFT_ALT)       'l-alt)
   ((eq? glfw-key GLFW_KEY_LEFT_SUPER)     'l-super)
   ((eq? glfw-key GLFW_KEY_RIGHT_SHIFT)    'r-shift)
   ((eq? glfw-key GLFW_KEY_RIGHT_CONTROL)  'r-control)
   ((eq? glfw-key GLFW_KEY_RIGHT_ALT)      'r-alt)
   ((eq? glfw-key GLFW_KEY_RIGHT_SUPER)    'r-super)
   ((eq? glfw-key GLFW_KEY_MENU)           'menu)
   ((eq? glfw-key GLFW_KEY_LAST)           'last)
   (else (error "Invalid key pressed " glfw-key))
   )
  )
