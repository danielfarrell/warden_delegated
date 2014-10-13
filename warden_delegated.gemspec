$:.unshift File.expand_path("../lib", __FILE__)
require "warden/delegated/version"

Gem::Specification.new do |gem|
  gem.name     = "warden_delegated"
  gem.version  = Warden::Delegated::VERSION

  gem.author   = "Daniel Farrell"
  gem.email    = "danielfarrell76@gmail.com"
  gem.homepage = "http://github.com/danielfarrell/warden_delegated"
  gem.summary  = "Small warden setup delegating to a devise app"

  gem.description = gem.summary

  gem.files = Dir["**/*"].select { |d| d =~ %r{^(README|bin/|lib/)} }

  gem.licenses = ["MIT"]

  gem.add_dependency("warden", "~> 1.2")
  gem.add_dependency("orm_adapter", "~> 0.1")

end
