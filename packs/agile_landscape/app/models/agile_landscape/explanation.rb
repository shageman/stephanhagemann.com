class AgileLandscape::Explanation < ActiveJSON::Base
  include ActiveHash::Associations
  belongs_to :framework_connection, class_name: "AgileLandscape::FrameworkConnection"

  set_root_path File.expand_path(File.join(__FILE__, "../data/"))
  set_filename "explanations"
end
