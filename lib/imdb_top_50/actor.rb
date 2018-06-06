class Actor
  attr_reader :name
  attr_accessor :bio, :movies, :url

  @@all = []

  def initialize(name, movie_array, bio_str, url)
    @name = name
    @movies = movie_array
    @bio = bio_str
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def display_movies # movies and putsing movies are seperate concerns
    @movies.each.with_index(1) do |movie_str, index|
      puts "#{index}. #{movie_str}"
    end
  end

  def self.prev_actors
    if Actor.all.empty?
      puts "I'm sorry, but you haven't viewed any actors yet."
    else
      Actor.all.each.with_index(1) do  |actor_object, index|
        puts "#{index}. #{actor_object.name}"
      end
    end
  end
end
