class Posts::PostsController < ApplicationController
  before_action :set_section

  def index
    @posts = Posts::Post.all.sort_by { Date.parse(_1.date) }.reverse

    render layout: "page"
  end

  def show
    @post = Posts::Post.find(params[:id])
  end

  private

  def set_section
    @active_section = 'posts'
  end
end