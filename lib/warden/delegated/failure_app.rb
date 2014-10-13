module Warden
  module Delegated
    class FailureApp
      attr_reader :env, :request
      delegate :session, to: :request

      def call(env)
        @env = env
        @request = Rack::Request.new(env)
        set_return_to
        ['302', {'Location' => login_url}, ['']]
      end

      private

      def set_return_to
        session["#{scope}_return_to"] = original_fullpath
      end

      def warden
        env['warden']
      end

      def scope
        warden.config.default_scope
      end

      def warden_options
        env['warden.options']
      end

      def attempted_path
        warden_options[:attempted_path]
      end

      def original_fullpath
        request.base_url + attempted_path
      end

      def login_url
        ENV["LOGIN_URL"]
      end

    end
  end
end
