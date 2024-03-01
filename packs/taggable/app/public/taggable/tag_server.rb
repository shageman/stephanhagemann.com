# typed: strict

class Taggable::TagServer
  extend T::Sig

  @mutex = T.let(Mutex.new, Mutex)
  @@tagger = T.let(nil, T.nilable(Taggable::Api))

  #configure the tagger to be used in this app
  sig { params(tagger: Taggable::Api).void }
  def self.configure_tagger(tagger)
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
