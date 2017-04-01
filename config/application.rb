require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module Watermelon
  class Application < Rails::Application
    config.middleware.use I18n::JS::Middleware
    config.assets.initialize_on_precompile = false
  end
end
