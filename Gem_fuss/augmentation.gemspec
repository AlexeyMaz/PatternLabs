require_relative "lib/augmentation/version"

Gem::Specification.new do |spec|
  spec.name = "augmentation"
  spec.version = Augmentation::VERSION
  spec.authors = ["AlMaz"]
  spec.email = ["kys@gmail.com"]
  spec.summary = "Student App"
  spec.description = "А gem that allows you to get pass for patterns"
  spec.homepage = "https://github.com/AlexeyMaz/PatternLabs"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"
  spec.add_dependency 'win32api'
  spec.files = Dir.glob("**/*")
end