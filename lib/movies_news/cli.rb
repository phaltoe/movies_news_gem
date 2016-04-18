class MoviesNews::CLI

  def call
    introduction
    get_articles
  end

  def introduction
    puts "Check out the latest new movies coming soon to theaters & video games to come to market."
    puts ""
  end

  def get_articles
    puts "These are our latest articles:"
    puts ""
    MoviesNews::Article.get_articles
    # MoviesNews::Article.all.each_with_index do |article, index|
    #   puts "#{index} - #{article.name}"
    # end
  end
end
