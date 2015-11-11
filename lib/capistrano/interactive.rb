require 'capistrano/interactive/dsl'
require 'capistrano/interactive/backend_hook'

SSHKit::Backend::Netssh.send(:include, Capistrano::Interactive::BackendHook)
include Capistrano::Interactive::DSL
