class Rebuses::WordsController < ApplicationController

  def text
    @rebus = Rebus.find(params[:rebus_id])
    @word = Word.find(params[:id])
    @word_id = "word-#{@word.id}"

    respond_to do |f|
      f.js
    end
  end

  def image
    @rebus = Rebus.find(params[:rebus_id])
    @word = Word.find(params[:id])
    @word_id = "word-#{@word.id}"
    if !@word.images
      @word.images = @word.get_museum_data
      @word.save
    end
    @image_url = @word.images.sample[:image_url]

    respond_to do |f|
      f.js
    end
  end
end
