require "singleton"

class RailsShims::MenuItems
  include Singleton
  include Enumerable

  class MenuItem
    attr_reader :section, :path, :class_name, :text
    
    def initialize(section:, path:, class_name: nil, text:)
      @section = section
      @path = path
      @class_name = class_name
      @text = text
    end
  end

  def initialize
    @items = []
  end

  # Call this method for every menu item you would like to create... probably somewhere in an initializer
  def <<(section:, path:, class_name: nil, text:)
    @items << MenuItem.new( section: section, path: path, class_name: class_name, text: text)
  end

  # Accessor method to loop over all the added menu items
  def each(&block)
    @items.each(&block)
  end
end