class ImdbTop50::CLI

  def call
  puts "Welcome to IMDB top 50!"
  menu
  end

  def list_actors
    #iterate through the @@all array.  Should be created in order
    puts "Here is a current list of the top 50 most popular actors on IMDB:"
    Scraper.top_50_page("https://www.imdb.com/search/name?gender=male,female&ref_=nv_tp_cel_1")
    choose_actor
  end

  def choose_actor
    puts "Please enter the number of the actor you'd like more information on or type exit."
    input = gets.strip
    unless input == "exit"

      if input.to_i > 0 && input.to_i <= 50
        Scraper.create_actor(Scraper.actor_urls[input.to_i-1])

      else
        puts "That is not a number between 1 and 50"
        choose_actor
      end
    end
  end

  def menu
    puts "To list the current top 50 actors, type 'list actors'."
    puts "To list all the previously chosen actors, type 'prev actors'."
    puts "Type 'exit' to end the program."
    puts "-------------------------------------------------------------"
    input = gets.strip
    unless input == "exit"
      if input == 'list actors'
        list_actors
      elsif input == 'prev actors'
        # Actor.all
        puts "works"
      else
        puts "please enter a valid option"
        menu
      end
    end
  end

end
