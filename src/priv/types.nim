import ./c
import ./enums
import std/nativesockets

when defined(windows):
  import winlean
elif defined(linux):
  import posix

{.pragma: UV_OBJ, importc, header: C_HEADER.}
{.pragma: UV_CALLBACK, importc, header: C_HEADER.}

when defined(windows):
  type
    uv_os_sock_t* {.UV_OBJ.} = SocketHandle
    uv_os_fd_t* {.UV_OBJ.} = winlean.Handle
    uv_pid_t* {.UV_OBJ.} = cint
    uv_uid_t* {.UV_OBJ.} = cuchar
    uv_gid_t* {.UV_OBJ.} = cuchar

    uv_buf_t* {.UV_OBJ.} = object
      base*: pointer
      len*: ULONG
else:
  type
    uv_os_sock_t* {.UV_OBJ.} = SocketHandle
    uv_os_fd_t* {.UV_OBJ.} = cint
    uv_pid_t* {.UV_OBJ.} = Pid
    uv_uid_t* {.UV_OBJ.} = Uid
    uv_gid_t* {.UV_OBJ.} = Gid

    uv_buf_t* {.UV_OBJ.} = object
      len*: csize_t
      base*: pointer

type
  # async
  uv_async_t* {.UV_OBJ.} = object
  uv_async_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_async_t) {.cdecl.}

  # check
  uv_check_t* {.UV_OBJ.} = object
  uv_check_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_check_t) {.cdecl.}

  # dll
  uv_lib_t* {.UV_OBJ.} = object

  # dns
  uv_getaddrinfo_t* {.UV_OBJ.} = object
  uv_getaddrinfo_cb* {.UV_CALLBACK.} = proc(req: ptr uv_getaddrinfo_t, status: cint, res: ptr AddrInfo) {.cdecl.}
  uv_getnameinfo_t* {.UV_OBJ.} = object
  uv_getnameinfo_cb* {.UV_CALLBACK.} = proc(req: ptr uv_getnameinfo_t, status: cint, hostname: cstring, service: cstring) {.cdecl.}

  # fs_poll
  uv_fs_poll_t* {.UV_OBJ.} = object
  uv_fs_poll_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_fs_poll_t, status: cint, prev: ptr uv_stat_t, curr: ptr uv_stat_t) {.cdecl.}

  # idle
  uv_idle_t* {.UV_OBJ.} = object
  uv_idle_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_idle_t) {.cdecl.}

  # loop
  uv_loop_t* {.UV_OBJ.} = object
  uv_walk_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_handle_t, arg: pointer) {.cdecl.}

  # metrics
  uv_metrics_t* {.UV_OBJ.} = object

  # misc
  uv_malloc_func* {.UV_CALLBACK.} = proc(size: csize_t) {.cdecl.}
  uv_realloc_func* {.UV_CALLBACK.} = proc(`ptr`: pointer, size: csize_t) {.cdecl.}
  uv_calloc_func* {.UV_CALLBACK.} = proc(count: csize_t, size: csize_t) {.cdecl.}
  uv_free_func* {.UV_CALLBACK.} = proc(`ptr`: pointer) {.cdecl.}
  uv_random_cb* {.UV_CALLBACK.} = proc(req: ptr uv_random_t, status: cint, buf: pointer, buflen: csize_t) {.cdecl.}

  uv_timeval_t* {.UV_OBJ.} = object
    tv_sec*: clong
    tv_usec*: clong
  uv_timeval64_t* {.UV_OBJ.} = object
    tv_sec*: int64
    tv_usec*: int32

  uv_timespec_t* {.UV_OBJ.} = object
    tv_sec*: clong
    tv_nsec*: clong
  uv_timespec64_t* {.UV_OBJ.} = object
    tv_sec*: int64
    tv_nsec*: int32

  uv_rusage_t* {.UV_OBJ.} = object
   ru_utime*: uv_timeval_t  # user CPU time used
   ru_stime*: uv_timeval_t  # system CPU time used
   ru_maxrss*: uint64       # maximum resident set size
   ru_ixrss*: uint64        # integral shared memory size
   ru_idrss*: uint64        # integral unshared data size
   ru_isrss*: uint64        # integral unshared stack size
   ru_minflt*: uint64       # page reclaims (soft page faults)
   ru_majflt*: uint64       # page faults (hard page faults)
   ru_nswap*: uint64        # swaps
   ru_inblock*: uint64      # block input operations
   ru_oublock*: uint64      # block output operations
   ru_msgsnd*: uint64       # IPC messages sent
   ru_msgrcv*: uint64       # IPC messages received
   ru_nsignals*: uint64     # signals received
   ru_nvcsw*: uint64        # voluntary context switches
   ru_nivcsw*: uint64       # involuntary context switches

  uv_cpu_times_s {.importc: "struct uv_cpu_times_s", header: C_HEADER.} = object
    user*: uint64 # milliseconds
    nice*: uint64 # milliseconds
    sys*: uint64  # milliseconds
    idle*: uint64 # milliseconds
    irq*: uint64  # milliseconds

  uv_cpu_info_t* {.UV_OBJ.} = object
    model*: cstring
    speed*: cint
    cpu_times*: uv_cpu_times_s

  uv_interface_address_t* {.UV_OBJ.} = object
    name*: cstring
    phys_addr*: array[6, char]
    is_internal*: cint
    address4*: Sockaddr_in
    address6*: Sockaddr_in6
    netmask4*: Sockaddr_in
    netmask6*: Sockaddr_in6

  uv_passwd_t* {.UV_OBJ.} = object
    username*: cstring
    uid*: culong
    gid*: culong
    shell*: cstring
    homedir*: cstring

  uv_group_t* {.UV_OBJ.} = object
    groupname*: cstring
    gid*: culong
    members*: ptr cstring

  uv_utsname_t* {.UV_OBJ.} = object
    sysname*: array[256, char]
    release*: array[256, char]
    version*: array[256, char]
    machine*: array[256, char]

  uv_env_item_t* {.UV_OBJ.} = object
    name*: cstring
    value*: cstring

  uv_random_t* {.UV_OBJ.} = object

  # pipe
  uv_pipe_t* {.UV_OBJ.} = object

  # prepare
  uv_prepare_t* {.UV_OBJ.} = object
  uv_prepare_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_prepare_t) {.cdecl.}

  # signal
  uv_signal_t* {.UV_OBJ.} = object
  uv_signal_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_signal_t, signum: cint) {.cdecl.}

  # stream
  uv_stream_t* {.UV_OBJ.} = object
  uv_connect_t* {.UV_OBJ.} = object
  uv_shutdown_t* {.UV_OBJ.} = object
  uv_write_t* {.UV_OBJ.} = object
  uv_read_cb* {.UV_CALLBACK.} = proc(stream: ptr uv_stream_t, nread: csize_t, buf: ptr uv_buf_t) {.cdecl.}
  uv_write_cb* {.UV_CALLBACK.} = proc(req: ptr uv_write_t, status: cint) {.cdecl.}
  uv_connect_cb* {.UV_CALLBACK.} = proc(req: ptr uv_connect_t, status: cint) {.cdecl.}
  uv_shutdown_cb* {.UV_CALLBACK.} = proc(req: ptr uv_shutdown_t, status: cint) {.cdecl.}
  uv_connection_cb* {.UV_CALLBACK.} = proc(server: ptr uv_stream_t, status: cint) {.cdecl.}

  # threading
  uv_thread_t* {.UV_OBJ.} = object
  uv_thread_cb* {.UV_CALLBACK.} = proc(arg: pointer) {.cdecl.}
  uv_key_t* {.UV_OBJ.} = object
  uv_once_t* {.UV_OBJ.} = object
  uv_mutex_t* {.UV_OBJ.} = object
  uv_rwlock_t* {.UV_OBJ.} = object
  uv_sem_t* {.UV_OBJ.} = object
  uv_cond_t* {.UV_OBJ.} = object
  uv_barrier_t* {.UV_OBJ.} = object
  uv_thread_options_t* {.UV_OBJ.} = object

  # threadpool
  uv_work_t* {.UV_OBJ.} = object
  uv_work_cb* {.UV_CALLBACK.} = proc(req: ptr uv_work_t) {.cdecl.}
  uv_after_work_cb* {.UV_CALLBACK.} = proc(req: ptr uv_work_t, status: cint) {.cdecl.}

  # timer
  uv_timer_t* {.UV_OBJ.} = object
  uv_timer_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_timer_t) {.cdecl.}

  # fs
  uv_file* {.UV_OBJ.} = distinct cint
  uv_fs_t* {.UV_OBJ.} = object
  uv_stat_t* {.UV_OBJ.} = object
    st_dev*: uint64
    st_mode*: uint64
    st_nlink*: uint64
    st_uid*: uint64
    st_gid*: uint64
    st_rdev*: uint64
    st_ino*: uint64
    st_size*: uint64
    st_blksize*: uint64
    st_blocks*: uint64
    st_flags*: uint64
    st_gen*: uint64
    st_atim*: uv_timespec_t
    st_mtim*: uv_timespec_t
    st_ctim*: uv_timespec_t
    st_birthtim*: uv_timespec_t

  uv_statfs_t* {.UV_OBJ.} = object
    f_type*: uint64
    f_bsize*: uint64
    f_blocks*: uint64
    f_bfree*: uint64
    f_bavail*: uint64
    f_files*: uint64
    f_ffree*: uint64
    f_spare*: array[4, uint64]

  uv_dirent_t* {.UV_OBJ.} = object
    name*: cstring
    `type`*: uv_dirent_type_t

  uv_dir_t* {.UV_OBJ.} = object
    dirents*: ptr uv_dirent_t
    nentries*: csize_t

  uv_fs_cb* {.UV_CALLBACK.} = proc(req: ptr uv_fs_t) {.cdecl.}

  # fs_event
  uv_fs_event_t* {.UV_OBJ.} = object
  uv_fs_event_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_fs_event_t, filename: cstring, events: cint, status: cint) {.cdecl.}

  # handle
  uv_handle_t* {.UV_OBJ.} = object
  uv_alloc_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_handle_t, suggested_size: csize_t, buf: ptr uv_buf_t) {.cdecl.}
  uv_close_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_handle_t) {.cdecl.}

  # poll
  uv_poll_t* {.UV_OBJ.} = object
  uv_poll_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_poll_t, status: cint, events: cint) {.cdecl.}

  # process
  uv_process_t* {.UV_OBJ.} = object
  uv_process_options_t* {.UV_OBJ.} = object
    exit_cb*: uv_exit_cb
    file*: cstring
    args*: ptr cstring
    env*: ptr cstring
    cwd*: cstring
    flags*: cuint
    stdio_count*: cint
    stdio*: ptr uv_stdio_container_t
    uid*: uv_uid_t
    gid*: uv_gid_t

  uv_exit_cb* {.UV_CALLBACK.} = proc(param: ptr uv_process_t, exit_status: int64, term_signal: cint) {.cdecl.}

  uv_stdio_container_t* {.UV_OBJ.} = object
    flags*: uv_stdio_flags
    data*: uv_stdio_container_t_data

  uv_stdio_container_t_data {.UV_OBJ, union.} = object
      stream*: ptr uv_stream_t
      fd*: cint

  # request
  uv_req_t* {.UV_OBJ.} = object

  # tcp
  uv_tcp_t* {.UV_OBJ.} = object

  # tty
  uv_tty_t* {.UV_OBJ.} = object

  # udp
  uv_udp_t* {.UV_OBJ.} = object
  uv_udp_send_t* {.UV_OBJ.} = object
  uv_udp_send_cb* {.UV_CALLBACK.} = proc(req: ptr uv_udp_send_t, status: cint) {.cdecl.}
  uv_udp_recv_cb* {.UV_CALLBACK.} = proc(handle: ptr uv_udp_t, nread: csize_t, buf: ptr uv_buf_t, `addr`: ptr SockAddr, flags: cuint) {.cdecl.}
