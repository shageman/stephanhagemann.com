scope "agile_landscape" do
  resources "/", only: [:index], controller: "agile_landscape/agile_landscape", as: "agile_landscape"

  get "/versions/:version/entries/:id", to: "agile_landscape/agile_landscape#show_entry", as: "agile_landscape_entry"
  get "/versions/:version/frameworks/:id", to: "agile_landscape/agile_landscape#show_framework", as: "agile_landscape_framework"
end
