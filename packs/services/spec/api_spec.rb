# typed: false
require "rails_helper"

RSpec.describe Services::Api do
  describe "#entrypoint_path" do
    it "it returns the path with the param as the subject" do
      expect(Services::Api.entrypoint_path).to eq "/services"
    end
  end
end
