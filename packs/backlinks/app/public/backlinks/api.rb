# typed: strict
class Backlinks::Api
  extend T::Sig

  # Call with a path and source_page_title strings to register given linked_paths
  # Every path can only be registered once. Subsequent calls will return an error
  sig { params(path: String, source_page_title: String, linked_paths: T::Array[String]).returns(T.any(Exception, T::Array[String])) }
  def self.register_links_for(path, source_page_title, linked_paths)
    existing_backlinks = Backlinks::Backlink.where(source_path: path)
    if existing_backlinks.size > 0
      exception = Exception.new("Links for #{path} were already registered")
      exception.set_backtrace(caller)
      return exception
    else
      linked_paths.each do |linked_path|
        linked_path.gsub!(/\/$/, "")
        Backlinks::Backlink.create(source_path: path, source_title: source_page_title, destination_path: linked_path)
      end
    end
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
