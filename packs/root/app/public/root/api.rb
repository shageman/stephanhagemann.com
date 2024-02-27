# typed: strict
class Root::Api
  extend T::Sig

  ROUTE_FILE_NAME = "root"

  # Entrypoint helper for the agile landscape project
  sig { returns(String) }
  def self.entrypoint_path
    Rails.application.routes.url_helpers.root_path
  end
end
