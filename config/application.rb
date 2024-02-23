require_relative "boot"

require "action_controller/railtie"
require "action_view/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module StephanhagemannCom
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    middleware.use ::ActionDispatch::Static, File.expand_path(File.join(__FILE__, "../../packs/agile_landscape/public"))
    middleware.use ::ActionDispatch::Static, File.expand_path(File.join(__FILE__, "../../packs/books/public"))
    middleware.use ::ActionDispatch::Static, File.expand_path(File.join(__FILE__, "../../packs/posts/public"))
    middleware.use ::ActionDispatch::Static, File.expand_path(File.join(__FILE__, "../../packs/root/public"))
    middleware.use ::ActionDispatch::Static, File.expand_path(File.join(__FILE__, "../../packs/speaking/public"))
  end
end
