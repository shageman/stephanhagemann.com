# typed: false
class Tags::Tag < ActiveHash::Base
  include ActiveModel::Validations

  fields :name, :path, :title, :date

  validates :name, presence: true
  validates :path, presence: true
  validates :title, presence: true
  validate :date_is_parseable

  def date_is_parseable
    DateTime.parse(date)
  rescue
    self.errors.add(:date, "is not parseable")
  end

  def to_param
    name
  end

  def self.tag_tally
    Tags::Tag.all.map(&:canonical_tag_name).tally
  end

  def self.tagged_count_frequency(name)
    max = tag_tally.values.max
    (((tag_tally[name].to_f * 9) / max) + 1).round
  end

  TagSummary = Struct.new(:name, :count)

  def self.tag_summary_all
    tally = Tags::Tag.tag_tally

    tally.keys.map do |tag_name|
      TagSummary.new(tag_name, tally[tag_name])
    end
  end

  def self.canonical_tag_name(name)
    canonical_tags = {
      "gradual modularity" => "gradual modularization",
      "gradualmodularization" => "gradual modularization"
    }
    canonical_tags.default = name
    canonical_tags[name]
  end

  def canonical_tag_name
    self.class.canonical_tag_name(name)
  end
end
