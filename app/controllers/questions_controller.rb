class QuestionsController < ApplicationController
  def index
    @questions = Question.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where('question_id = ?', @question.id)
  end

  def new
    @question = Question.new
  end

  def create
    params[:question][:user_id] = 1 #TODO: Hardcoded
    question = Question.create!(params[:question])

    redirect_to question_path(question)
  end
end
