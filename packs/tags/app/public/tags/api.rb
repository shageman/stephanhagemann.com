class Tags::Api
  ROUTE_FILE_NAME = "tags"

  # Entrypoint helper for tags: With tag param, get link to the tag's page. Otherwise, get list of all
  def self.entrypoint_path(name = nil)
    if name
      canonical_name = Tags::Tag.canonical_tag_name(name)
      Rails.application.routes.url_helpers.tag_path(canonical_name)
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

  # How many things have been registered as tagged with the given tag
  def self.tag_tally(tag_name)
    Tags::Tag.tag_tally[tag_name]
  end

  # HTML code to render a consistent chip given a tag name
  def self.chip_for(name)
    canonical_name = Tags::Tag.canonical_tag_name(name)
    ActionController::Base.helpers.link_to "#{canonical_name} (#{::Tags::Api.tag_tally(canonical_name)})", ::Tags::Api.entrypoint_path(canonical_name)
  end
end
