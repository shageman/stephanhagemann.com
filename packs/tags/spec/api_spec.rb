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

  describe "#add_tagable and #chip_for" do
    it "chips reflect the amount of times a tag has been registered" do
      expect(Tags::Api.chip_for("XX")).to eq "<a href=\"/tags/XX\">XX ()</a>"

      Tags::Api.add_tagable(name: "XX", path: "source_path", title: "Source Title", date: "alk")
      expect(Tags::Api.chip_for("XX")).to eq "<a href=\"/tags/XX\">XX (1)</a>"

      Tags::Api.add_tagable(name: "XX", path: "source_path", title: "Source Title", date: "alk")
      expect(Tags::Api.chip_for("XX")).to eq "<a href=\"/tags/XX\">XX (2)</a>"
    end
  end
end
