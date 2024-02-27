# typed: strict
class NavBar::Api
  extend T::Sig

  ROUTE_FILE_NAME = "nav_bar"

  @@max_menu_items_before_more =  T.let(4, Integer)

  # Entrypoint helper for "more page" of NavBar
  sig { returns(String) }
  def self.entrypoint_path
    Rails.application.routes.url_helpers.more_index_path
  end

  # call to configure how many menu items to show before the more page is used
  sig { params(number: Integer).returns(Integer) }
  def self.max_menu_items_before_more=(number)
    @@max_menu_items_before_more = number
  end

  # get the configured number of menu items to show before the more page is used
  sig { returns(Integer) }
  def self.max_menu_items_before_more
    @@max_menu_items_before_more
  end
end
