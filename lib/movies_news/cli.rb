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

  def start
    user_choice = nil
    until user_choice == "n"
      display_articles
      choose_article_to_read
      user_choice = gets.strip.to_i

      if valid_choice?(user_choice)
        display_single_article(user_choice)
        wanna_read_another_article?
      else
        show_error
        wanna_read_another_article?
      end
    end
  end

  def articles
    MoviesNews::Article.all
  end

  def display_articles
    articles
    puts "These are our latest articles:"
    puts ""
    articles.each_with_index do |article, index|
      puts "#{index + 1}".colorize(:blue) + " #{article.title}".colorize(:red)
      puts "   written by:" + " #{article.author.name.gsub(/^\s/, "")}".colorize(:blue)
    end
  end

  def display_single_article(user_choice)
    articles
    puts "::::".colorize(:red) + "#{articles[user_choice - 1].title}".colorize(:blue) +"::::".colorize(:red)
    puts ""
    puts "#{articles[user_choice - 1].story}\n" + "\n" "Written by:" + " #{articles[user_choice - 1].author.name}".colorize(:blue)
    puts ""
  end

  def choose_article_to_read
    puts ""
    puts "Please enter the number for the article you want to read" + "(1-10)".colorize(:blue)
    puts ""
  end

  def show_error
    puts "ERRRRRRRORRRRR! ".colorize(:red) + "INVALID NUMBER!".colorize(:blue)
    puts ""
  end

  def valid_choice?(user_choice)
    user_choice > 0 && user_choice <= 10
  end

  def user_choice_validation(user_choice)
    if user_choice != "n"
        start
    else
      puts "See you later :)"
      exit
    end
  end

  def wanna_read_another_article?
    puts "Would you like to read another article?" +"(TYPE ANY KEY).".colorize(:blue) +  "In case you don't, please type" + " (N) ".colorize(:blue)
    user_choice = gets.strip.downcase
    user_choice_validation(user_choice)
  end
end
