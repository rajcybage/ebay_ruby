# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ebay_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "ebay_ruby"
  spec.version       = EbayRuby::VERSION
  spec.date          = '2014-06-10'
  spec.authors       = ["Rajarshi Das"]
  spec.email         = ["rdasrubyonrails@gmail.com"]
  spec.summary       = %q{Get access to all ebay api fundamentals}
  spec.description   = %q{Get access to all ebay api fundamentals with fetch data, find item..many more}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir["README.md","Gemfile","Rakefile", "lib/**/*"]


  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "active_support"
end
