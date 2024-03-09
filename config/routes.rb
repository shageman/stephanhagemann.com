# typed: strict

require_relative "../packs_utility/routable/app/public/action_dispatch/routing/mapper/resources.rb"

Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  draw_routes_with_unsurprising_namespacing(-> { NavBar::Api }, ["/more"])
  draw_routes_with_unsurprising_namespacing(-> { Contact::Api })
  draw_routes_with_unsurprising_namespacing(-> { Tags::Api })

  draw_routes_with_unsurprising_namespacing(-> { Root::Api }, ["/"])

  draw_routes_with_unsurprising_namespacing(-> { AgileLandscape::Api })
  draw_routes_with_unsurprising_namespacing(-> { Books::Api })
  draw_routes_with_unsurprising_namespacing(-> { Posts::Api })
  draw_routes_with_unsurprising_namespacing(-> { Services::Api })
  draw_routes_with_unsurprising_namespacing(-> { Speaking::Api })
end
