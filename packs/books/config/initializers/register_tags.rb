Rails.application.config.to_prepare do
  Rails.application.reload_routes!

  Books::Book.all.each do |book|
    book.tags.each do |tag|
      Tags::Api.add_tagable(name: tag, path: Books::Api.entrypoint_path(book.slug), title: book.title, date: book.date)
    end
  end
end
