module Warden
  module Delegated
    class Strategy < ::Warden::Strategies::Base

      def authenticate!
        if !env['warden'].authenticated?
          fail!("Not logged in") and return
        end
      end
    end
  end
end

Warden::Strategies.add(:delegated, Warden::Delegated::Strategy)
