# typed: strict
class AgileLandscape::Api
  extend T::Sig

  ROUTE_FILE_NAME = "agile_landscape"

  # Entrypoint helper for the agile landscape project
  sig { returns(String) }
  def self.entrypoint_path
    Rails.application.routes.url_helpers.agile_landscape_index_path
  end
end
