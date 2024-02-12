Rails.application.routes.draw do
  draw(:rails_shims)
  draw(:root)

  draw(:books)
  draw(:speaking)
end
