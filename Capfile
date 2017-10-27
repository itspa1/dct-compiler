# frozen_string_literal: true
# Load DSL and set up stages
require 'capistrano/setup'

# Include default deployment tasks
require 'capistrano/deploy'

# Include tasks from other gems included in your Gemfile

require 'capistrano/rbenv'
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.4.0'

require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/puma'
install_plugin Capistrano::Puma
#require 'capistrano/rails/console'
# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
