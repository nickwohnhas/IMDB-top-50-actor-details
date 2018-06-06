class ImdbTop50::CLI
  def call
    puts 'Welcome to IMDB top 50!'
    menu
  end

  def list_actors
    # iterate through the @@all array.  Should be created in order
    puts 'Here is a current list of the top 50 most popular actors on IMDB:'
    Scraper.top_50_page('https://www.imdb.com/search/name?gender=male,female&ref_=nv_tp_cel_1')
    choose_actor
  end

  def choose_actor
    puts "Please enter the number of the actor you'd like more information on, type 'return'to go back to the main menu or type exit."
    input = gets.strip
    unless input == 'exit'

      if input.to_i > 0 && input.to_i <= 50
        urls = Scraper.actor_urls[input.to_i - 1]
        actor = Scraper.create_or_find_actor(urls)

        actor_menu(actor)
      elsif input == 'return'
        call
      else
        puts 'That is not a number between 1 and 50'
        choose_actor
      end
    end
  end

  def menu
    menu_options
    input = gets.strip
    unless input == 'exit'
      if input == 'list actors'
        list_actors
      elsif input == 'prev actors'
        Actor.prev_actors

      else
        puts 'please enter a valid option'
        menu
      end
    end
  end

  def actor_menu(actor)
    print_actor_menu(actor)
    input = gets.strip

    if input == 'bio'
      puts actor.bio
      actor_menu(actor)
    elsif input == 'list movies'
      actor.display_movies # Actor.last_actor.movies
      actor_menu(actor)
    elsif input == 'return'
      choose_actor
    else
      puts "Sorry, that's not a valid option."
      actor_menu(actor)
    end # case statement ?
  end

  def print_actor_menu(actor)
    puts "**#{actor.name}**"
    puts "To display the actor's bio, type 'bio'."
    puts "To list the actors movies, type 'list movies'."
    puts "To return to the top 50 actor list, type 'return'."
  end

  def menu_options
    puts "To list the current top 50 actors, type 'list actors'."
    puts "To list all the previously chosen actors, type 'prev actors'."
    puts "Type 'exit' to end the program."
    puts '-------------------------------------------------------------'
  end
end
