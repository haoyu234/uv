import unittest

import uv

test "version":
  echo "version: ", uv_version_string()

test "loop":
  let loop = uv_default_loop()
  discard uv_run(loop, UV_RUN_DEFAULT)

test "cpu_info":
  var len: cint
  var infos: ptr uv_cpu_info_t

  let n = uv_cpu_info(infos.addr, len.addr)
  check n == 0

  for idx in 0..<len:
    echo cast[ptr UncheckedArray[uv_cpu_info_t]](infos)[idx]

  uv_free_cpu_info(infos, len)
