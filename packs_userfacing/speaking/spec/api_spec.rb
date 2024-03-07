# typed: false
require "rails_helper"

RSpec.describe Speaking::Api do
  describe "#entrypoint_path" do
    it "it returns the path with the param as the subject" do
      expect(Speaking::Api.entrypoint_path).to eq "/speaking"
    end
  end
end
