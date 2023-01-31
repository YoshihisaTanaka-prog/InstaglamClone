require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Instaclone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end

  config.generators do |g|
    g.skip_routes true #routesの自動記述をoff
    g.helper false #app/helperの自動生成をoff
    g.assets false #同名のcssやjsの生成をoff
    g.test_framework :rspec, #標準のテストをRSpecに変更
    controller_specs: false, #公式で非推奨のためoff
          view_specs: false, #Request/Systemで代替するのでoff
       routing_specs: false #使用頻度低いのでoff
  end
end
