$:.push File.expand_path("../lib", __FILE__)
require "Attendant/version"

Gem::Specification.new do |s|
  s.name              = "Attendant"
  s.version           = Attendant::VERSION
  s.authors           = ["Ian Graham"]
  s.email             = ["imartingraham@gmail.com"]
  s.homepage          = "http://github.com/imartingraham/Attendant"
  s.summary           = "Simple wrapper for Conductor Searchlight API."
  s.description       = ""

  s.rubyforge_project = s.name

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency("httpi")
  s.add_runtime_dependency("json")  
 
end