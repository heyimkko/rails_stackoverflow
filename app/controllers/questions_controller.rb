class QuestionsController < ApplicationController
  def index
    @questions = Question.order("created_at DESC")
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where('question_id = ?', @question.id)
  end

  def new
    if current_user
      @question = Question.new
    else
      redirect_to new_session_path
    end 
  end

  def create
    @question = Question.new(params[:question])
    @question.user = current_user
    if @question.save
      redirect_to question_path(@question)
    else 
      flash.now[:alert] = @question.errors.full_messages.join(",")
      render :new
    end
  end
end
