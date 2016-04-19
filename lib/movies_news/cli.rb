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
    articles = MoviesNews::Article.get_articles
    puts "These are our latest articles:"
    puts ""
    articles.each_with_index do |article, index|
      puts "#{index + 1}".colorize(:blue) + " #{article.title}.\n".colorize(:red) + "   written by:" + " #{article.author.name.gsub(/^\s/, "")}".colorize(:blue)
    end
  end

  def display(input)
    articles = MoviesNews::Article.all
    puts "::::".colorize(:red) + "#{articles[input - 1].title}".colorize(:blue) +"::::".colorize(:red)
    puts ""
    puts "#{articles[input - 1].story}\n" + "\n" "Written by:" + "#{articles[input - 1].author.name}".colorize(:blue)
    puts ""
  end

  def start
    user_input = nil
    until user_input == "n"
      input = nil
      puts ""
      puts "Please enter the number for the article you want to read" + "(1-10)".colorize(:blue)
      puts ""
      input = gets.strip.to_i

      if input > 0 && input <= 10 then
        display(input)
      else
        puts "Please input a valid number" + "(1-10)".colorize(:blue)
      end

      puts "Would you like to read another article?" +"(TYPE ANY KEY).".colorize(:blue) +  "In case you don't, please type" + " (N) ".colorize(:blue)
      user_input = gets.strip.downcase

      if user_input == "n"
        puts "Thank you!"
        exit
      else
        start
      end
    end
  end

end
