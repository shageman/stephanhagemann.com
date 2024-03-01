# typed: strict
Rails.application.config.to_prepare do
  Rails.application.reload_routes!

  Posts::Post.all.each do |post|
    post.tags.each do |tag|
      success = Tags::Api.add_taggable(name: tag, path: Posts::Api.entrypoint_path(post.slug), title: post.title, date: post.date)
      case success
      when TrueClass
        Rails.logger.info "Tag registered for blog post"
      when Tags::Api::TagParametersInvalid
        raise "Tag creation failed due to bad params: #{success.message}"
      else
        T.absurd(success)
      end
    end
  end

  Posts::MastodonPost.all.each do |post|
    post.tags.each do |tag|
      success = Tags::Api.add_taggable(name: tag, path: Posts::Api.entrypoint_path(post.slug), title: post.title, date: post.date)
      case success
      when TrueClass
        Rails.logger.info "Tag registered for mastodon post"
      when Tags::Api::TagParametersInvalid
        raise "Tag creation failed due to bad params: #{success.message}"
      else
        T.absurd(success)
      end
    end
  end
end
