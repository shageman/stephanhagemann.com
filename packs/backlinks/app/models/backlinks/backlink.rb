class Backlinks::Backlink < ActiveHash::Base
  fields :source_path, :source_title, :destination_path
end
