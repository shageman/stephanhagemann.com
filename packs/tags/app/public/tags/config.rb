class Tags::Config
  ROUTE_FILE_NAME = "tags"

  # Entrypoint helper for tags: With tag param, get link to the tag's page. Otherwise, get list of all
  def self.entrypoint_path(name = nil)
    if name
      Rails.application.routes.url_helpers.tag_path(name)
    else
      Rails.application.routes.url_helpers.tags_path
    end
  end

  # call to add the given element to the tags list
  def self.add_tagable(name:, path:, title:, date:)
    # Tags::Tag.create(tag: tag, path: path, title: title, date: date)
    tag = Tags::Tag.create
    tag.name = name
    tag.path = path
    tag.title = title
    tag.date = date
    tag.save!
  end
end
