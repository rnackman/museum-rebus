class RebusWord < ActiveRecord::Base
  belongs_to :rebus
  belongs_to :word
end