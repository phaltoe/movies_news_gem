class MoviesNews::Scrape
  def self.get_page
    Nokogiri::HTML(open("http://www.comingsoon.net/hub/movie-news"))
  end


  def self.make_articles

    @articles_list = []
    get_page.css(".listed-article-content").each do |stories|
      url = stories.css("header a").attribute("href").value
      content = Nokogiri::HTML(open(url))

      content.css(".article-content").each do |articles|
        @articles_list << {
          :title => stories.css("header a").text,
          :author => stories.css(".listed-article-author").text,
          :story => articles.css("p").text
        }
      end
    end
    @articles_list
  end
end
