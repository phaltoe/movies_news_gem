class MoviesNews::Scrape

  attr_accessor :stories

  def self.get_page
    page = "http://www.comingsoon.net/hub/movie-news"
    scraped_page = Nokogiri::HTML(open(page))

    @stories = []

    scraped_page.css(".listed-article-content").each do |stories|
      url = stories.css("header a").attribute("href").value
      content = Nokogiri::HTML(open(url))

      content.css(".article-content").each do |articles|
        @stories << {
          :article => articles.css("p").text,
          :headline => stories.css("header a").text,
          :author => stories.css(".listed-article-author").text,
          :time_published => stories.css(".article-date.article-date-time").text,
          :description => stories.css(".listed-article-excerpt").text
        }
      end
    end
    @stories
  end

  def self.stories
    @stories
  end
end
