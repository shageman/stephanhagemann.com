class Speaking::Api
  ROUTE_FILE_NAME = "speaking"

  # Entrypoint helper for speaking
  def self.entrypoint_path
    Rails.application.routes.url_helpers.speaking_index_path
  end
end
