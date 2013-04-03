class QuestionsController < ApplicationController
  def index
    @questions = Question.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end
end
