class MoviesNews::Author
  extend MoviesNews::MovieModule::ClassMethods
  include MoviesNews::MovieModule::InstanceMethods

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

  def add_article_to_author(article)
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
