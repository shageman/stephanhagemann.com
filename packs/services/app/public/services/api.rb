class Services::Api
  ROUTE_FILE_NAME = "services"

  # Entrypoint helper
  def self.entrypoint_path
    Rails.application.routes.url_helpers.services_path
  end
end
