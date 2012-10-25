Gem::Specification.new do |gem|
  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  gem.summary       = %q{Noisrev <-> Version}
  gem.description   = gem.summary.dup
  gem.homepage      = 'http://kachick.github.com/noisrev/'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'noisrev'
  gem.require_paths = ['lib']
  gem.version       = '0.0.5'

  gem.required_ruby_version = '>= 1.9.2'

  gem.add_runtime_dependency 'striuct', '~> 0.4'

  gem.add_development_dependency 'yard', '>= 0.8'
end

