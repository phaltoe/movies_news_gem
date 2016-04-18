require 'spec_helper'

describe "Author Basics" do
  describe '#initialize with #name' do
    it 'accepts a name for the author' do
      author = MoviesNews::Author.new("Spencer Perry")
      expect(author.name).to eq("Spencer Perry")
    end
  end

  describe '.all' do
    it 'returns the class variable @@all' do
      MoviesNews::Author.class_variable_set(:@@all, [])

      expect(MoviesNews::Author.all).to match_array([])
    end
  end


  describe '#save' do
    it 'adds the author instance to the @@all class variable' do
      author = MoviesNews::Author.new("Spencer Perry")

      author.save

      expect(MoviesNews::Author.all).to include(author)
    end
  end

  describe '.destroy_all' do
    it 'resets the @@all class variable to an empty array' do
      MoviesNews::Author.class_variable_set(:@@all, ["MoviesNews::Author"])

      MoviesNews::Author.destroy_all
      expect(MoviesNews::Author.all).to match_array([])
    end
  end


  describe '.create' do
    it 'initializes and saves the author' do
      author = MoviesNews::Author.create("Spencer Perry")

      expect(MoviesNews::Author.all).to include(author)
    end
  end
end
