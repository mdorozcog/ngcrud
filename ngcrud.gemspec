Gem::Specification.new do |s|
  s.name        = "ngcrud"
  s.version     = "0.0.1"
  s.summary     = "Angular CRUD Generator"
  s.description = "A rails-like Angular CRUD Generator"
  s.authors     = ["Diego Orozco"]
  s.email       = "mdorozcog@gmail.com"
  s.files       = Dir["{bin,lib,test}/**/*", "README.md", "LICENSE", "Rakefile"]
  s.homepage    =
    "https://github.com/mdorozcog/ngcrud"
  s.license       = "MIT"
  s.platform              = Gem::Platform::RUBY
  s.required_ruby_version = ">= 3.1.2"
  s.executables << "ngcrud"
  s.add_dependency "erb", "~> 4.0.2"
end