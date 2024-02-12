class Books::BooksController < ApplicationController
  before_action :set_section

  def index
    @books = Books::Book.all.sort_by { Date.parse(_1.date) }.reverse

    render layout: "page"
  end

  def show
    @book = Books::Book.find(params[:id])

    render layout: 'layouts/books/book'
  end

  private

  def set_section
    @active_section = 'books'
  end
end