class Books::Config
  ROUTE_FILE_NAME = "books"

  # Without a param, exposes path helper to root of books pages. You can pass in the name of a book as a param.
  # If that name is found among the books, the link will be to that book. Otherwise, the link will 
  # be to the books root and an error will be logged
  def self.entrypoint_path(book_name = nil)
    if book_name
      book = Books::Book.find_by_title(book_name)
      Rails.application.routes.url_helpers.book_path(book)
    else
      Rails.application.routes.url_helpers.books_path
    end
  end
end
