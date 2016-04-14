require 'spec_helper'

describe "Article Basics" do
  describe '#initialize with #name' do
    it 'accepts a name for the article' do
      article = MoviesNews::Article.new("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
      expect(article.name).to eq("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
    end
  end

  describe '.all' do
    it 'returns the class variable @@all' do
      MoviesNews::Article.class_variable_set(:@@all, [])

      expect(MoviesNews::Article.all).to match_array([])
    end
  end

  describe '#save' do
    it 'adds the article instance to the @@all class variable' do
      article = MoviesNews::Article.new("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")

      article.save

      expect(MoviesNews::Article.all).to include(article)
    end
  end

  describe '.create' do
    it 'initializes and saves the article' do
      article = MoviesNews::Article.create("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")

      expect(MoviesNews::Article.all).to include(article)
    end
  end
end