# typed: strict

require "singleton"

Rails.application.config.to_prepare do
  Taggable::TagServer.configure_tagger(Tags::Api)
end
