# typed: false
class Tags::TagsController < ApplicationController
  def index
    @tag_summaries = Tags::Tag.tag_summary_all.sort_by(&:name)
  end

  def show
    @tags = Tags::Tag.all.select {_1.canonical_tag_name == params[:id] }.sort_by{ Date.parse(_1.date) }.reverse
  end
end
