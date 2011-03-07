module PostsHelper
  def post_link_path(post)
    "#{ post.url.blank? ? post_url(post) : post.url }"
  end

  def post_link_text(post)
    post.url.blank? ? "" : "(#{post.url.gsub("http://", "")})"
  end
  
end
