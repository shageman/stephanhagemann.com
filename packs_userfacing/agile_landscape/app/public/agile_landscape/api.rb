# typed: strict
class AgileLandscape::Api
  extend T::Sig
  extend Routable

  # Entrypoint helper for the agile landscape project
  sig { returns(String) }
  def self.entrypoint_path
    Rails.application.routes.url_helpers.agile_landscape_index_path
  end

  # Return route file name
  sig { override.returns(String) }
  def self.route_file_name
    "agile_landscape"
  end
end
