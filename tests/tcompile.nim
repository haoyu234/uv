import unittest

import uv

test "uv version":
  echo "version: ", uv_version_string()

test "uv loop":
  let loop = uv_default_loop()
  discard uv_run(loop, UV_RUN_DEFAULT)
