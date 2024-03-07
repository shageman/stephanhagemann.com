# typed: strict
class RailsShims::LayoutParams
  extend T::Sig

  sig { returns(T.nilable(String)) }
  attr_reader :active_section
  sig { returns(T.nilable(String)) }
  attr_reader :container_class
  sig { returns(T.nilable(String)) }
  attr_reader :description_link
  sig { returns(T.nilable(String)) }
  attr_reader :description
  sig { returns(T.nilable(String)) }
  attr_reader :header
  sig { returns(T.nilable(String)) }
  attr_reader :page_class
  sig { returns(T.nilable(String)) }
  attr_reader :title

  sig { params(active_section: T.nilable(String),
      container_class: T.nilable(String),
      description_link: T.nilable(String),
      description: T.nilable(String),
      header: T.nilable(String),
      page_class: T.nilable(String),
      title: T.nilable(String)).void
    }
  def initialize(
    active_section: nil,
    container_class: nil,
    description_link: nil,
    description: nil,
    header: nil,
    page_class: nil,
    title: nil
  )
    @active_section = active_section
    @container_class = container_class
    @description_link = description_link
    @description = description
    @header = header
    @page_class = page_class
    @title = title
  end
end
