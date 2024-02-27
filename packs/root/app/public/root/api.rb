class Root::Api
  ROUTE_FILE_NAME = "root"

  # Entrypoint helper for the agile landscape project
  def self.entrypoint_path
    Rails.application.routes.url_helpers.root_path
  end
end
