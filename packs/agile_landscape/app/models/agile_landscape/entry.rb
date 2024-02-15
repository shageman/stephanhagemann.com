class AgileLandscape::Entry < ActiveJSON::Base
  set_root_path File.expand_path(File.join(__FILE__, "../data/"))
  set_filename "entries"

  def to_param
    slug
  end

  # def slug
  #   "versions/#{Version}/entries/#{Name}"
  # end
end
