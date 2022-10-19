# Load DSL and Setup Up Stages
require 'capistrano/setup'
require "capistrano/deploy"
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
require 'capistrano/rails'
require 'capistrano/rails/db'
require 'capistrano/bundler'
require 'capistrano/rvm'
require 'capistrano/rake'
require 'capistrano/puma'
require 'capistrano/delayed_job'
install_plugin Capistrano::Puma, load_hooks: false  # Default puma tasks
install_plugin Capistrano::Puma::Workers  # if you want to control the workers (in cluster mode)
install_plugin Capistrano::Puma::Jungle # if you need the jungle tasks
install_plugin Capistrano::Puma::Monit, load_hooks: false  # if you need the monit tasks
install_plugin Capistrano::Puma::Nginx  # if you want to upload a nginx site template
install_plugin Capistrano::Puma::Systemd  # if you use SystemD


# require 'capistrano/dotenv'

# require 'capistrano/sidekiq'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
