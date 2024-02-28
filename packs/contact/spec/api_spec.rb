# typed: false
require "rails_helper"

RSpec.describe Contact::Api do
  describe "#entrypoint_path" do
    it "it returns the path with the param as the subject" do
      expect(Contact::Api.entrypoint_path("some topic")).to eq "/contact?subject=some+topic"
    end
  end
end
