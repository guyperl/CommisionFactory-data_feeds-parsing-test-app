require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CFDFT
  class Application < Rails::Application

    # don't generate RSpec tests for views and helpers
    config.generators do |g|
      g.test_framework :rspec
      g.view_specs false
      g.helper_specs false
    end

    config.autoload_paths += %W(#{config.root}/lib)
  end
end
