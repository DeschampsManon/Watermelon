require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module Watermelon
  class Application < Rails::Application
    config.middleware.use SimplesIdeias::I18n::Middleware
  end
end
