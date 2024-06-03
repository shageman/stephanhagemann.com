# typed: strict
class Services::Api
  extend T::Sig
  extend UnsurprisinglyDrawable::Routable

  # Entrypoint helper
  sig { returns(String) }
  def self.entrypoint_path
    Rails.application.routes.url_helpers.services_path
  end

  # Return route file name
  sig { override.returns(String) }
  def self.route_file_name
    "services"
  end
end
