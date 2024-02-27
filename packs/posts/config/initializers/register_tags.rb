# typed: false
Rails.application.config.to_prepare do
  Rails.application.reload_routes!

  Posts::Post.all.each do |post|
    post.tags.each do |tag|
      Tags::Api.add_tagable(name: tag, path: Posts::Api.entrypoint_path(post.slug), title: post.title, date: post.date)
    end
  end

  Posts::MastodonPost.all.each do |post|
    post.tags.each do |tag|
      Tags::Api.add_tagable(name: tag, path: Posts::Api.entrypoint_path(post.slug), title: post.title, date: post.date)
    end
  end
end
