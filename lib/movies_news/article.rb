class MoviesNews::Article
  attr_reader :author
  attr_accessor :name

  @@all = []

  def initialize(name, author = nil)
    @name = name
    self.author = author unless author.nil?
  end

  def self.all
    @@all
  end

  def save
    # @@all << self unless @@all.detect { |article| article.name == self.name}

    unless self.class.all.detect { |article| article.name == self.name}
      @@all << self
    end
  end

  def self.destroy_all
    self.all.clear
  end

  # def add_article(article)
  #   article.author = self if article.author.nil?
  #   self.articles << article unless self.articles.include?(article)
  # end



  def self.create(name)
    # article = self.new(name)
    article = self.find_or_create_by_name(name)
    # binding.pry
    # article.save
    article
  end

  def author=(author)
    @author = author
    author.add_article(self) unless author.articles.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect { |x| x.name == name }
    # binding.pry
  end

  def self.find_or_create_by_name(name)
    unless self.all.detect { |article| article.name == name}
      article = MoviesNews::Article.new(name)
    end
  end

  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name).nil? ? self.create(name) : self.find_by_name(name)
  # end
end
