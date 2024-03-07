# typed: strict
module Taggable::Api
  extend T::Sig
  extend T::Helpers
  interface!

  class TagParametersInvalid < StandardError; end

  # Entrypoint helper for tags: With tag param, get link to the tag's page. Otherwise, get list of all
  sig { abstract.params(name: T.nilable(String)).returns(String)}
  def entrypoint_path(name);end

  # call to add the given element to the tags list
  sig { abstract.
          params(name: String, path: String, title: String, date: String).
          returns(T.any(TrueClass, TagParametersInvalid))
        }
  def add_taggable(name:, path:, title:, date:); end

  # HTML code to render a consistent chip given a tag name
  sig { abstract.params(name: String).returns(String)}
  def chip_for(name); end
end
