require_relative "augmentation/version"

module Augmentation
  Dir[File.dirname(__FILE__) + '/source/**/*.rb'].each { |file|
    puts file
    require file
  }
end
