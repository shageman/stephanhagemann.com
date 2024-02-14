class Tags::Tag < ActiveHash::Base
  self.data = [
    {
      name: "",
      path: "",
      title: "",
      date: ""
    }
  ]

  def to_param
    name
  end

  def self.tag_tally
    Tags::Tag.all.flat_map(&:name).reject { _1 == "" }.tally
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
end
