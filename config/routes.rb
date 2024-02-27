# typed: strict
Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  draw(Root::Api::ROUTE_FILE_NAME)
  draw(NavBar::Api::ROUTE_FILE_NAME)

  draw(AgileLandscape::Api::ROUTE_FILE_NAME)
  draw(Books::Api::ROUTE_FILE_NAME)
  draw(Contact::Api::ROUTE_FILE_NAME)
  draw(Posts::Api::ROUTE_FILE_NAME)
  draw(Services::Api::ROUTE_FILE_NAME)
  draw(Speaking::Api::ROUTE_FILE_NAME)
  draw(Tags::Api::ROUTE_FILE_NAME)
end
