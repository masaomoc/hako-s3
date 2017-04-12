# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'hako-s3'
  spec.version       = '0.0.1'
  spec.authors       = ['Masao Mochizuki']
  spec.email         = ['masaomoc.0301988@gmail.com']

  spec.summary       = %q{Provide variables from S3 object}
  spec.description   = %q{Provide variables from S3 object}
  spec.homepage      = 'https://github.com/masaomoc/hako-s3'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'hako'
  spec.add_dependency 'aws-sdk', '~> 2.9'
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
