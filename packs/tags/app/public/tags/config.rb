class Tags::Config
  ROUTE_FILE_NAME = "tags"

  # Entrypoint helper for tags
  def self.entrypoint_path
    Rails.application.routes.url_helpers.tags_path
  end
end
