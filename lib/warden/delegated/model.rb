require 'orm_adapter'

module Warden
  module Delegated
    module Model
      extend ActiveSupport::Concern

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        include OrmAdapter::ToAdapter
        def serialize_from_session(key)
          id, salt = key
          user = to_adapter.get id
          user if user && user.authenticatable_salt == salt
        end
      end

      def authenticatable_salt
        encrypted_password[0,29] if encrypted_password
      end

    end
  end
end
