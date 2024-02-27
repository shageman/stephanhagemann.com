# typed: strict
Rails.application.config.to_prepare do
  Rails.application.reload_routes!

  NavBar::Menu.add_item(section: "root", path: Root::Api.entrypoint_path, text: "Stephan Hagemann", class_name: "home") if defined?(Root::Api)

  NavBar::Menu.add_item(section: "posts", path: Posts::Api.entrypoint_path, text: "Posts") if defined?(Posts::Api)
  NavBar::Menu.add_item(section: "books", path: Books::Api.entrypoint_path, text: "Books") if defined?(Books::Api)
  NavBar::Menu.add_item(section: "speaking", path: Speaking::Api.entrypoint_path, text: "Speaking") if defined?(Speaking::Api)
  NavBar::Menu.add_item(section: "services", path: Services::Api.entrypoint_path, text: "Services") if defined?(Services::Api)
  NavBar::Menu.add_item(section: "tags", path: Tags::Api.entrypoint_path, text: "Tags") if defined?(Tags::Api)
  NavBar::Menu.add_item(section: "agile_landscape", path: AgileLandscape::Api.entrypoint_path, text: "Agile Landscape") if defined?(AgileLandscape::Api)
end
