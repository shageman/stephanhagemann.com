# typed: false
class AgileLandscape::FrameworkConnection < ActiveJSON::Base
  set_root_path File.expand_path(File.join(__FILE__, "../data/"))
  set_filename "framework_connections"

  include ActiveHash::Associations
  belongs_to :entry, class_name: "AgileLandscape::Entry"
  belongs_to :framework, class_name: "AgileLandscape::Framework"
  has_one :explanation, class_name: "AgileLandscape::Explanation"

  def to_param
    slug
  end
end
