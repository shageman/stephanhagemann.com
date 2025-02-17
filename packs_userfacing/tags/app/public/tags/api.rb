# typed: strict
class Tags::Api
  extend T::Sig
  extend Taggable::Api
  extend UnsurprisinglyDrawable::Routable

  # Entrypoint helper for tags: With tag param, get link to the tag's page. Otherwise, get list of all
  sig { override.params(name: T.nilable(String)).returns(String)}
  def self.entrypoint_path(name = nil)
    if name
      canonical_name = Tags::Tag.canonical_tag_name(name)
      Rails.application.routes.url_helpers.tag_path(canonical_name)
    else
      Rails.application.routes.url_helpers.tags_path
    end
  end

  # call to add the given element to the tags list
  sig { override.params(name: String, path: String, title: String, date: String).returns(T.any(TrueClass, Taggable::Api::TagParametersInvalid))}
  def self.add_taggable(name:, path:, title:, date:)
    tag = Tags::Tag.new
    tag.name = name
    tag.path = path
    tag.title = title
    tag.date = date
    if !tag.valid?
      return Taggable::Api::TagParametersInvalid.new(tag.errors.messages)
    else
      tag.save!
    end
  end

  # HTML code to render a consistent chip given a tag name
  sig { override.params(name: String).returns(String)}
  def self.chip_for(name)
    canonical_name = Tags::Tag.canonical_tag_name(name)
    ActionController::Base.helpers.link_to "#{canonical_name} (#{::Tags::Tag.tag_tally[canonical_name]})", ::Tags::Api.entrypoint_path(canonical_name)
  end

  # Return route file name
  sig { override.returns(String) }
  def self.route_file_name
    "tags"
  end
end
