class ApplicationController < ActionController::Base
  before_action :load_markdown_renderer
  before_action :set_layout_params

  # Adds a markdown renderer instance variable, which allows variables to be rendered from a markdown source.
  # Use in view like so: `raw @markdown.render(@some_markdown_content)`
  def load_markdown_renderer
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      autolink: true, # naked links become HTML links
      highlight: true, # == for <mark> highlighting
      footnotes: true, # links to footnotes work with [^1]
      lax_spacing: true, # don't require empty lines around HTML, just newlines
    })
  end

  # Sets the default Layout param
  def set_layout_params
    @layout_params = RailsShims::LayoutParams.new
  end
end
