$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "blacklight/sitemaps/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "blacklight-sitemaps"
  spec.version     = Blacklight::Sitemaps::VERSION
  spec.authors     = ["Jack Reed", "Nikitas Tampakis", "Michael Gibney", "Andrea Gazzarini", "Matthias Vandermaesen", "Charlie Morris"]
  spec.email       = ["phillipjreed@gmail.com", "nikitas.tampakis@gmail.com", "michael@michaelgibney.net", "a.gazzarini@sease.io", "matthias@colada.be",  "cdmorris22@gmail.com"]
  spec.homepage    = "https://github.com/cdmo/blacklight-sitemaps"
  spec.summary     = "Sitemaps for Solr in Blacklight"
  spec.description = "Dynamically generated sitemaps for Blacklight applications"
  spec.license     = "Apache 2.0"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.1", "< 7"
  
  spec.add_development_dependency "engine_cart"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "solr_wrapper"
  spec.add_development_dependency "sqlite3"
end
