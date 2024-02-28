# typed: false
require "rails_helper"

RSpec.describe Books::Api do
  describe "#entrypoint_path" do
    it "without a param, it returns the index path" do
      expect(Books::Api.entrypoint_path).to eq "/books"
    end

    it "with a param, it returns the show path" do
      expect(Books::Api.entrypoint_path("some_book")).to eq "/books/some_book"
    end
  end
end
