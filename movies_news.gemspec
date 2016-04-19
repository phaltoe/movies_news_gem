# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'movies_news/version'

Gem::Specification.new do |spec|
  spec.name          = "movies_news"
  spec.version       = MoviesNews::VERSION
  spec.authors       = ["phaltoe"]
  spec.email         = ["reverse9@live.com"]

  spec.summary       = %q{Check out the latest news from movies}
  spec.description   = %q{Check out the latest new movies coming soon to theaters & video games to come to market}
  spec.homepage      = "https://github.com/phaltoe/movies_news_gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "colorize"

  spec.add_dependency "nokogiri"
end
