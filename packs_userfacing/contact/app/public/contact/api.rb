# typed: strict
class Contact::Api
  extend T::Sig
  extend Routable

  # Exposes path helper to root of contact page. You can pass in a subject as a param
  sig { params(subject: String).returns(String) }
  def self.entrypoint_path(subject)
    Rails.application.routes.url_helpers.contact_index_path(subject: subject)
  end

  # Return route file name
  sig { override.returns(String) }
  def self.route_file_name
    "contact"
  end
end
