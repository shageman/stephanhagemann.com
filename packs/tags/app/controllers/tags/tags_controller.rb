class Tags::TagsController < ApplicationController
  def index
    @tags = Tags::Tag.all.sort_by { Date.parse(_1.date) }.reverse

    render layout: "page"
  end

  def show
    @post = Tags::Tag.find_by_slug(params[:id])
  end
end
