
class MoviesNews::Author

  attr_accessor :articles
  attr_reader :name

  @@all = []
  def initialize(name)
    @name = name
    @articles = []
  end

  def self.all
    @@all
  end

  def save
   @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    author = self.new(name)
    author.save
    author
  end

  def add_article(article)
    article.author = self if article.author.nil?
    self.articles << article unless self.articles.include?(article)
  end

  def self.find_by_name(name)
    self.all.detect { |x| x.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
