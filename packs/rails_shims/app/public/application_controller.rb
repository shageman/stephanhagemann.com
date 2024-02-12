class ApplicationController < ActionController::Base
  before_action :load_markdown_renderer

  def load_markdown_renderer
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
  end
end
