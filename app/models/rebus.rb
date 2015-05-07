class Rebus < ActiveRecord::Base
  has_many :rebus_words
  has_many :words, through: :rebus_words
end
