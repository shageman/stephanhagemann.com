Rails.application.config.to_prepare do
  Posts::Post.all.each do |post|
    links = []
    post.content.scan(/\[.*?\]\(([^\)]*?)\)/) do |match|
      next if match[0].starts_with?("http")
      next if match[0].starts_with?("/images")
      links << match[0]
    end

    Backlinks::Api.register_links_for(-> { Posts::Api.entrypoint_path(post.slug) }, post.title, links)
  end
end
