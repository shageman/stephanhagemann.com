class RailsShims::RendererWithEmphasis < Redcarpet::Render::HTML
  def preprocess(full_document)
    full_document.gsub(/==([^=]+)==/, '<mark>\1</mark>')
  end
end
