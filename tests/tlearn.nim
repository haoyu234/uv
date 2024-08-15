import unittest
import std/macros

import uv

when defined(windows):
  import std/winlean
else:
  import std/posix

macro repr_untyped(n: untyped): string =
  newLit repr n

template check_zero(body) =
  checkpoint repr_untyped(body)

  let ec = body
  check ec >= 0

template when_posix(v1, v2): untyped =
  when defined(windows):
    v2
  else:
    v1

test "system info":
  var uptime: cdouble
  check_zero uv_uptime(uptime.addr)

  var resident_set_memory: csize_t
  check_zero uv_resident_set_memory(resident_set_memory.addr)

test "idle":
  var idle: uv_idle_t
  let loop = uv_default_loop()

  var idle_ctx {.global.} = 0

  check_zero uv_idle_init(loop, idle.addr)

  proc handler(p: ptr uv_idle_t) {.cdecl.} =
    inc idle_ctx
    check_zero uv_idle_stop(p)

  check_zero uv_idle_start(idle.addr, handler)
  check_zero uv_run(loop, UV_RUN_DEFAULT)

  check idle_ctx == 1

test "fs readsync":
  let loop = uv_default_loop()
  const path = currentSourcePath()

  checkpoint "uv_fs_open"

  var open_req: uv_fs_t
  let fd = uv_fs_open(loop, open_req.addr, path, when_posix(O_RDONLY.int32,
      0), when_posix(S_IRUSR.int32, 0), nil)

  var buf: array[37, byte]
  var iov = uv_buf_init(cast[cstring](buf.addr), len(buf).uint32)

  checkpoint "uv_fs_read"

  var read_req: uv_fs_t
  let n = uv_fs_read(loop, read_req.addr, fd, iov.addr, 1, 0, nil)

  check n > 0

  var close_req: uv_fs_t
  check_zero uv_fs_close(loop, close_req.addr, fd, nil)

  uv_fs_req_cleanup(open_req.addr)
  uv_fs_req_cleanup(read_req.addr)
  uv_fs_req_cleanup(close_req.addr)

  check_zero uv_run(loop, UV_RUN_DEFAULT)

test "fs readasync":
  let loop = uv_default_loop()
  const path = currentSourcePath()

  checkpoint "uv_fs_open"

  var open_req: uv_fs_t
  let fd = uv_fs_open(loop, open_req.addr, path, when_posix(O_RDONLY.int32,
      0), when_posix(S_IRUSR.int32, 0), nil)

  var buf: array[37, byte]
  var iov = uv_buf_init(cast[cstring](buf.addr), len(buf).uint32)

  checkpoint "uv_fs_read"

  proc read_cb(read_req: ptr uv_fs_t) {.cdecl.} =
    let n = uv_fs_get_result(read_req)
    check n > 0

    var close_req: uv_fs_t
    check_zero uv_fs_close(uv_default_loop(), close_req.addr, fd, nil)

    uv_fs_req_cleanup(read_req)
    uv_fs_req_cleanup(close_req.addr)

  var read_req: uv_fs_t
  check_zero uv_fs_read(loop, read_req.addr, fd, iov.addr, 1, 0, read_cb)

  uv_fs_req_cleanup(open_req.addr)

  check_zero uv_run(loop, UV_RUN_DEFAULT)
