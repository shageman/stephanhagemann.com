# typed: strict
class Backlinks::Api
  extend T::Sig

  class BacklinkParametersInvalid < StandardError; end

  # Call with a path and source_page_title strings to register given linked_paths
  # If invalid input data prevents saving an error will be returned and zero to all
  # link paths may have been saved
  sig { params(path: String, source_page_title: String, linked_paths: T::Array[String]).returns(T.any(TrueClass, BacklinkParametersInvalid)) }
  def self.register_links_for(path, source_page_title, linked_paths)
    linked_paths.each do |linked_path|
      linked_path.gsub!(/\/$/, "")
      link = Backlinks::Backlink.new(source_path: path, source_title: source_page_title, destination_path: linked_path)
      if !link.valid?
        return BacklinkParametersInvalid.new(link.errors.messages)
      else
        link.save!
      end
    end
    true
  end

  # Return an enumerable of the registered (link_name, path) tuples that are linking to the given path
  sig { params(path: String).returns(String) }
  def self.backlinks_for(path)
    backlinks = Backlinks::Backlink.where(destination_path: path)

    if backlinks.size > 0
      result = <<~HTML
        <section class="flow">
          <h2>Backlinks</h2>
          <ul class="backlinks-container">
      HTML
      backlinks.each do |backlink|
        result += "<li class='backlink'><a href='#{backlink.source_path}' class='backlink__link'>#{backlink.source_title}</a></li>"
      end
      result += <<~HTML
          </ul>
      </section>
      HTML
    else
      ""
    end
  end
end
