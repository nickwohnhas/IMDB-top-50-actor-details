require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper
attr_accessor :top_50_page

#def self. top 50 scraper

  def self.top_50_page(top_50_page)
  @top_50_page = Nokogiri::HTML(open(top_50_page))
  @top_50_page.css('h3.lister-item-header a').each_with_index do |name_object, index|
    puts "#{index+1}. #{name_object.text}"
    sleep(0.3)
    end

  end
# self. actor page scraper

  def self.actor(actor_url)
    @actor_page = Nokogiri::HTML(open(actor_url))
  end






end


