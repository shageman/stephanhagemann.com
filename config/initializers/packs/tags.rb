Rails.application.config.to_prepare do
  Posts::Api.all_posts.each do |post|
    post.tags.each do |tag|
      Tags::Api.add_tagable(name: tag, path: -> { Posts::Api.entrypoint_path(post.slug) }, title: post.title, date: post.date)
    end
  end

  Books::Api.all_books.each do |book|
    book.tags.each do |tag|
      Tags::Api.add_tagable(name: tag, path: -> { Books::Api.entrypoint_path(book.slug) }, title: book.title, date: book.date)
    end
  end
end
