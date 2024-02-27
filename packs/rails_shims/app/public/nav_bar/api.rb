# typed: false
class NavBar::Api
  ROUTE_FILE_NAME = "nav_bar"

  @@max_menu_items_before_more ||= 4

  # Entrypoint helper for "more page" of NavBar
  def self.entrypoint_path
    Rails.application.routes.url_helpers.more_index_path
  end

  # call to configure how many menu items to show before the more page is used
  def self.max_menu_items_before_more=(number)
    @@max_menu_items_before_more = number
  end

  # get the configured number of menu items to show before the more page is used
  def self.max_menu_items_before_more
    @@max_menu_items_before_more
  end
end
