# typed: strict
class Services::Api
  extend T::Sig

  ROUTE_FILE_NAME = "services"

  # Entrypoint helper
  sig { returns(String) }
  def self.entrypoint_path
    Rails.application.routes.url_helpers.services_path
  end
end
