class Actor
attr_reader  :name
attr_accessor :movie, :bio

@@all = []

  def initialize(name, movie_array, bio_str)
    @name = name
    @movies = []
    @bio = bio_str
    movie_array.each{|movie_title_str| @movies << movie_title_str}
    @@all << self
  end

  def self.all
    @@all
  end




end
