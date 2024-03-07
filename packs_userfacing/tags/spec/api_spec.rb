# typed: false
require "rails_helper"

RSpec.describe Tags::Api do
  describe "#entrypoint_path" do
    it "without a param, it returns the index path" do
      expect(Tags::Api.entrypoint_path).to eq "/tags"
    end

    it "with a param, it returns the show path" do
      expect(Tags::Api.entrypoint_path("some_tag")).to eq "/tags/some_tag"
    end
  end

  describe "#add_taggable and #chip_for" do
    it "reflects in chips the amount of times a tag has been registered" do
      expect(Tags::Api.chip_for("XX")).to eq "<a href=\"/tags/XX\">XX ()</a>"

      add_result = Tags::Api.add_taggable(name: "XX", path: "source_path", title: "Source Title", date: "2022-01-01")
      expect(add_result).to be_a(TrueClass)
      expect(Tags::Api.chip_for("XX")).to eq "<a href=\"/tags/XX\">XX (1)</a>"

      add_result = Tags::Api.add_taggable(name: "XX", path: "source_path", title: "Source Title", date: "2022-01-01")
      expect(add_result).to be_a(TrueClass)
      expect(Tags::Api.chip_for("XX")).to eq "<a href=\"/tags/XX\">XX (2)</a>"
    end

    it "add_taggable returns an error if the given tag is unacceptable" do
      add_result = Tags::Api.add_taggable(name: "", path: "", title: "", date: "alk")

      expect(add_result.message).to include('name=>["can\'t be blank"')
      expect(add_result.message).to include("path=>[\"can't be blank\"")
      expect(add_result.message).to include("title=>[\"can't be blank\"")
      expect(add_result.message).to include("date=>[\"is not parseable\"")
    end
  end
end
