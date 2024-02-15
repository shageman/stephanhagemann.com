class RailsShims::LayoutParams
  attr_reader :active_section,
              :container_class,
              :description_link,
              :description,
              :header,
              :page_class,
              :title

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
