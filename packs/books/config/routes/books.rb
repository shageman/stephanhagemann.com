# typed: false

resources :books, only: [:index, :show], controller: "books/books"
