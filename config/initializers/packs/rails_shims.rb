Rails.application.config.to_prepare do
  RailsShims::MenuItems.instance.<<(section: 'root', path: -> { '/' }, text: 'Stephan Hagemann', class_name: 'home')

  RailsShims::MenuItems.instance.<<(section: 'posts', path: -> {Posts::Config.entrypoint_path }, text: 'posts')
  RailsShims::MenuItems.instance.<<(section: 'books', path: -> {Books::Config.entrypoint_path }, text: 'books')
  RailsShims::MenuItems.instance.<<(section: 'speaking', path: -> {Speaking::Config.entrypoint_path }, text: 'speaking')
  RailsShims::MenuItems.instance.<<(section: 'more', path: -> { '' }, text: '...and more')
end