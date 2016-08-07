require 'spec_helper'

describe "Articles and Authors - " do
  context 'Authors have many articles' do
    it 'initializes with a articles property set to an empty array' do
      author = MoviesNews::Author.new("Spencer Perry")

      expect(author.articles).to eq([])
    end

    it 'can push a article into the articles collection' do
      author = MoviesNews::Author.new("Spencer Perry")
      article = MoviesNews::Article.new("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")

      author.articles << article
      expect(author.articles).to include(article)
    end
  end
end
