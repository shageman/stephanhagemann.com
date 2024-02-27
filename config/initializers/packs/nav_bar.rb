Rails.application.config.to_prepare do
  Rails.application.reload_routes!

  NavBar::Menu.add_item(section: "root", path:  Root::Api.entrypoint_path, text: "Stephan Hagemann", class_name: "home")

  NavBar::Menu.add_item(section: "posts", path: Posts::Api.entrypoint_path, text: "Posts")
  NavBar::Menu.add_item(section: "books", path: Books::Api.entrypoint_path, text: "Books")
  NavBar::Menu.add_item(section: "speaking", path: Speaking::Api.entrypoint_path, text: "Speaking")
  NavBar::Menu.add_item(section: "services", path: Services::Api.entrypoint_path, text: "Services")
  NavBar::Menu.add_item(section: "tags", path: Tags::Api.entrypoint_path, text: "Tags")
  NavBar::Menu.add_item(section: "agile_landscape", path: AgileLandscape::Api.entrypoint_path, text: "Agile Landscape")
end
