module Capistrano
  module Interactive
    module BackendHook
      def self.included(base)
        base.class_eval do
          alias_method :non_interactive_execute, :execute
          def execute(*args)
            if BackendHook.intercept_command?
              BackendHook.last_command = command(*args)
            else
              non_interactive_execute(*args)
            end
          end
        end
      end

      def self.intercept_command!
        @intercept_command = true
      end

      def self.intercept_command?
        !!@intercept_command
      end

      def self.last_command
        @last_command
      end

      private

      def self.last_command=(cmd)
        @last_command = cmd
      end
    end
  end
end
