require 'capistrano/interactive/command'

module Capistrano
  module Interactive
    module DSL
      def interact(*args)
        Capistrano::Interactive::BackendHook.intercept_command!
        execute(*args)
        Capistrano::Interactive::Command.new(host, Capistrano::Interactive::BackendHook.last_command).execute
      end
    end
  end
end
