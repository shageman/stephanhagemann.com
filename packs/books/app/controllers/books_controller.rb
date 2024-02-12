class BooksController < ApplicationController
  before_action :set_section

  def index
    @books = Book.all.sort_by { Date.parse(_1.date) }.reverse

    render layout: "page"
  end

  def show
    @book = Book.find(params[:id])

    render layout: 'layouts/book'
  end

  private

  def set_section
    @activeSection = 'books'
  end
end