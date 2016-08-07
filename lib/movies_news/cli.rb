require 'colorize'

class MoviesNews::CLI

  def call
    introduction
    get_article
    start
  end

  def introduction
    puts "Welcome to the MoviesNews!"
    puts ""
    puts "Check out the latest new movies coming soon to theaters & video games to come to market.".colorize(:blue)
    puts ""
    puts "Please be patient while we load the articles..."
  end

  def get_article
    MoviesNews::Article.get_articles
    # MoviesNews::Article.create_articles_from_array(MoviesNews::Scrape.make_articles)
  end

  def display_articles
    articles = MoviesNews::Article.all
    puts "These are our latest articles:"
    puts ""
    articles.each_with_index do |article, index|
      puts "#{index + 1}".colorize(:blue) + " #{article.title}".colorize(:red)
      puts "   written by:" + " #{article.author.name.gsub(/^\s/, "")}".colorize(:blue)
    end
  end

  def display_single_article(user_pick)
    articles = MoviesNews::Article.all
    puts "::::".colorize(:red) + "#{articles[user_pick - 1].title}".colorize(:blue) +"::::".colorize(:red)
    puts ""
    puts "#{articles[user_pick - 1].story}\n" + "\n" "Written by:" + " #{articles[user_pick - 1].author.name}".colorize(:blue)
    puts ""
  end

  def start
    user_input = nil
    until user_input == "n"
      display_articles
      user_pick = nil
      puts ""
      puts "Please enter the number for the article you want to read" + "(1-10)".colorize(:blue)
      puts ""
      user_pick = gets.strip.to_i

      if user_pick > 0 && user_pick <= 10 then
        display_single_article(user_pick)
      else
        puts "ERRRRRRRORRRRR! ".colorize(:red) + "Please user_pick a valid number" + "(1-10)".colorize(:blue)
        puts ""
        start
      end

      puts "Would you like to read another article?" +"(TYPE ANY KEY).".colorize(:blue) +  "In case you don't, please type" + " (N) ".colorize(:blue)
      user_input = gets.strip.downcase

      if user_input != "n"
        start
      else
        puts "Thank you!"
        exit
      end
    end
  end

end
