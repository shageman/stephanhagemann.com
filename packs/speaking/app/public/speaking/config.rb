class Speaking::Config
  ROUTE_FILE_NAME = "speaking"

  # Entrypoint helper for speaking
  def self.entrypoint_path(book_name = nil)
    Rails.application.routes.url_helpers.speaking_index_path
  end
end
