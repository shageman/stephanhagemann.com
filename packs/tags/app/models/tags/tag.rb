require "yaml"

class Tags::Tag < ActiveFile::Base
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

  use_multiple_files
  set_filenames *Dir.glob(File.expand_path(File.join(__FILE__, "../data/*.md"))).sort.select { |f| File.file?(f) }

  def reading_time
    wpm = 265
    word_count = content.split.length
    (word_count.to_f / wpm).round
  end

  def filtered_tags
    excluded_tags = ["all", "nav", "post", "tags"]
    tags.reject { excluded_tags.include?(_1) }
  end

  def tag_tally
    Tags::Tag.all.flat_map(&:tags).tally
  end

  def to_param
    slug
  end

  def backlinks
#     const tagsLinkRegExp = /https:\/\/stephanhagemann\.com\/tags\/([-a-zA-Z0-9()@:%_\+.~#?&//=]*)/g

# module.exports = {
#     tags: "tags",
#     layout: "layouts/post.njk",
#     eleventyComputed: {
#         backlinks: (data) => {
#             const tags = data.collections.tags;

#             let backlinks = [];

#             for(const otherNote of tags) {
#                 const noteContent = otherNote.template.frontMatter.content;
#                 const outboundLinks = (noteContent.match(tagsLinkRegExp) || []);

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
end
