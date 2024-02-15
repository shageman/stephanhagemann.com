class AgileLandscape::Api
  ROUTE_FILE_NAME = "agile_landscapes"

  # Entrypoint helper for the agile landscape project
  def self.entrypoint_path
    Rails.application.routes.url_helpers.agile_landscape_index_path 
  end
end
