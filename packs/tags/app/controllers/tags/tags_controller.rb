class Tags::TagsController < ApplicationController
  def index
    @tag_summaries = Tags::Tag.tag_summary_all.sort_by(&:name)
  end

  def show
    @tags = Tags::Tag.where(name: params[:id]).sort_by{ Date.parse(_1.date) }.reverse
  end
end
