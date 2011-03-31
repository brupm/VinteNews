xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "VinteNews"
    xml.description "O VinteNews recebe links da comunidade de programadores de língua Portuguesa."
    xml.link comments_url

    for comment in @comments
      xml.item do
        xml.title truncate(comment.body, :length => 40) unless comment.body.nil?
        xml.pubDate comment.created_at.to_s(:rfc822)
        xml.link comment_url(comment)
        xml.guid comment_url(comment)
      end
    end
  end
end