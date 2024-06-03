# typed: strict
class Speaking::Api
  extend T::Sig
  extend UnsurprisinglyDrawable::Routable

  # Entrypoint helper for speaking
  sig { returns(String) }
  def self.entrypoint_path
    Rails.application.routes.url_helpers.speaking_index_path
  end

  # Return route file name
  sig { override.returns(String) }
  def self.route_file_name
    "speaking"
  end
end
