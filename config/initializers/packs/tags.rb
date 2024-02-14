Rails.application.config.to_prepare do
  Posts::Api.all_posts.each do |post|
    post.tags.each do |tag|
      Tags::Api.add_tagable(name: tag, path: -> { Posts::Api.entrypoint_path(post) }, title: post.title, date: post.date)
    end
  end
end
