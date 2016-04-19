class MoviesNews::Article
  attr_accessor :title, :author, :story

  @@articles = []

  def initialize(title, author = nil, story = nil)
    @title = title
    self.author = author unless author.nil?
  end

  def self.all
    @@articles
  end

  def save
    @@articles << self unless MoviesNews::Article.all.detect {|a| a.title == self.title }
  end

  def self.destroy_all
    self.all.clear
  end


  def self.create(title)
    article = self.new(title)
    article.save
    article
  end

  def author=(author)
    @author = author
    author.add_article(self) unless author.articles.include?(self)
  end

  def self.find_by_title(title)
    self.all.detect { |x| x.title == title }
  end

  def self.find_or_create_by_title(title)
    self.find_by_title(title) || self.create(title)
  end

  def self.create_from_array(array)
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
    self.create_from_array(MoviesNews::Scrape.make_articles)
    @@articles
  end
end
