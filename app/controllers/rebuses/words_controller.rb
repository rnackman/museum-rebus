class Rebuses::WordsController < ApplicationController

  def text
    @word = Word.find(params[:id])
    @word_id = "word-#{@word.id}"

    respond_to do |f|
      f.js
    end
  end

  def image
    @word = Word.find(params[:id])
    @word_id = "word-#{@word.id}"

    if !@word.image_url
      @word.image_url = @word.get_museum_data
      @word.save
    end
    
    respond_to do |f|
      f.js
    end
  end
end
