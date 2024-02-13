class Posts::Config
  ROUTE_FILE_NAME = "posts"

  # Entrypoint helper for posts
  def self.entrypoint_path
    Rails.application.routes.url_helpers.posts_path
  end
end
