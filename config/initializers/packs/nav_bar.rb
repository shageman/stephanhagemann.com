Rails.application.config.to_prepare do
  NavBar::Menu.add_item(section: "root", path: -> { "/" }, text: "Stephan Hagemann", class_name: "home")

  NavBar::Menu.add_item(section: "posts", path: -> {Posts::Config.entrypoint_path }, text: "posts")
  NavBar::Menu.add_item(section: "books", path: -> {Books::Config.entrypoint_path }, text: "books")
  NavBar::Menu.add_item(section: "speaking", path: -> {Speaking::Config.entrypoint_path }, text: "speaking")
  NavBar::Menu.add_item(section: "services", path: -> {Services::Config.entrypoint_path }, text: "Services")
end
