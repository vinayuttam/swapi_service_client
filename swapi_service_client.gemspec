
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "swapi_service_client/version"

Gem::Specification.new do |spec|
  spec.name          = "swapi_service_client"
  spec.version       = SwapiServiceClient::VERSION
  spec.authors       = ["Vinay Uttam Vemparala"]
  spec.email         = ["vinayuttamvemparala@gmail.com"]

  spec.summary       = "A simple ruby client wrapper for StarWars API"
  spec.homepage      = "https://github.com/vinayuttam/swapi_service_client"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/vinayuttam/swapi_service_client"
    spec.metadata["changelog_uri"] = "https://github.com/vinayuttam/swapi_service_client/blob/master/README.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir["{lib}/**/*", "README.md"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday', '~> 0.17.0'
  spec.add_dependency 'dry-struct', '~> 1.1.1'
  spec.add_dependency 'addressable', '~> 2.7'

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
