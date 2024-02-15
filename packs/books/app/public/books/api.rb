class Books::Api
  ROUTE_FILE_NAME = "books"

  # Without a param, exposes path helper to root of books pages. You can pass in the name of a book as a param.
  # If that name is found among the books, the link will be to that book. Otherwise, the link will 
  # be to the books root and an error will be logged
  def self.entrypoint_path(slug = nil)
    if slug
      Rails.application.routes.url_helpers.book_path(slug)
    else
      Rails.application.routes.url_helpers.books_path
    end
  end

  # Returns all books
  def self.all_books
    Books::Book.all
  end
end
