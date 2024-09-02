import ./c

template importFlags(name): untyped =
  let name* {.importc, header: C_HEADER.}: cint

# fs open() flags
importFlags(UV_FS_O_APPEND)
importFlags(UV_FS_O_CREAT)
importFlags(UV_FS_O_EXCL)
importFlags(UV_FS_O_FILEMAP)
importFlags(UV_FS_O_RANDOM)
importFlags(UV_FS_O_RDONLY)
importFlags(UV_FS_O_RDWR)
importFlags(UV_FS_O_SEQUENTIAL)
importFlags(UV_FS_O_SHORT_LIVED)
importFlags(UV_FS_O_TEMPORARY)
importFlags(UV_FS_O_TRUNC)
importFlags(UV_FS_O_WRONLY)
importFlags(UV_FS_O_DIRECT)
importFlags(UV_FS_O_DIRECTORY)
importFlags(UV_FS_O_DSYNC)
importFlags(UV_FS_O_EXLOCK)
importFlags(UV_FS_O_NOATIME)
importFlags(UV_FS_O_NOCTTY)
importFlags(UV_FS_O_NOFOLLOW)
importFlags(UV_FS_O_NONBLOCK)
importFlags(UV_FS_O_SYMLINK)
importFlags(UV_FS_O_SYNC)
