class AnswersController < ApplicationController
  before_filter :find_question

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.build(:content => params[:answer][:content])
    @answer.user = current_user

    if @answer.save
      render :json => @answer
    else
      render :json => @answer.errors.full_messages.join(","),
                      :status => :unprocessable_entity
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
    render :json => {}
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end
end
