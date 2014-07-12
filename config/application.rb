require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GovTroll
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec, fixtures: true, view_specs: false, helper_specs: false, controller_specs: false, routing_specs: false
      g.stylesheets = false
      g.javascripts = false
      g.factory_girl true
    end
  end
end
