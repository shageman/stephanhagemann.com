# typed: strict
class NavBar::Api
  extend T::Sig
  extend UnsurprisinglyDrawable::Routable

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

  # Return route file name
  sig { override.returns(String) }
  def self.route_file_name
    "nav_bar"
  end
end
