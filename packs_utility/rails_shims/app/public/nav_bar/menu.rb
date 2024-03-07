# typed: strict
class NavBar::Menu
  extend T::Sig

  # Call this method for every menu item you would like to create... probably somewhere in an initializer
  sig { params(section: String, path: String, text: String, class_name: T.nilable(String)).void }
  def self.add_item(section:, path:, text:, class_name: nil)
    NavBar::MenuItems.instance.<<(section: section, path: path, text: text, class_name: class_name)
  end

  # Accessor method to loop over all the added menu items
  sig { params(block: T.proc.params(arg: NavBar::MenuItems::MenuItem).returns(NavBar::MenuItems::MenuItem)).returns(T::Array[NavBar::MenuItems::MenuItem])}
  def self.each_item(&block)
    NavBar::MenuItems.instance.each(&block)
  end
end
