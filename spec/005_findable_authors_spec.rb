describe 'Findable Authors' do
  describe ".find_by_name" do
    it 'finds an author instance in @@all by the name property of the author' do
      author = MoviesNews::Author.new("Spencer Perry")
      author.save

      expect(MoviesNews::Author.find_by_name("Spencer Perry")).to eq(author)
    end
  end

  describe ".find_or_create_by_name" do
    it 'finds or creates an author by name maintaining uniqueness of objects by name property' do
      author_1 = MoviesNews::Author.find_or_create_by_name("Spencer Perry")
      author_2 = MoviesNews::Author.find_or_create_by_name("Spencer Perry")

      expect(author_1).to eq(author_2)
    end
  end
end
