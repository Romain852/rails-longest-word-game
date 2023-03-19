require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    @response = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{@word}").read)
    if @response["found"] == true
      @score = 'Congratulations'
    else
      @score = "Sorry, [ #{@word} ] is not a word"
    end
  end
end
