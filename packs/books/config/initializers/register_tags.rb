# typed: strict
Rails.application.config.to_prepare do
  Rails.application.reload_routes!

  Books::Book.all.each do |book|
    book.tags.each do |tag|
      success = Taggable::TagServer.tagger.add_taggable(name: tag, path: Books::Api.entrypoint_path(book.slug), title: book.title, date: book.date)
      case success
      when TrueClass
        Rails.logger.info "Tag registered for book"
      when Taggable::Api::TagParametersInvalid
        raise "Tag creation failed due to bad params: #{success.message}"
      else
        T.absurd(success)
      end
    end
  end
end
