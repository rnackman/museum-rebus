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
    @current_index = 0

    if !@word.images
      @word.images = @word.get_museum_data
      @word.save
    end

    respond_to do |f|
      f.js
    end
  end

  def next_image
    @rebus = Rebus.find(params[:rebus_id])
    @word = Word.find(params[:id])
    @word_id = "word-#{@word.id}"
    @current_index = params[:current_index].to_i + 1

    respond_to do |f|
      f.js
    end
  end

  def last_image
    @rebus = Rebus.find(params[:rebus_id])
    @word = Word.find(params[:id])
    @word_id = "word-#{@word.id}"
    @current_index = params[:current_index].to_i - 1

    respond_to do |f|
      f.js
    end
  end

end
