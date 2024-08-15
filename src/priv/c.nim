const C_HEADER* = "uv.h"

const uv {.used.} = "libuv"
const uv_static {.used.} = "libuv-static"

when defined(linux):
  static:
    const (_, exit_code) = gorgeEx("pkg-config --exist " & uv_static)
    when exit_code != 0:
      const libuv = uv
    else:
      const libuv = uv_static

    {.passC: staticExec("pkg-config -cflags " & libuv).}
    {.passL: staticExec("pkg-config -libs " & libuv).}
