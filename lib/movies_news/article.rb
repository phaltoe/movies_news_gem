class MoviesNews::Article
  extend MoviesNews::MovieModule::ClassMethods
  include MoviesNews::MovieModule::InstanceMethods
  
  attr_accessor :title, :author, :story

  @@articles = []

  def initialize(title, author = nil, story = nil)
    @title = title
    self.author = author unless author.nil?
  end

  def self.all
    @@articles
  end

  def self.create_articles_from_array(array)
    array.each do |article|
      title = article[:title]
      author = article[:author]
      story = article[:story]

      new_author = MoviesNews::Author.find_or_create_by_name(author)

      new_article = self.new(title, new_author)
      new_article.story = story
      new_article.save
    end
  end

  def self.get_articles
    self.create_articles_from_array(MoviesNews::Scrape.make_articles)
  end
end
