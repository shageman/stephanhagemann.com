class AgileLandscape::Framework < ActiveJSON::Base
  set_root_path File.expand_path(File.join(__FILE__, "../data/"))
  set_filename "frameworks"
end
