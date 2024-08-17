import ./c
import ./enums
import ./types

import system/ansi_c
import std/nativesockets

{.pragma: UV_API, importc, header: C_HEADER, cdecl.}

# async
proc uv_async_init*(loop: ptr uv_loop_t, async: ptr uv_async_t, async_cb: uv_async_cb): cint {.UV_API.}
proc uv_async_send*(async: ptr uv_async_t): cint {.UV_API.}

# check
proc uv_check_init*(loop: ptr uv_loop_t, check: ptr uv_check_t): cint {.UV_API.}
proc uv_check_start*(check: ptr uv_check_t, cb: uv_check_cb): cint {.UV_API.}
proc uv_check_stop*(check: ptr uv_check_t): cint {.UV_API.}

# dll
proc uv_dlopen*(filename: cstring, lib: ptr uv_lib_t): cint {.UV_API.}
proc uv_dlclose*(lib: ptr uv_lib_t) {.UV_API.}
proc uv_dlsym*(lib: ptr uv_lib_t, name: cstring, `ptr`: ptr pointer): cint {.UV_API.}
proc uv_dlerror*(lib: ptr uv_lib_t): cstring {.UV_API.}

# dns
proc uv_getaddrinfo*(loop: ptr uv_loop_t, req: ptr uv_getaddrinfo_t, getaddrinfo_cb: uv_getaddrinfo_cb, node: cstring, service: cstring, hints: ptr AddrInfo): cint {.UV_API.}
proc uv_freeaddrinfo*(ai: ptr AddrInfo) {.UV_API.}
proc uv_getnameinfo*(loop: ptr uv_loop_t, req: ptr uv_getnameinfo_t, getnameinfo_cb: uv_getnameinfo_cb, `addr`: ptr SockAddr, flags: cint): cint {.UV_API.}

# errors
proc uv_strerror*(err: cint): cstring {.UV_API.}
proc uv_strerror_r*(err: cint, buf: pointer, buflen: csize_t): cstring {.UV_API.}
proc uv_err_name*(err: cint): cstring {.UV_API.}
proc uv_err_name_r*(err: cint, buf: pointer, buflen: csize_t): cstring {.UV_API.}
proc uv_translate_sys_error*(sys_errno: cint): cint {.UV_API.}

# fs_poll
proc uv_fs_poll_init*(loop: ptr uv_loop_t, handle: ptr uv_fs_poll_t): cint {.UV_API.}
proc uv_fs_poll_start*(handle: ptr uv_fs_poll_t, poll_cb: uv_fs_poll_cb, path: cstring, interval: cuint): cint {.UV_API.}
proc uv_fs_poll_stop*(handle: ptr uv_fs_poll_t): cint {.UV_API.}
proc uv_fs_poll_getpath*(handle: ptr uv_fs_poll_t, buffer: pointer, size: ptr csize_t): cint {.UV_API.}

# idle
proc uv_idle_init*(loop: ptr uv_loop_t, idle: ptr uv_idle_t): cint {.UV_API.}
proc uv_idle_start*(idle: ptr uv_idle_t, cb: uv_idle_cb): cint {.UV_API.}
proc uv_idle_stop*(idle: ptr uv_idle_t): cint {.UV_API.}

# loop
proc uv_loop_init*(loop: ptr uv_loop_t): cint {.UV_API.}
proc uv_loop_close*(loop: ptr uv_loop_t): cint {.UV_API.}
proc uv_default_loop*(): ptr uv_loop_t {.UV_API.}
proc uv_run*(loop: ptr uv_loop_t, mode: uv_run_mode): cint {.UV_API.}
proc uv_loop_alive*(loop: ptr uv_loop_t): cint {.UV_API.}
proc uv_stop*(loop: ptr uv_loop_t) {.UV_API.}
proc uv_loop_size*(): csize_t {.UV_API.}
proc uv_backend_fd*(loop: ptr uv_loop_t): cint {.UV_API.}
proc uv_backend_timeout*(loop: ptr uv_loop_t): cint {.UV_API.}
proc uv_now*(loop: ptr uv_loop_t): uint64 {.UV_API.}
proc uv_update_time*(loop: ptr uv_loop_t) {.UV_API.}
proc uv_walk*(loop: ptr uv_loop_t, walk_cb: uv_walk_cb, arg: pointer) {.UV_API.}
proc uv_loop_fork*(loop: ptr uv_loop_t): cint {.UV_API.}
proc uv_loop_get_data*(loop: ptr uv_loop_t): pointer {.UV_API.}
proc uv_loop_set_data*(loop: ptr uv_loop_t, data: pointer) {.UV_API.}

# metrics
proc uv_metrics_idle_time*(loop: ptr uv_loop_t): uint64 {.UV_API.}
proc uv_metrics_info*(loop: ptr uv_loop_t, metrics: ptr uv_metrics_t): cint {.UV_API.}

# misc
proc uv_guess_handle*(file: cint): uv_handle_type {.UV_API.}
proc uv_replace_allocator*(malloc_func: uv_malloc_func, realloc_func: uv_realloc_func, calloc_func: uv_calloc_func, free_func: uv_free_func): cint {.UV_API.}
proc uv_library_shutdown*() {.UV_API.}
proc uv_buf_init*(base: pointer, len: cuint): uv_buf_t {.UV_API.}
proc uv_setup_args*(argc: cint, argv: ptr cstring): ptr cstring {.UV_API.}
proc uv_get_process_title*(buffer: pointer, size: csize_t): cint {.UV_API.}
proc uv_set_process_title*(title: cstring): cint {.UV_API.}
proc uv_resident_set_memory*(rss: ptr csize_t): cint {.UV_API.}
proc uv_uptime*(uptime: ptr cdouble): cint {.UV_API.}
proc uv_getrusage*(rusage: ptr uv_rusage_t): cint {.UV_API.}
proc uv_os_getpid*(): cint {.UV_API.}
proc uv_os_getppid*(): cint {.UV_API.}
proc uv_available_parallelism*(): cuint {.UV_API.}
proc uv_cpu_info*(cpu_infos: ptr ptr uv_cpu_info_t, count: ptr cint): cint {.UV_API.}
proc uv_free_cpu_info*(cpu_infos: ptr uv_cpu_info_t, count: cint) {.UV_API.}
proc uv_cpumask_size*(): cint {.UV_API.}
proc uv_interface_addresses*(addresses: ptr ptr uv_interface_address_t, count: ptr cint): cint {.UV_API.}
proc uv_free_interface_addresses*(addresses: ptr uv_interface_address_t, count: cint) {.UV_API.}
proc uv_loadavg*(avg: array[3, cdouble]) {.UV_API.}
proc uv_ip4_addr*(ip: cstring, port: cint, `addr`: ptr Sockaddr_in): cint {.UV_API.}
proc uv_ip6_addr*(ip: cstring, port: cint, `addr`: ptr Sockaddr_in6): cint {.UV_API.}
proc uv_ip4_name*(src: ptr Sockaddr_in, dst: pointer, size: csize_t): cint {.UV_API.}
proc uv_ip6_name*(src: ptr Sockaddr_in6, dst: pointer, size: csize_t): cint {.UV_API.}
proc uv_ip_name*(src: ptr SockAddr, dst: pointer, size: csize_t): cint {.UV_API.}
proc uv_inet_ntop*(af: cint, src: pointer, dst: pointer, size: csize_t): cint {.UV_API.}
proc uv_inet_pton*(af: cint, src: cstring, dst: pointer): cint {.UV_API.}
proc uv_if_indextoname*(ifindex: cuint, buffer: pointer, size: ptr csize_t): cint {.UV_API.}
proc uv_if_indextoiid*(ifindex: cuint, buffer: pointer, size: ptr csize_t): cint {.UV_API.}
proc uv_exepath*(buffer: pointer, size: ptr csize_t): cint {.UV_API.}
proc uv_cwd*(buffer: pointer, size: ptr csize_t): cint {.UV_API.}
proc uv_chdir*(dir: cstring): cint {.UV_API.}
proc uv_os_homedir*(buffer: pointer, size: ptr csize_t): cint {.UV_API.}
proc uv_os_tmpdir*(buffer: pointer, size: ptr csize_t): cint {.UV_API.}
proc uv_os_get_passwd*(pwd: ptr uv_passwd_t): cint {.UV_API.}
proc uv_os_get_passwd2*(pwd: ptr uv_passwd_t, uid: uv_uid_t): cint {.UV_API.}
proc uv_os_get_group*(group: ptr uv_group_t, gid: uv_uid_t): cint {.UV_API.}
proc uv_os_free_group*(pwd: ptr uv_passwd_t) {.UV_API.}
proc uv_os_free_passwd*(pwd: ptr uv_passwd_t) {.UV_API.}
proc uv_get_free_memory*(): uint64 {.UV_API.}
proc uv_get_total_memory*(): uint64 {.UV_API.}
proc uv_get_constrained_memory*(): uint64 {.UV_API.}
proc uv_get_available_memory*(): uint64 {.UV_API.}
proc uv_hrtime*(): uint64 {.UV_API.}
proc uv_clock_gettime*(clock_id: uv_clock_id, ts: ptr uv_timespec64_t): cint {.UV_API.}
proc uv_print_all_handles*(loop: ptr uv_loop_t, stream: CFilePtr) {.UV_API.}
proc uv_print_active_handles*(loop: ptr uv_loop_t, stream: CFilePtr) {.UV_API.}
proc uv_os_environ*(envitems: ptr ptr uv_env_item_t, count: ptr cint): cint {.UV_API.}
proc uv_os_free_environ*(envitems: ptr uv_env_item_t, count: cint) {.UV_API.}
proc uv_os_getenv*(name: cstring, buffer: pointer, size: ptr csize_t): cint {.UV_API.}
proc uv_os_setenv*(name: cstring, value: cstring): cint {.UV_API.}
proc uv_os_unsetenv*(name: cstring): cint {.UV_API.}
proc uv_os_gethostname*(buffer: pointer, size: ptr csize_t): cint {.UV_API.}
proc uv_os_getpriority*(pid: cint, priority: ptr cint): cint {.UV_API.}
proc uv_os_setpriority*(pid: cint, priority: cint): cint {.UV_API.}
proc uv_os_uname*(buffer: ptr uv_utsname_t): cint {.UV_API.}
proc uv_gettimeofday*(tv: ptr uv_timeval64_t): cint {.UV_API.}
proc uv_random*(loop: ptr uv_loop_t, req: ptr uv_random_t, buf: pointer, buflen: csize_t, flags: cuint, cb: uv_random_cb): cint {.UV_API.}
proc uv_sleep*(msec: cuint) {.UV_API.}
proc uv_utf16_length_as_wtf8*(utf16: ptr uint16, utf16_len: csize_t): csize_t {.UV_API.}
proc uv_utf16_to_wtf8*(utf16: ptr uint16, utf16_len: csize_t, wtf8_ptr: ptr ptr char, wtf8_len_ptr: ptr csize_t): cint {.UV_API.}
proc uv_wtf8_length_as_utf16*(wtf8: ptr char): csize_t {.UV_API.}
proc uv_wtf8_to_utf16*(utf8: ptr char, utf16: ptr uint16, utf16_len: csize_t) {.UV_API.}

# pipe
proc uv_pipe_init*(loop: ptr uv_loop_t, handle: ptr uv_pipe_t, ipc: cint): cint {.UV_API.}
proc uv_pipe_open*(handle: ptr uv_pipe_t, file: cint): cint {.UV_API.}
proc uv_pipe_bind*(handle: ptr uv_pipe_t, name: cstring): cint {.UV_API.}
proc uv_pipe_bind2*(handle: ptr uv_pipe_t, name: cstring, namelen: csize_t, flags: cuint): cint {.UV_API.}
proc uv_pipe_connect*(req: ptr uv_connect_t, handle: ptr uv_pipe_t, name: cstring, cb: uv_connect_cb) {.UV_API.}
proc uv_pipe_connect2*(req: ptr uv_connect_t, handle: ptr uv_pipe_t, name: pointer, namelen: csize_t, flags: cuint, cb: uv_connect_cb) {.UV_API.}
proc uv_pipe_getsockname*(handle: ptr uv_pipe_t, buffer: pointer, size: ptr csize_t): cint {.UV_API.}
proc uv_pipe_getpeername*(handle: ptr uv_pipe_t, buffer: pointer, size: ptr csize_t): cint {.UV_API.}
proc uv_pipe_pending_instances*(handle: ptr uv_pipe_t, count: cint) {.UV_API.}
proc uv_pipe_pending_count*(handle: ptr uv_pipe_t): cint {.UV_API.}
proc uv_pipe_pending_type*(handle: ptr uv_pipe_t): uv_handle_type {.UV_API.}
proc uv_pipe_chmod*(handle: ptr uv_pipe_t, flags: cint): cint {.UV_API.}
proc uv_pipe*(fds: array[2, cint], read_flags: cint, write_flags: cint): cint {.UV_API.}

# prepare
proc uv_prepare_init*(loop: ptr uv_loop_t, prepare: ptr uv_prepare_t): cint {.UV_API.}
proc uv_prepare_start*(prepare: ptr uv_prepare_t, cb: uv_prepare_cb): cint {.UV_API.}
proc uv_prepare_stop*(prepare: ptr uv_prepare_t): cint {.UV_API.}

# signal
proc uv_signal_init*(loop: ptr uv_loop_t, signal: ptr uv_signal_t): cint {.UV_API.}
proc uv_signal_start*(signal: ptr uv_signal_t, cb: uv_signal_cb, signum: cint): cint {.UV_API.}
proc uv_signal_start_oneshot*(signal: ptr uv_signal_t, cb: uv_signal_cb, signum: cint): cint {.UV_API.}
proc uv_signal_stop*(signal: ptr uv_signal_t): cint {.UV_API.}

# stream
proc uv_shutdown*(req: ptr uv_shutdown_t, handle: ptr uv_stream_t, cb: uv_shutdown_cb): cint {.UV_API.}
proc uv_listen*(stream: ptr uv_stream_t, backlog: cint, cb: uv_connection_cb): cint {.UV_API.}
proc uv_accept*(server: ptr uv_stream_t, client: ptr uv_stream_t): cint {.UV_API.}
proc uv_read_start*(stream: ptr uv_stream_t, alloc_cb: uv_alloc_cb, read_cb: uv_read_cb): cint {.UV_API.}
proc uv_read_stop*(param: ptr uv_stream_t): cint {.UV_API.}
proc uv_write*(req: ptr uv_write_t, handle: ptr uv_stream_t, bufs: ptr uv_buf_t, nbufs: cuint, cb: uv_write_cb): cint {.UV_API.}
proc uv_write2*(req: ptr uv_write_t, handle: ptr uv_stream_t, bufs: ptr uv_buf_t, nbufs: cuint, send_handle: ptr uv_stream_t, cb: uv_write_cb): cint {.UV_API.}
proc uv_try_write*(handle: ptr uv_stream_t, bufs: ptr uv_buf_t, nbufs: cuint): cint {.UV_API.}
proc uv_try_write2*(handle: ptr uv_stream_t, bufs: ptr uv_buf_t, nbufs: cuint, send_handle: ptr uv_stream_t): cint {.UV_API.}
proc uv_is_readable*(handle: ptr uv_stream_t): cint {.UV_API.}
proc uv_is_writable*(handle: ptr uv_stream_t): cint {.UV_API.}
proc uv_stream_set_blocking*(handle: ptr uv_stream_t, blocking: cint): cint {.UV_API.}
proc uv_stream_get_write_queue_size*(stream: ptr uv_stream_t): csize_t {.UV_API.}

# threading
proc uv_thread_create*(tid: ptr uv_thread_t, entry: uv_thread_cb, arg: pointer): cint {.UV_API.}
proc uv_thread_create_ex*(tid: ptr uv_thread_t, params: ptr uv_thread_options_t, entry: uv_thread_cb, arg: pointer): cint {.UV_API.}
proc uv_thread_setaffinity*(tid: ptr uv_thread_t, cpumask: pointer, oldmask: pointer, mask_size: csize_t): cint {.UV_API.}
proc uv_thread_getaffinity*(tid: ptr uv_thread_t, cpumask: pointer, mask_size: csize_t): cint {.UV_API.}
proc uv_thread_getcpu*(): cint {.UV_API.}
proc uv_thread_self*(): uv_thread_t {.UV_API.}
proc uv_thread_join*(tid: ptr uv_thread_t): cint {.UV_API.}
proc uv_thread_equal*(t1: ptr uv_thread_t, t2: ptr uv_thread_t): cint {.UV_API.}
proc uv_thread_setpriority*(tid: uv_thread_t, priority: cint): cint {.UV_API.}
proc uv_thread_getpriority*(tid: uv_thread_t, priority: ptr cint): cint {.UV_API.}
proc uv_key_create*(key: ptr uv_key_t): cint {.UV_API.}
proc uv_key_delete*(key: ptr uv_key_t) {.UV_API.}
proc uv_key_get*(key: ptr uv_key_t): pointer {.UV_API.}
proc uv_key_set*(key: ptr uv_key_t, value: pointer) {.UV_API.}
proc uv_once*(guard: ptr uv_once_t, callback: proc() {.cdecl.}) {.UV_API.}
proc uv_mutex_init*(handle: ptr uv_mutex_t): cint {.UV_API.}
proc uv_mutex_init_recursive*(handle: ptr uv_mutex_t): cint {.UV_API.}
proc uv_mutex_destroy*(handle: ptr uv_mutex_t) {.UV_API.}
proc uv_mutex_lock*(handle: ptr uv_mutex_t) {.UV_API.}
proc uv_mutex_trylock*(handle: ptr uv_mutex_t): cint {.UV_API.}
proc uv_mutex_unlock*(handle: ptr uv_mutex_t) {.UV_API.}
proc uv_rwlock_init*(rwlock: ptr uv_rwlock_t): cint {.UV_API.}
proc uv_rwlock_destroy*(rwlock: ptr uv_rwlock_t) {.UV_API.}
proc uv_rwlock_rdlock*(rwlock: ptr uv_rwlock_t) {.UV_API.}
proc uv_rwlock_tryrdlock*(rwlock: ptr uv_rwlock_t): cint {.UV_API.}
proc uv_rwlock_rdunlock*(rwlock: ptr uv_rwlock_t) {.UV_API.}
proc uv_rwlock_wrlock*(rwlock: ptr uv_rwlock_t) {.UV_API.}
proc uv_rwlock_trywrlock*(rwlock: ptr uv_rwlock_t): cint {.UV_API.}
proc uv_rwlock_wrunlock*(rwlock: ptr uv_rwlock_t) {.UV_API.}
proc uv_sem_init*(sem: ptr uv_sem_t, value: cuint): cint {.UV_API.}
proc uv_sem_destroy*(sem: ptr uv_sem_t) {.UV_API.}
proc uv_sem_post*(sem: ptr uv_sem_t) {.UV_API.}
proc uv_sem_wait*(sem: ptr uv_sem_t) {.UV_API.}
proc uv_sem_trywait*(sem: ptr uv_sem_t): cint {.UV_API.}
proc uv_cond_init*(cond: ptr uv_cond_t): cint {.UV_API.}
proc uv_cond_destroy*(cond: ptr uv_cond_t) {.UV_API.}
proc uv_cond_signal*(cond: ptr uv_cond_t) {.UV_API.}
proc uv_cond_broadcast*(cond: ptr uv_cond_t) {.UV_API.}
proc uv_cond_wait*(cond: ptr uv_cond_t, mutex: ptr uv_mutex_t) {.UV_API.}
proc uv_cond_timedwait*(cond: ptr uv_cond_t, mutex: ptr uv_mutex_t, timeout: uint64): cint {.UV_API.}
proc uv_barrier_init*(barrier: ptr uv_barrier_t, count: cuint): cint {.UV_API.}
proc uv_barrier_destroy*(barrier: ptr uv_barrier_t) {.UV_API.}
proc uv_barrier_wait*(barrier: ptr uv_barrier_t): cint {.UV_API.}

# threadpool
proc uv_queue_work*(loop: ptr uv_loop_t, req: ptr uv_work_t, work_cb: uv_work_cb, after_work_cb: uv_after_work_cb): cint {.UV_API.}

# timer
proc uv_timer_init*(loop: ptr uv_loop_t, handle: ptr uv_timer_t): cint {.UV_API.}
proc uv_timer_start*(handle: ptr uv_timer_t, cb: uv_timer_cb, timeout: uint64, repeat: uint64): cint {.UV_API.}
proc uv_timer_stop*(handle: ptr uv_timer_t): cint {.UV_API.}
proc uv_timer_again*(handle: ptr uv_timer_t): cint {.UV_API.}
proc uv_timer_set_repeat*(handle: ptr uv_timer_t, repeat: uint64) {.UV_API.}
proc uv_timer_get_repeat*(handle: ptr uv_timer_t): uint64 {.UV_API.}
proc uv_timer_get_due_in*(handle: ptr uv_timer_t): uint64 {.UV_API.}

# version
proc uv_version*(): cuint {.UV_API.}
proc uv_version_string*(): cstring {.UV_API.}

# fs
proc uv_fs_req_cleanup*(req: ptr uv_fs_t) {.UV_API.}
proc uv_fs_close*(loop: ptr uv_loop_t, req: ptr uv_fs_t, file: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_open*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, flags: cint, mode: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_read*(loop: ptr uv_loop_t, req: ptr uv_fs_t, file: cint, bufs: ptr uv_buf_t, nbufs: cuint, offset: int64, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_unlink*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_write*(loop: ptr uv_loop_t, req: ptr uv_fs_t, file: cint, bufs: ptr uv_buf_t, nbufs: cuint, offset: int64, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_mkdir*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, mode: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_mkdtemp*(loop: ptr uv_loop_t, req: ptr uv_fs_t, tpl: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_mkstemp*(loop: ptr uv_loop_t, req: ptr uv_fs_t, tpl: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_rmdir*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_opendir*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_closedir*(loop: ptr uv_loop_t, req: ptr uv_fs_t, dir: ptr uv_dir_t, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_readdir*(loop: ptr uv_loop_t, req: ptr uv_fs_t, dir: ptr uv_dir_t, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_scandir*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, flags: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_scandir_next*(req: ptr uv_fs_t, ent: ptr uv_dirent_t): cint {.UV_API.}
proc uv_fs_stat*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_fstat*(loop: ptr uv_loop_t, req: ptr uv_fs_t, file: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_lstat*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_statfs*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_rename*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, new_path: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_fsync*(loop: ptr uv_loop_t, req: ptr uv_fs_t, file: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_fdatasync*(loop: ptr uv_loop_t, req: ptr uv_fs_t, file: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_ftruncate*(loop: ptr uv_loop_t, req: ptr uv_fs_t, file: cint, offset: int64, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_copyfile*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, new_path: cstring, flags: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_sendfile*(loop: ptr uv_loop_t, req: ptr uv_fs_t, out_fd: cint, in_fd: cint, in_offset: int64, length: csize_t, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_access*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, mode: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_chmod*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, mode: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_fchmod*(loop: ptr uv_loop_t, req: ptr uv_fs_t, file: cint, mode: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_utime*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, atime: cdouble, mtime: cdouble, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_futime*(loop: ptr uv_loop_t, req: ptr uv_fs_t, file: cint, atime: cdouble, mtime: cdouble, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_lutime*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, atime: cdouble, mtime: cdouble, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_link*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, new_path: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_symlink*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, new_path: cstring, flags: cint, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_readlink*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_realpath*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_chown*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, uid: uv_uid_t, gid: uv_gid_t, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_fchown*(loop: ptr uv_loop_t, req: ptr uv_fs_t, file: cint, uid: uv_uid_t, gid: uv_gid_t, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_lchown*(loop: ptr uv_loop_t, req: ptr uv_fs_t, path: cstring, uid: uv_uid_t, gid: uv_gid_t, cb: uv_fs_cb): cint {.UV_API.}
proc uv_fs_get_type*(req: ptr uv_fs_t): uv_fs_type {.UV_API.}
proc uv_fs_get_result*(req: ptr uv_fs_t): csize_t {.UV_API.}
proc uv_fs_get_system_error*(req: ptr uv_fs_t): cint {.UV_API.}
proc uv_fs_get_ptr*(req: ptr uv_fs_t): pointer {.UV_API.}
proc uv_fs_get_path*(req: ptr uv_fs_t): cstring {.UV_API.}
proc uv_fs_get_statbuf*(req: ptr uv_fs_t): ptr uv_stat_t {.UV_API.}
proc uv_get_osfhandle*(fd: cint): cint {.UV_API.}
proc uv_open_osfhandle*(os_fd: cint): cint {.UV_API.}

# fs_event
proc uv_fs_event_init*(loop: ptr uv_loop_t, handle: ptr uv_fs_event_t): cint {.UV_API.}
proc uv_fs_event_start*(handle: ptr uv_fs_event_t, cb: uv_fs_event_cb, path: cstring, flags: cuint): cint {.UV_API.}
proc uv_fs_event_stop*(handle: ptr uv_fs_event_t): cint {.UV_API.}
proc uv_fs_event_getpath*(handle: ptr uv_fs_event_t, buffer: pointer, size: ptr csize_t): cint {.UV_API.}

# handle
proc uv_is_active*(handle: ptr uv_handle_t): cint {.UV_API.}
proc uv_is_closing*(handle: ptr uv_handle_t): cint {.UV_API.}
proc uv_close*(handle: ptr uv_handle_t, close_cb: uv_close_cb) {.UV_API.}
proc uv_ref*(handle: ptr uv_handle_t) {.UV_API.}
proc uv_unref*(handle: ptr uv_handle_t) {.UV_API.}
proc uv_has_ref*(handle: ptr uv_handle_t): cint {.UV_API.}
proc uv_handle_size*(tp: uv_handle_type): csize_t {.UV_API.}
proc uv_send_buffer_size*(handle: ptr uv_handle_t, value: ptr cint): cint {.UV_API.}
proc uv_recv_buffer_size*(handle: ptr uv_handle_t, value: ptr cint): cint {.UV_API.}
proc uv_fileno*(handle: ptr uv_handle_t, fd: ptr cint): cint {.UV_API.}
proc uv_handle_get_loop*(handle: ptr uv_handle_t): ptr uv_loop_t {.UV_API.}
proc uv_handle_get_data*(handle: ptr uv_handle_t): pointer {.UV_API.}
proc uv_handle_set_data*(handle: ptr uv_handle_t, data: pointer) {.UV_API.}
proc uv_handle_get_type*(handle: ptr uv_handle_t): uv_handle_type {.UV_API.}
proc uv_handle_type_name*(tp: uv_handle_type): cstring {.UV_API.}

# poll
proc uv_poll_init*(loop: ptr uv_loop_t, handle: ptr uv_poll_t, fd: cint): cint {.UV_API.}
proc uv_poll_init_socket*(loop: ptr uv_loop_t, handle: ptr uv_poll_t, socket: cint): cint {.UV_API.}
proc uv_poll_start*(handle: ptr uv_poll_t, events: cint, cb: uv_poll_cb): cint {.UV_API.}
proc uv_poll_stop*(poll: ptr uv_poll_t): cint {.UV_API.}

# process
proc uv_disable_stdio_inheritance*() {.UV_API.}
proc uv_spawn*(loop: ptr uv_loop_t, handle: ptr uv_process_t, options: ptr uv_process_options_t): cint {.UV_API.}
proc uv_process_kill*(handle: ptr uv_process_t, signum: cint): cint {.UV_API.}
proc uv_kill*(pid: cint, signum: cint): cint {.UV_API.}
proc uv_process_get_pid*(handle: ptr uv_process_t): cint {.UV_API.}

# request
proc uv_cancel*(req: ptr uv_req_t): cint {.UV_API.}
proc uv_req_size*(tp: uv_req_type): csize_t {.UV_API.}
proc uv_req_get_data*(req: ptr uv_req_t): pointer {.UV_API.}
proc uv_req_set_data*(req: ptr uv_req_t, data: pointer) {.UV_API.}
proc uv_req_get_type*(req: ptr uv_req_t): uv_req_type {.UV_API.}
proc uv_req_type_name*(tp: uv_req_type): cstring {.UV_API.}

# tcp
proc uv_tcp_init*(loop: ptr uv_loop_t, handle: ptr uv_tcp_t): cint {.UV_API.}
proc uv_tcp_init_ex*(loop: ptr uv_loop_t, handle: ptr uv_tcp_t, flags: cuint): cint {.UV_API.}
proc uv_tcp_open*(handle: ptr uv_tcp_t, sock: cint): cint {.UV_API.}
proc uv_tcp_nodelay*(handle: ptr uv_tcp_t, enable: cint): cint {.UV_API.}
proc uv_tcp_keepalive*(handle: ptr uv_tcp_t, enable: cint, delay: cuint): cint {.UV_API.}
proc uv_tcp_simultaneous_accepts*(handle: ptr uv_tcp_t, enable: cint): cint {.UV_API.}
proc uv_tcp_bind*(handle: ptr uv_tcp_t, `addr`: ptr SockAddr, flags: cuint): cint {.UV_API.}
proc uv_tcp_getsockname*(handle: ptr uv_tcp_t, name: ptr SockAddr, namelen: ptr cint): cint {.UV_API.}
proc uv_tcp_getpeername*(handle: ptr uv_tcp_t, name: ptr SockAddr, namelen: ptr cint): cint {.UV_API.}
proc uv_tcp_connect*(req: ptr uv_connect_t, handle: ptr uv_tcp_t, `addr`: ptr SockAddr, cb: uv_connect_cb): cint {.UV_API.}
proc uv_tcp_close_reset*(handle: ptr uv_tcp_t, close_cb: uv_close_cb): cint {.UV_API.}
proc uv_socketpair*(tp: cint, protocol: cint, socket_vector: array[2, cint], flags0: cint, flags1: cint): cint {.UV_API.}

# tty
proc uv_tty_init*(loop: ptr uv_loop_t, handle: ptr uv_tty_t, fd: cint, unused: cint): cint {.UV_API.}
proc uv_tty_set_mode*(handle: ptr uv_tty_t, mode: uv_tty_mode_t): cint {.UV_API.}
proc uv_tty_reset_mode*(): cint {.UV_API.}
proc uv_tty_get_winsize*(handle: ptr uv_tty_t, width: ptr cint, height: ptr cint): cint {.UV_API.}
proc uv_tty_set_vterm_state*(state: uv_tty_vtermstate_t) {.UV_API.}
proc uv_tty_get_vterm_state*(state: ptr uv_tty_vtermstate_t): cint {.UV_API.}

# udp
proc uv_udp_init*(loop: ptr uv_loop_t, handle: ptr uv_udp_t): cint {.UV_API.}
proc uv_udp_init_ex*(loop: ptr uv_loop_t, handle: ptr uv_udp_t, flags: cuint): cint {.UV_API.}
proc uv_udp_open*(handle: ptr uv_udp_t, sock: cint): cint {.UV_API.}
proc uv_udp_bind*(handle: ptr uv_udp_t, `addr`: ptr SockAddr, flags: cuint): cint {.UV_API.}
proc uv_udp_connect*(handle: ptr uv_udp_t, `addr`: ptr SockAddr): cint {.UV_API.}
proc uv_udp_getpeername*(handle: ptr uv_udp_t, name: ptr SockAddr, namelen: ptr cint): cint {.UV_API.}
proc uv_udp_getsockname*(handle: ptr uv_udp_t, name: ptr SockAddr, namelen: ptr cint): cint {.UV_API.}
proc uv_udp_set_membership*(handle: ptr uv_udp_t, multicast_addr: cstring, interface_addr: cstring, membership: uv_membership): cint {.UV_API.}
proc uv_udp_set_source_membership*(handle: ptr uv_udp_t, multicast_addr: cstring, interface_addr: cstring, source_addr: cstring, membership: uv_membership): cint {.UV_API.}
proc uv_udp_set_multicast_loop*(handle: ptr uv_udp_t, on: cint): cint {.UV_API.}
proc uv_udp_set_multicast_ttl*(handle: ptr uv_udp_t, ttl: cint): cint {.UV_API.}
proc uv_udp_set_multicast_interface*(handle: ptr uv_udp_t, interface_addr: cstring): cint {.UV_API.}
proc uv_udp_set_broadcast*(handle: ptr uv_udp_t, on: cint): cint {.UV_API.}
proc uv_udp_set_ttl*(handle: ptr uv_udp_t, ttl: cint): cint {.UV_API.}
proc uv_udp_send*(req: ptr uv_udp_send_t, handle: ptr uv_udp_t, bufs: ptr uv_buf_t, nbufs: cuint, `addr`: ptr SockAddr, send_cb: uv_udp_send_cb): cint {.UV_API.}
proc uv_udp_try_send*(handle: ptr uv_udp_t, bufs: ptr uv_buf_t, nbufs: cuint, `addr`: ptr SockAddr): cint {.UV_API.}
proc uv_udp_recv_start*(handle: ptr uv_udp_t, alloc_cb: uv_alloc_cb, recv_cb: uv_udp_recv_cb): cint {.UV_API.}
proc uv_udp_using_recvmmsg*(handle: ptr uv_udp_t): cint {.UV_API.}
proc uv_udp_recv_stop*(handle: ptr uv_udp_t): cint {.UV_API.}
proc uv_udp_get_send_queue_size*(handle: ptr uv_udp_t): csize_t {.UV_API.}
proc uv_udp_get_send_queue_count*(handle: ptr uv_udp_t): csize_t {.UV_API.}
