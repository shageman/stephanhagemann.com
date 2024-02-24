class AgileLandscape::EntryConnection < ActiveJSON::Base
  set_root_path File.expand_path(File.join(__FILE__, "../data/"))
  set_filename "entry_connections"

  include ActiveHash::Associations
  belongs_to :entry, class_name: "AgileLandscape::Entry"
  belongs_to :connected_entry, class_name: "AgileLandscape::Entry"
  belongs_to :framework, class_name: "AgileLandscape::Framework"

  def to_param
    slug
  end
end
