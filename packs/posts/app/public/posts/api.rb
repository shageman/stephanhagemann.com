class Posts::Api
  ROUTE_FILE_NAME = "posts"

  # Entrypoint helper for posts. Get index of all posts or, wtih param, get post page
  def self.entrypoint_path(post_slug = nil)
    if post_slug
      Rails.application.routes.url_helpers.post_path(post_slug)
    else
      Rails.application.routes.url_helpers.posts_path
    end
  end

  # Returns all posts
  def self.all_posts
    Posts::Post.all.to_a + Posts::MastodonPost.all.to_a
  end
end
