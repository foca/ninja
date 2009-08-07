Gem::Specification.new do |s|
  s.name    = "ninja"
  s.version = "0.1"
  s.date    = "2009-08-07"

  s.description = "Run background tasks easily"
  s.summary     = "Provide several ways to offload tasks to the background"
  s.homepage    = "http://github.com/foca/ninja"

  s.authors = ["Nicolás Sanguinetti"]
  s.email   = "contacto@nicolassanguinetti.info"

  s.require_paths     = ["lib"]
  s.rubyforge_project = "integrity"
  s.has_rdoc          = true
  s.rubygems_version  = "1.3.1"

  if s.respond_to?(:add_development_dependency)
    s.add_development_dependency "sr-mg"
    s.add_development_dependency "contest"
    s.add_development_dependency "redgreen"
  end

  s.files = %w[
.gitignore
LICENSE
README.rdoc
Rakefile
ninja.gemspec
lib/ninja.rb
lib/ninja/threaded.rb
]
end
