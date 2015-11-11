module Capistrano
  module Interactive
    class Command
      def initialize(host, command)
        @host    = host
        @command = command
      end

      def to_cmd
        [
          :ssh,
          *ssh_cmd_args,
          @host.hostname,
          %Q{'$SHELL -l -c "#{@command.to_command}"'}
        ].join(' ')
      end

      def execute
        exec(to_cmd)
      end

      private

      def ssh_option(attr_name)
        (@host.netssh_options || {})[attr_name] || (@host.respond_to?(attr_name) ? @host.send(attr_name) : nil)
      end

      def host_name
        ssh_option(:host_name)
      end

      def port
        ssh_option(:port)
      end

      def user
        ssh_option(:user)
      end

      def forward_agent?
        !!ssh_option(:forward_agent)
      end

      def proxy_command
        ssh_option(:proxy) ? ssh_option(:proxy).command_line_template : nil
      end

      def keys
        Array(ssh_option(:keys))
      end

      def ssh_cmd_args
        args = []

        args << '-t'
        args << '-A' if forward_agent?
        args << "-p #{port}" if port
        args << "-l #{user}"
        args << %Q{-o "ProxyCommand #{proxy_command}"} if proxy_command
        args << %Q{-o "HostName #{host_name}"} if host_name

        keys.each do |key|
          args << "-i #{key}"
        end

        args
      end
    end
  end
end
