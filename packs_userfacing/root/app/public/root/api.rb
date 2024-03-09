# typed: strict
class Root::Api
  extend T::Sig
  extend Routable

  # Entrypoint helper for the agile landscape project
  sig { returns(String) }
  def self.entrypoint_path
    Rails.application.routes.url_helpers.root_path
  end

  # Return route file name
  sig { override.returns(String) }
  def self.route_file_name
    "root"
  end
end
