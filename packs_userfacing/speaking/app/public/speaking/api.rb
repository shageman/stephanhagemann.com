# typed: strict
class Speaking::Api
  extend T::Sig

  ROUTE_FILE_NAME = "speaking"

  # Entrypoint helper for speaking
  sig { returns(String) }
  def self.entrypoint_path
    Rails.application.routes.url_helpers.speaking_index_path
  end
end
