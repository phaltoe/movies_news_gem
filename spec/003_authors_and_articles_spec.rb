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

  context 'Articles belong to an Author - ' do
    describe '#author=' do
      it 'accepts an author for the article' do
        article = MoviesNews::Article.new("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
        author = MoviesNews::Author.new("Spencer Perry")
        article.author = author

        expect(article.author).to eq(author)
      end

      # it 'enforces the type of object assigned to Author'

      it 'adds the article to the author\'s articles' do
        article = MoviesNews::Article.new("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
        author = MoviesNews::Author.new("Spencer Perry")
        article.author = author

        expect(author.articles).to include(article)
      end
    end
  end

  context 'adding an article to an author' do
    describe '#add_article' do
      it 'adds the article to the author\'s article collection' do
        article = MoviesNews::Article.new("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
        author = MoviesNews::Author.new("Spencer Perry")
        author.add_article_to_author(article)

        expect(author.articles).to include(article)
      end
      it 'assigns the author to the article' do
        article = MoviesNews::Article.new("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
        author = MoviesNews::Author.new("Spencer Perry")
        author.add_article_to_author(article)

        expect(article.author).to eq(author)
      end
      it 'does not assign the author to the article if the article already has the author' do
        article = MoviesNews::Article.new("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
        author = MoviesNews::Author.new("Spencer Perry")

        article.author = author

        expect(article).to_not receive(:author=)

        author.add_article(article)
      end

      it 'does not add the article to the author\'s article collection if the author already has the article' do
        article = MoviesNews::Article.new("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
        author = MoviesNews::Author.new("Spencer Perry")

        author.add_article_to_author(article)
        author.add_article_to_author(article)

        expect(author.articles).to include(article)
        expect(author.articles.size).to eq(1)
      end
    end

    describe 'Article#author=' do
      it 'uses add_article to add the article to the author\'s collection' do
        article = MoviesNews::Article.new("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
        author = MoviesNews::Author.new("Spencer Perry")

        expect(author).to receive(:add_article)

        article.author = author
      end
    end
  end

  context 'initializing an article with an author - ' do
    it 'new articles accept an optional argument for the author' do
      author = MoviesNews::Author.new("Spencer Perry")
      article = MoviesNews::Article.new("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role", author)

      expect(author.articles).to include(article)
      expect(article.author).to eq(author)
    end
  end
end
