require "yaml"

class Posts::Post < ActiveFile::Base
  use_multiple_files
  set_filenames *Dir.glob(File.expand_path(File.join(__FILE__, "../data/*.md"))).sort.select { |f| File.file?(f) }

  def self.load_file
    result = []

    filenames.each_with_index do |fn, id|
      markdown_content = File.read(fn)
      if markdown_content =~ /\A---\n.*?\n---\n/m
        header_info = YAML.load($&)
        markdown_content = $'
      end

      entry = {
        id: id,
        slug: File.basename(fn, ".*"),
        filename: fn,
        date: fn.match(/\b(\d{4}-\d{2}-\d{2})\b/)[1],
        header: nil,
        title: header_info["title"],
        teaser: markdown_content.split("<!--more-->")[0],
        content: markdown_content,
        tags: header_info["tags"],
      }

      result << entry
    end

    result
  end

  def self.extension
    "md"
  end

  def reading_time
    wpm = 265
    word_count = content.split.length
    (word_count.to_f / wpm).round
  end

  def to_param
    slug
  end

  def date
    "#{self.read_attribute(:date)}T00:00:00.000Z"
  end

  def link_title
    header || title
  end

  def backlinks
#     const postsLinkRegExp = /https:\/\/stephanhagemann\.com\/posts\/([-a-zA-Z0-9()@:%_\+.~#?&//=]*)/g

# module.exports = {
#     tags: "posts",
#     layout: "layouts/post.njk",
#     eleventyComputed: {
#         backlinks: (data) => {
#             const posts = data.collections.posts;

#             let backlinks = [];

#             for(const otherNote of posts) {
#                 const noteContent = otherNote.template.frontMatter.content;
#                 const outboundLinks = (noteContent.match(postsLinkRegExp) || []);

#                 // If the other note links here, return related info
#                 if(outboundLinks.some(link => { return link.replace(/\/$/, "").endsWith(data.page.url.replace(/\/$/, "")) } )) {
#                     backlinks.push({
#                         url: otherNote.url,
#                         title: otherNote.data.title,
#                     })
#                 }
#             }
#             return backlinks;
#         }
#     }
# }
  end

  def share_link
    share_text = "#{link_title} by @shageman"
    share_url = "https://stephanhagemann.com/posts/#{slug}"
    return "https://twitter.com/intent/tweet/?text=#{URI::Parser.new.escape(share_text)}&url=#{URI::Parser.new.escape(share_url)}"
  end

  def discussion_link
    post_url = "https://stephanhagemann.com/posts/#{slug}"
    "https://twitter.com/search?f=tweets&src=typd&q=#{URI::Parser.new.escape(post_url)}"
  end
end
