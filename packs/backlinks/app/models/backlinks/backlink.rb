# typed: false
class Backlinks::Backlink < ActiveHash::Base
  include ActiveModel::Validations

  fields :source_path, :source_title, :destination_path

  validates :source_path, presence: true
  validates :source_title, presence: true
  validates :destination_path, presence: true
end
