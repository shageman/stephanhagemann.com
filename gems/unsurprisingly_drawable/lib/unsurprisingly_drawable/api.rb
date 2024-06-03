module UnsurprisinglyDrawable
  module Routable
    class Api
      # call this AT THE TOP of the application's routes.rb file to ensure
      # Routable is set up properly
      def self.register!
        require_relative "../action_dispatch/routing/mapper/resources.rb"
      end
    end
  end
end
