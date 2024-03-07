# typed: false
require "rails_helper"

RSpec.describe Root::Api do
  describe "#entrypoint_path" do
    it "it returns the path with the param as the subject" do
      expect(Root::Api.entrypoint_path).to eq "/"
    end
  end
end
