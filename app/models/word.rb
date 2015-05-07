require 'open-uri'
require 'json'

class Word < ActiveRecord::Base
  has_many :rebus_words
  has_many :rebuses, through: :rebus_words
  serialize :images

  def get_museum_data
    query = self.display_text.downcase
    url = "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.objects&access_token=#{ENV['cooper_hewitt_access_token']}&title=#{query}&has_images=1&page=1&per_page=100"
    json = JSON.load(open(url))
    if json['objects'].length == 0
      url = "https://api.collection.cooperhewitt.org/rest/?method=cooperhewitt.search.objects&access_token=#{ENV['cooper_hewitt_access_token']}&description=#{query}&has_images=1&page=1&per_page=100"
      json = JSON.load(open(url))
    end
    if json['objects'].length == 0
      [{'image_url': "http://upload.wikimedia.org/wikipedia/commons/3/33/White_square_with_question_mark.png"}]
    else
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
end