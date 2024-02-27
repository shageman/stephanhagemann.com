# typed: strict
class ApplicationController < ActionController::Base
  extend T::Sig

  before_action :load_markdown_renderer
  before_action :set_layout_params

  # Adds a markdown renderer instance variable, which allows variables to be rendered from a markdown source.
  # Use in view like so: `raw @markdown.render(@some_markdown_content)`
  sig { void }
  def load_markdown_renderer
    @markdown = T.let(Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      autolink: true, # naked links become HTML links
      highlight: true, # == for <mark> highlighting
      footnotes: true, # links to footnotes work with [^1]
      lax_spacing: true, # don't require empty lines around HTML, just newlines
    }), T.nilable(Redcarpet::Markdown))
  end

  # Sets the default Layout param
  sig { void }
  def set_layout_params
    @layout_params = T.let(RailsShims::LayoutParams.new, T.nilable(RailsShims::LayoutParams))
  end
end
