require "json"

class Posts::Webmention < ActiveFile::Base
  set_root_path File.expand_path(File.join(__FILE__, "../../../../../../_cache/"))
  set_filename "webmentions"

  include ActiveHash::Associations
  belongs_to :in_reply_to, class_name: "Posts::MastodonPost", foreign_key: "in_reply_to"

  def self.load_file
    file = File.read(full_path)
    data_hash = JSON.parse(file)
    data_hash["children"]
  end

  def self.extension
    "json"
  end

  def is_mine?
    urls = [
      "https://stephanhagemann.com",
      "https://twitter.com/shageman",
      "https://cbra.info"
    ]
    authorUrl = author ? author["url"] : false
    authorUrl && urls.any? { authorUrl.starts_with?(_1) }
  end

  def content_html
    sanitized = ActionController::Base.helpers.sanitize(content["html"], tags: %w(),);
    shortened = sanitized.slice(0,300).split(" ")[0..-2].join(" ")
    "#{shortened}...";
  end
end
