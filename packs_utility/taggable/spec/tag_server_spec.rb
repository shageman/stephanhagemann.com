# typed: false
require "rails_helper"

RSpec.describe "Taggable" do
  it "configures the server with a nil server if nothing is passed in" do
    Taggable::TagServer.configure_tagger
    expect(Taggable::TagServer.tagger).to eq(Taggable::TagServer::NilTaggableApi)
  end
end
