class MoviesNews::Article
  attr_reader :name, :author

  @@all = []

  def initialize(name, author = nil)
    @name = name
    self.author = author unless author.nil?
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self unless @@all.detect { |article| article.name == self }
    # @@all << self if @@all.find { |name| self.name  != name }
    # @@all << self
    # binding.pry
  end

  def self.create(name)
    article = self.new(name)
    article.save if @@all.find { |article| name  != article }
    article
  end

  def author=(author)
    @author = author
    author.add_article(self) unless author.articles.include?(self)
  end

  def self.find_by_name(name)
    binding.pry
    self.all.detect { |x| x.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name).nil? ? self.create(name) : self.find_by_name(name)
  end
end
