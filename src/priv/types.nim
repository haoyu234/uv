import ./c
import std/nativesockets

{.pragma: UV_OBJ, importc, header: C_HEADER.}
{.pragma: UV_CALLBACK, importc, header: C_HEADER.}

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
  uv_buf_t* {.UV_OBJ.} = object
  uv_malloc_func* {.UV_CALLBACK.} = proc(size: csize_t) {.cdecl.}
  uv_realloc_func* {.UV_CALLBACK.} = proc(`ptr`: pointer, size: csize_t) {.cdecl.}
  uv_calloc_func* {.UV_CALLBACK.} = proc(count: csize_t, size: csize_t) {.cdecl.}
  uv_free_func* {.UV_CALLBACK.} = proc(`ptr`: pointer) {.cdecl.}
  uv_random_cb* {.UV_CALLBACK.} = proc(req: ptr uv_random_t, status: cint, buf: pointer, buflen: csize_t) {.cdecl.}
  uv_os_sock_t* {.UV_OBJ.} = object
  uv_os_fd_t* {.UV_OBJ.} = object
  uv_pid_t* {.UV_OBJ.} = object
  uv_timeval_t* {.UV_OBJ.} = object
  uv_timeval64_t* {.UV_OBJ.} = object
  uv_timespec64_t* {.UV_OBJ.} = object
  uv_rusage_t* {.UV_OBJ.} = object
  uv_cpu_info_t* {.UV_OBJ.} = object
  uv_interface_address_t* {.UV_OBJ.} = object
  uv_passwd_t* {.UV_OBJ.} = object
  uv_group_t* {.UV_OBJ.} = object
  uv_utsname_t* {.UV_OBJ.} = object
  uv_env_item_t* {.UV_OBJ.} = object
  uv_random_t* {.UV_OBJ.} = object
  uv_uid_t* {.UV_OBJ.} = object
  uv_gid_t* {.UV_OBJ.} = object

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
  uv_fs_t* {.UV_OBJ.} = object
  uv_timespec_t* {.UV_OBJ.} = object
  uv_stat_t* {.UV_OBJ.} = object
  uv_statfs_t* {.UV_OBJ.} = object
  uv_dirent_t* {.UV_OBJ.} = object
  uv_dir_t* {.UV_OBJ.} = object
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
  uv_exit_cb* {.UV_CALLBACK.} = proc(param: ptr uv_process_t, exit_status: int64, term_signal: cint) {.cdecl.}
  uv_stdio_container_t* {.UV_OBJ.} = object

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
