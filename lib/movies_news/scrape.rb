class MoviesNews::Scrape


  def self.get_page
    Nokogiri::HTML(open("http://www.comingsoon.net/hub/movie-news"))
  end


  def self.make_articles
    get_page.css(".listed-article-content").each do |stories|
      url = stories.css("header a").attribute("href").value
      content = Nokogiri::HTML(open(url))

      content.css(".article-content").each do |articles|
        content.css(".tags-container").each do |tag|
          name = stories.css("header a").text

          author = stories.css(".listed-article-author").text
          new_author = MoviesNews::Author.find_or_create_by_name(author)

          article = MoviesNews::Article.new(name, new_author)
          # article.movie = tag.css("a").first.text
          article.content = articles.css("p").text
          # article.time_published = stories.css(".article-date.article-date-time").text
          # binding.pry
        end
      end
    end
  end
end
