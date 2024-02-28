# typed: false
require_relative "boot"

require "action_controller/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module StephanhagemannCom
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))

    Dir.glob("#{Rails.root}/packs/*/app/assets").each do |asset_path|
      middleware.use(::ActionDispatch::Static, asset_path)
    end
  end
end
