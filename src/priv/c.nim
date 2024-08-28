const C_HEADER* = "uv.h"

const uv {.used.} = "libuv"
const uv_static {.used.} = "libuv-static"

static:
  when defined(linux):
    when defined(uvDynLib):
      const useDynLib = true
    else:
      const (_, exitCode) = gorgeEx("pkg-config --exist " & uv_static)
      const useDynLib = exitCode != 0

    when useDynLib:
      const libuv = uv
    else:
      const libuv = uv_static

    {.passC: staticExec("pkg-config -cflags " & libuv).}
    {.passL: staticExec("pkg-config -libs " & libuv).}
