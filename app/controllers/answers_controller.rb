class AnswersController < ApplicationController
  before_filter :find_question

  def new
    @answer = Answer.new
    puts @answer.inspect
  end

  def create
    Answer.create!(:content => params[:answer][:content], 
                   :question_id => @question.id,
                   :user_id => 1)

    redirect_to question_path(@question.id)
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end
end
