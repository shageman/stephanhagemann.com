# typed: strict
Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  draw(NavBar::Api::ROUTE_FILE_NAME) if defined?(NavBar::Api)
  draw(Contact::Api::ROUTE_FILE_NAME) if defined?(Contact::Api)
  draw(Tags::Api::ROUTE_FILE_NAME) if defined?(Tags::Api)

  draw(Root::Api::ROUTE_FILE_NAME) if defined?(Root::Api)

  draw(AgileLandscape::Api::ROUTE_FILE_NAME) if defined?(AgileLandscape::Api)
  draw(Books::Api::ROUTE_FILE_NAME) if defined?(Books::Api)
  draw(Posts::Api::ROUTE_FILE_NAME) if defined?(Posts::Api)
  draw(Services::Api::ROUTE_FILE_NAME) if defined?(Services::Api)
  draw(Speaking::Api::ROUTE_FILE_NAME) if defined?(Speaking::Api)
end
