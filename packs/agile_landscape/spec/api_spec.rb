# typed: false
require "rails_helper"

RSpec.describe AgileLandscape::Api do
  describe "#entrypoint_path" do
    it "it returns the path with the param as the subject" do
      expect(AgileLandscape::Api.entrypoint_path).to eq "/agile_landscape"
    end
  end
end
