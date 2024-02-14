Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  draw(Root::Config::ROUTE_FILE_NAME)
  draw(NavBar::Config::ROUTE_FILE_NAME)

  draw(Books::Config::ROUTE_FILE_NAME)
  draw(Contact::Config::ROUTE_FILE_NAME)
  draw(Posts::Config::ROUTE_FILE_NAME)
  draw(Speaking::Config::ROUTE_FILE_NAME)
  draw(Services::Config::ROUTE_FILE_NAME)
  draw(Tags::Config::ROUTE_FILE_NAME)
end
