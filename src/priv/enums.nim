import ./c

{.pragma: UV_ENUM, importc, header: C_HEADER.}

type
  # loop
  uv_loop_option* {.UV_ENUM.} = enum
    UV_LOOP_BLOCK_SIGNAL = 0
    UV_METRICS_IDLE_TIME
    UV_LOOP_USE_IO_URING_SQPOLL

  uv_run_mode* {.UV_ENUM.} = enum
    UV_RUN_DEFAULT = 0
    UV_RUN_ONCE
    UV_RUN_NOWAIT

  # misc
  uv_clock_id* {.UV_ENUM.} = enum
    UV_CLOCK_MONOTONIC
    UV_CLOCK_REALTIME

  # fs
  uv_fs_type* {.UV_ENUM.} = enum
    UV_FS_UNKNOWN = -1
    UV_FS_CUSTOM
    UV_FS_OPEN
    UV_FS_CLOSE
    UV_FS_READ
    UV_FS_WRITE
    UV_FS_SENDFILE
    UV_FS_STAT
    UV_FS_LSTAT
    UV_FS_FSTAT
    UV_FS_FTRUNCATE
    UV_FS_UTIME
    UV_FS_FUTIME
    UV_FS_ACCESS
    UV_FS_CHMOD
    UV_FS_FCHMOD
    UV_FS_FSYNC
    UV_FS_FDATASYNC
    UV_FS_UNLINK
    UV_FS_RMDIR
    UV_FS_MKDIR
    UV_FS_MKDTEMP
    UV_FS_RENAME
    UV_FS_SCANDIR
    UV_FS_LINK
    UV_FS_SYMLINK
    UV_FS_READLINK
    UV_FS_CHOWN
    UV_FS_FCHOWN
    UV_FS_REALPATH
    UV_FS_COPYFILE
    UV_FS_LCHOWN
    UV_FS_OPENDIR
    UV_FS_READDIR
    UV_FS_CLOSEDIR
    UV_FS_MKSTEMP
    UV_FS_LUTIME

  uv_dirent_type_t* {.UV_ENUM.} = enum
    UV_DIRENT_UNKNOWN
    UV_DIRENT_FILE
    UV_DIRENT_DIR
    UV_DIRENT_LINK
    UV_DIRENT_FIFO
    UV_DIRENT_SOCKET
    UV_DIRENT_CHAR
    UV_DIRENT_BLOCK

  # fs_event
  uv_fs_event* {.UV_ENUM.} = enum
    UV_RENAME = 1
    UV_CHANGE = 2

  uv_fs_event_flags* {.UV_ENUM.} = enum
    UV_FS_EVENT_WATCH_ENTRY = 1
    UV_FS_EVENT_STAT = 2
    UV_FS_EVENT_RECURSIVE = 4

  # handle
  uv_handle_type* {.UV_ENUM.} = enum
    UV_UNKNOWN_HANDLE = 0
    UV_ASYNC
    UV_CHECK
    UV_FS_EVENT
    UV_FS_POLL
    UV_HANDLE
    UV_IDLE
    UV_NAMED_PIPE
    UV_POLL
    UV_PREPARE
    UV_PROCESS
    UV_STREAM
    UV_TCP
    UV_TIMER
    UV_TTY
    UV_UDP
    UV_SIGNAL
    UV_FILE
    UV_HANDLE_TYPE_MAX

  # poll
  uv_poll_event* {.UV_ENUM.} = enum
    UV_READABLE = 1
    UV_WRITABLE = 2
    UV_DISCONNECT = 4
    UV_PRIORITIZED = 8

  # process
  uv_process_flags* {.UV_ENUM.} = enum
    UV_PROCESS_SETUID = (1 shl 0)
    UV_PROCESS_SETGID = (1 shl 1)
    UV_PROCESS_WINDOWS_VERBATIM_ARGUMENTS = (1 shl 2)
    UV_PROCESS_DETACHED = (1 shl 3)
    UV_PROCESS_WINDOWS_HIDE = (1 shl 4)
    UV_PROCESS_WINDOWS_HIDE_CONSOLE = (1 shl 5)
    UV_PROCESS_WINDOWS_HIDE_GUI = (1 shl 6)
    UV_PROCESS_WINDOWS_FILE_PATH_EXACT_NAME = (1 shl 7)

  uv_stdio_flags* {.UV_ENUM.} = enum
    UV_IGNORE = 0x00
    UV_CREATE_PIPE = 0x01
    UV_INHERIT_FD = 0x02
    UV_INHERIT_STREAM = 0x04
    UV_READABLE_PIPE = 0x10
    UV_WRITABLE_PIPE = 0x20
    UV_NONBLOCK_PIPE = 0x40

  # request
  uv_req_type* {.UV_ENUM.} = enum
    UV_UNKNOWN_REQ = 0
    UV_REQ
    UV_CONNECT
    UV_WRITE
    UV_SHUTDOWN
    UV_UDP_SEND
    UV_FS
    UV_WORK
    UV_GETADDRINFO
    UV_GETNAMEINFO
    UV_REQ_TYPE_MAX

  # tcp
  uv_tcp_flags* {.UV_ENUM.} = enum
    UV_TCP_IPV6ONLY = 1
    UV_TCP_REUSEPORT = 2

  # tty
  uv_tty_mode_t* {.UV_ENUM.} = enum
    UV_TTY_MODE_NORMAL
    UV_TTY_MODE_RAW
    UV_TTY_MODE_IO

  uv_tty_vtermstate_t* {.UV_ENUM.} = enum
    UV_TTY_SUPPORTED
    UV_TTY_UNSUPPORTED

  # udp
  uv_udp_flags* {.UV_ENUM.} = enum
    UV_UDP_IPV6ONLY = 1
    UV_UDP_PARTIAL = 2
    UV_UDP_REUSEADDR = 4
    UV_UDP_MMSG_CHUNK = 8
    UV_UDP_MMSG_FREE = 16
    UV_UDP_LINUX_RECVERR = 32
    UV_UDP_REUSEPORT = 64
    UV_UDP_RECVMMSG = 256

  uv_membership* {.UV_ENUM.} = enum
    UV_LEAVE_GROUP = 0
    UV_JOIN_GROUP
