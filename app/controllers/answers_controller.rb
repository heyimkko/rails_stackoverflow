class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def create
    answer = Answer.create!(params[:answer])

    redirect_to answer, questions_path(params[:question_id])
  end
end
