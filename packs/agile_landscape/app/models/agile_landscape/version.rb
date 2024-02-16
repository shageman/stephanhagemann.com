class AgileLandscape::Version < ActiveJSON::Base
  set_root_path File.expand_path(File.join(__FILE__, "../data/"))
  set_filename "versions"

  def to_param
    name.gsub(/[^a-zA-Z0-9]/, "-")
  end
end
