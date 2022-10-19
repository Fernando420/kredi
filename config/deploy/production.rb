# Change these
server '54.89.246.155', port: 22, roles: [:web, :app, :db], primary: true

set :repo_url,        'git@github.com:Fernando420/kredi.git'
set :application,     'kredi'
set :user,            'ubuntu'
set :puma_threads,    [4, 16]
set :puma_workers,    0

set :env, fetch(:env, 'production')
set :rails_env, :production
set :branch, "master"
set :puma_enable_socket_service, true
# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
# ‎⁨Macintosh HD⁩ ▸ ⁨Usuarios⁩ ▸ ⁨torvik⁩ ▸ ⁨Documents⁩ ▸ ⁨Credenciales⁩ ▸ ⁨UULALA-NEW⁩
set :ssh_options,     {forward_agent: true, user: fetch(:user), keys: %w(/home/fernando/Documents/Credenciales/Mia/file.pem)}
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord
# set :linked_files,  fetch(:linked_files,  []).push('.env.production')
set :linked_files, fetch(:linked_files, []).push("config/master.key")
# set :linked_dirs,   fetch(:linked_dirs,   []).push('log','public/system')
set :keep_releases, 1
