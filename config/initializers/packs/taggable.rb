# typed: strict

require "singleton"

Rails.application.config.to_prepare do
  if defined?(Taggable)
    if defined?(Tags)
      puts "blah"
      Taggable::TagServer.configure_tagger(Tags::Api)
    else
      Taggable::TagServer.configure_tagger
    end
  end
end
