require 'open-uri'
require 'json'

class Word < ActiveRecord::Base
  has_many :rebus_words
  has_many :rebuses, through: :rebus_words
  serialize :images

  def get_museum_data
    query = self.display_text
    url = "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.objects&access_token=#{ENV['cooper_hewitt_access_token']}&title=#{query}&has_images=1&page=1&per_page=100"
    json = JSON.load(open(url))
    if !json
      binding.pry
    end
    json['objects'].collect do |object|
      {
        'image_url': object['images'][0]['b']['url'],
        'accession_number': object['accession_number'],
        'title': object['title'],
        'url': object['url'],
        'date': object['date'],
        'medium': object['medium'],
        'dimensions': object['dimensions'],
        'creditline': object['creditline']
      }
    end
  end
end