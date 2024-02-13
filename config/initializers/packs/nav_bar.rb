Rails.application.config.to_prepare do
  NavBar::MenuItems.instance.<<(section: "root", path: -> { "/" }, text: "Stephan Hagemann", class_name: "home")

  NavBar::MenuItems.instance.<<(section: "posts", path: -> {Posts::Config.entrypoint_path }, text: "posts")
  NavBar::MenuItems.instance.<<(section: "books", path: -> {Books::Config.entrypoint_path }, text: "books")
  NavBar::MenuItems.instance.<<(section: "speaking", path: -> {Speaking::Config.entrypoint_path }, text: "speaking")
  NavBar::MenuItems.instance.<<(section: "more", path: -> { "" }, text: "...and more")
end