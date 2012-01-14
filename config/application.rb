require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)  
  Bundler.require *Rails.groups(:assets => %w(development test))  
end  

# require 'compass/logger'
module GpaCalculator
  class Application < Rails::Application
    # config.action_view.javascript_expansions[:defaults] = %w(jquery.min jquery_ujs)

    config.encoding = "utf-8"
    config.filter_parameters += [:password]

    config.assets.enabled = true
    config.assets.version = "1.0"

    config.generators do |g|
      g.test_framework :rspec, :fixture => true, :views => false
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
      g.template_engine :haml
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
