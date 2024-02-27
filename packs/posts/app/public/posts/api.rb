# typed: strict
class Posts::Api
  extend T::Sig

  ROUTE_FILE_NAME = "posts"

  # Entrypoint helper for posts. Get index of all posts or, wtih param, get post page
  sig { params(post_slug: T.nilable(String)).returns(String) }
  def self.entrypoint_path(post_slug = nil)
    if post_slug
      Rails.application.routes.url_helpers.post_path(post_slug)
    else
      Rails.application.routes.url_helpers.posts_path
    end
  end
end
