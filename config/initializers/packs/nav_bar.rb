Rails.application.config.to_prepare do
  NavBar::Menu.add_item(section: "root", path: -> { "/" }, text: "Stephan Hagemann", class_name: "home")

  NavBar::Menu.add_item(section: "posts", path: -> {Posts::Config.entrypoint_path }, text: "Posts")
  NavBar::Menu.add_item(section: "books", path: -> {Books::Config.entrypoint_path }, text: "Books")
  NavBar::Menu.add_item(section: "speaking", path: -> {Speaking::Config.entrypoint_path }, text: "Speaking")
  NavBar::Menu.add_item(section: "services", path: -> {Services::Config.entrypoint_path }, text: "Services")
  NavBar::Menu.add_item(section: "tags", path: -> {Tags::Config.entrypoint_path }, text: "Tags")
end
