# typed: strict
Rails.application.config.to_prepare do
  Rails.application.reload_routes!

  Posts::Post.all.each do |post|
    links = []
    post.content.scan(/\[.*?\]\(([^\)]*?)\)/) do |match|
      next if match[0].starts_with?("http")
      next if match[0].starts_with?("/images")
      links << match[0]
    end

    success = Backlinks::Api.register_links_for(Posts::Api.entrypoint_path(post.slug), post.title, links)
    case success
    when TrueClass
      Rails.logger.info "Backlink registered for blog post"
    when Backlinks::Api::BacklinkParametersInvalid
      raise "Backlink creation failed due to bad params: #{success.message}"
    else
      T.absurd(success)
    end
  end
end
