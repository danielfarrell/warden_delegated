# Warden Delegated

This is a minimal Warden configuration used to delegate authentication to another app that is running Devise. Extracted from a production environment.

## Assumptions

Steps:

1. Add to Gemfile `gem 'warden_delegated'`
2. Configure your applications to share sessions
3. Set the LOGIN_URL environment variable
4. Add `include Warden::Delegated::Model` in your user model
5. Add initializer like below

## Warden Initializer

Put the following in an initializer(assumes :user scope and User model):

    Rails.application.config.middleware.use Warden::Manager do |manager|
      manager.failure_app = Warden::Delegated::FailureApp.new
      manager.default_scope = :user
      manager.default_strategies :delegated
      manager.serialize_from_session(:user) do |key|
        User.serialize_from_session(key)
      end
    end

## TODO

1. Write some tests
