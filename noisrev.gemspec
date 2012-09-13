Gem::Specification.new do |gem|
  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  gem.summary       = %q{Noisrev <-> Version}
  gem.description   = %q{Noisrev <-> Version}
  gem.homepage      = 'https://github.com/kachick/noisrev'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'noisrev'
  gem.require_paths = ['lib']
  gem.version       = '0.0.4'

  gem.required_ruby_version = '>= 1.9.2'

  gem.add_runtime_dependency 'striuct', '~> 0.3'

  gem.add_development_dependency 'yard', '>= 0.8.2.1'
end

