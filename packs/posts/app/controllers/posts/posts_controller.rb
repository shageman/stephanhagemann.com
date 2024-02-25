class Posts::PostsController < ApplicationController
  def index
    all_posts = (Posts::Post.all.to_a + Posts::MastodonPost.where(in_reply_to_id: nil).to_a)
    @posts = all_posts.sort_by { Date.parse(_1.date) }.reverse
  end

  def show
    @post = Posts::Post.find_by_slug(params[:id]) || Posts::MastodonPost.find_by_slug(params[:id])
    if @post.is_a?(Posts::Post)
      @likes =
        Posts::Webmention.where(:"wm-target" => "https://stephanhagemann.com/posts/#{@post.slug}/", :"wm-property" => "like-of").to_a +
        Posts::Webmention.where(:"wm-target" => "https://stephanhagemann.com/posts/#{@post.slug}", :"wm-property" => "like-of").to_a

      @reposts =
        Posts::Webmention.where(:"wm-target" => "https://stephanhagemann.com/posts/#{@post.slug}/", :"wm-property" => "repost-of").to_a +
        Posts::Webmention.where(:"wm-target" => "https://stephanhagemann.com/posts/#{@post.slug}", :"wm-property" => "repost-of").to_a

      replies =
        Posts::Webmention.where(:"wm-target" => "https://stephanhagemann.com/posts/#{@post.slug}/", :"wm-property" => ["mention-of", "in-reply-to"]).to_a +
        Posts::Webmention.where(:"wm-target" => "https://stephanhagemann.com/posts/#{@post.slug}", :"wm-property" => ["mention-of", "in-reply-to"]).to_a
      @replies = replies.sort_by { Date.parse(_1[:published]) }.reverse
    elsif @post.is_a?(Posts::MastodonPost)
      @related_posts = @post.context && @post.context["descendants"]
    end
  end
end
