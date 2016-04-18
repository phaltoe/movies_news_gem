$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'movies_news'

RSpec.configure do |config|
  config.order = :default
  config.before(:each) do
    ["MoviesNews::Article", "MoviesNews::Author"].each do |class_name|
      if Kernel.const_defined?(class_name)
        klass = Kernel.const_get(class_name)
        if klass.respond_to?(:destroy_all)
          klass.destroy_all
        else
          klass.class_variable_set(:@@all, [])
        end
      end
    end
  end
end
