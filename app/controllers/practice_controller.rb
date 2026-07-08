class PracticeController < ApplicationController
  def index
    @word = Word.order("RANDOM()").first
  end

  def check
    word = Word.find(params[:word_id])
    correct = word.text.downcase.strip == params[:answer].downcase.strip

    render json: {
      correct: correct,
      correct_word: word.text,
      next_word: Word.order("RANDOM()").first
    }
  end
end
