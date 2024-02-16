class AgileLandscape::Framework < ActiveJSON::Base
  include ActiveHash::Associations
  belongs_to :version, class_name: "AgileLandscape::Version"

  has_many :entry_connections, class_name: "AgileLandscape::EntryConnection"
  has_many :framework_connections, class_name: "AgileLandscape::FrameworkConnection"

  set_root_path File.expand_path(File.join(__FILE__, "../data/"))
  set_filename "frameworks"

  def to_param
    name.gsub(/[^a-zA-Z0-9]/, "-")
  end
end
