require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper
attr_accessor :top_50_page

  def self.actor_urls
  @@actor_urls
  end
 #choose them with user input,
#scrape actor web-page  for all attributes
#create actor object from the passed-in
  def self.top_50_page(top_50_page)
  @@actor_urls = []
  @top_50_page = Nokogiri::HTML(open(top_50_page))
  @top_50_page.css('h3.lister-item-header a').each_with_index do |name_object, index|
    puts "#{index+1}. #{name_object.text}"
    @@actor_urls << "https://www.imdb.com#{name_object['href']}"
    sleep(0.3)

    end

  end
# self. actor page scraper

  def self.create_actor(actor_url)
    @@actor_page = Nokogiri::HTML(open(actor_url))
     @@actor_bio_page = Nokogiri::HTML(open("#{actor_url}/bio?ref_=nm_ov_bio_sm"))
    actor_name = @@actor_page.css('h1.header span.itemprop').text
    movie_array = @@actor_page.css('div #filmography div.filmo-category-section b').map{|movie_object| movie_object.text}
    bio = @@actor_bio_page.css('div.soda p').text.strip

    actor = Actor.new(actor_name, movie_array, bio)
    binding.pry

  end


end


