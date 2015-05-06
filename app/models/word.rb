require 'open-uri'
require 'json'

class Word < ActiveRecord::Base
  belongs_to :rebus

  def get_museum_data
    query = self.display_text
    url = "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.objects&access_token=#{ENV['cooper_hewitt_access_token']}&query=#{query}&has_images=1&page=1&per_page=100"
    json = JSON.load(open(url))
    json['objects'].sample['images'][0]['b']['url']
  end
end