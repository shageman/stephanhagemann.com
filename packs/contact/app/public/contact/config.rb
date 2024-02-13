class Contact::Config
  ROUTE_FILE_NAME = "contact"

  # Exposes path helper to root of contact page. You can pass in a subject as a param
  def self.entrypoint_path(subject)
    Rails.application.routes.url_helpers.contact_index_path(subject: subject)
  end
end