describe 'Findable Articles' do
  describe ".find_by_name" do
    it 'finds an article instance in @@all by the name property of the article' do
      article = MoviesNews::Article.create("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
      article.save

      expect(MoviesNews::Article.find_by_name("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")).to eq(article)
    end
  end

  describe ".find_or_create_by_name" do
    it 'finds or creates an article by name maintaining uniqueness of objects by their name property' do
      article_1 = MoviesNews::Article.find_or_create_by_name("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")
      article_2 = MoviesNews::Article.find_or_create_by_name("Nickelodeon Star Isabela Moner Eyed for Transformers 5 Role")

      expect(article_1).to eq(article_2)
    end
  end
end
