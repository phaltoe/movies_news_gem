class MoviesNews::Article
  attr_reader :author
  attr_accessor :name, :author, :content, :movie, :time_published, :headline

  @@articles = []

  def initialize(name, author = nil)
    @name = name
    self.author = author unless author.nil?
  end

  def self.all
    @@articles
  end

  def save
    @@articles << self unless MoviesNews::Article.all.detect {|a| a.name == self.name }
  end

  def self.destroy_all
    self.all.clear
  end


  def self.create(name)
    article = self.new(name)
    article.save
    article
  end

  def author=(author)
    @author = author
    author.add_article(self) unless author.articles.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect { |x| x.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
