# typed: strict

class Taggable::TagServer
  extend T::Sig

  @mutex = T.let(Mutex.new, Mutex)
  @@tagger = T.let(nil, T.nilable(Taggable::Api))

  class NilTaggableApi
    extend T::Sig
    extend Taggable::Api

    #nil entry_point
    sig { override.params(name: T.nilable(String)).returns(String)}
    def self.entrypoint_path(name)
      ""
    end

    #nil add_taggable
    sig {
      override.params(name: String, path: String, title: String, date: String).
      returns(T.any(TrueClass, Taggable::Api::TagParametersInvalid))
    }
    def self.add_taggable(name:, path:, title:, date:)
      true
    end

    #nil chip_for
    sig { override.params(name: String).returns(String)}
    def self.chip_for(name)
      ""
    end
  end

  #configure the tagger to be used in this app
  sig { params(tagger: Taggable::Api).void }
  def self.configure_tagger(tagger = Taggable::TagServer::NilTaggableApi)
    @mutex.synchronize do
      @@tagger = tagger
    end
  end

  # get a tagger from the instance
  sig { returns(Taggable::Api) }
  def self.tagger
    T.must(@@tagger)
  end
end
