$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_tracker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active-tracker"
  s.version     = ActiveTracker::VERSION
  s.authors     = ["Ibrahim Muhammad"]
  s.email       = ["ibrahim.mohammad@gmail.com"]
  s.homepage    = "https://github.com/whistler/active-tracker"
  s.summary     = "Rails Event Tracker"
  s.description = "Observes hits on controllers and changes in records for tracking user behaviour
in a Rails application."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.2"
  # s.add_development_dependency "sqlite3"
end
