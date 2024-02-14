require "singleton"

class NavBar::MenuItems
  include Singleton
  include Enumerable

  class MenuItem
    attr_reader :section, :path, :class_name, :text
    
    def initialize(section:, path:, text:, class_name: nil)
      @section = section
      @path = path
      @text = text
      @class_name = class_name
    end
  end

  def initialize
    @items = []
  end

  def <<(section:, path:, text:, class_name: nil)
    @items << MenuItem.new(section: section, path: path, text: text, class_name: class_name)
  end

  def each(&block)
    if @items.size > NavBar::Api.max_menu_items_before_more
      items = @items.first(NavBar::Api.max_menu_items_before_more)
      items << MenuItem.new( section: "more", path: -> { NavBar::Api.entrypoint_path }, text: "...and more")
    else
      items = @items
    end
    items.each(&block)
  end

  def more_each(&block)
    if @items.size > NavBar::Api.max_menu_items_before_more
      items = @items.drop(NavBar::Api.max_menu_items_before_more)
    else
      items = []
    end
    items.each(&block)
  end
end
