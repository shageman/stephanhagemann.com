class Posts::PostsController < ApplicationController
  def index
    @posts = Posts::Post.all.sort_by { Date.parse(_1.date) }.reverse

    render layout: "page"
  end

  def show
    @post = Posts::Post.find_by_slug(params[:id])
  end
end