Rails.application.config.to_prepare do
  Posts::Config.all_posts.each do |post|
    post.tags.each do |tag|
      Tags::Config.add_tagable(name: tag, path: -> { Posts::Config.entrypoint_path(post) }, title: post.title, date: post.date)
    end
  end
end
