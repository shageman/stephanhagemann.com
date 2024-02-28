# typed: false
require "rails_helper"

RSpec.describe Posts::Api do
  describe "#entrypoint_path" do
    it "without a param, it returns the index path" do
      expect(Posts::Api.entrypoint_path).to eq "/posts"
    end

    it "with a param, it returns the show path" do
      expect(Posts::Api.entrypoint_path("some_book")).to eq "/posts/some_book"
    end
  end
end
