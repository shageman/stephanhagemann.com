# typed: false
class Books::BooksController < ApplicationController
  def index
    @books = Books::Book.all.sort_by { Date.parse(_1.date) }.reverse
  end

  def show
    @book = Books::Book.find_by_slug(params[:id])
  end
end
