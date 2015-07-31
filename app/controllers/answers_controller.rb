class AnswersController < ApplicationController
  def create
    logged_in? 
    answer = Answer.new(answer_params)
    question = Question.find_by(id: params[:question_id])
    answer.question = question
    answer.user = current_user
    if answer.save
      flash[:success] = "Your answer has been added!"
      redirect_to root_path
    else
      flash[:error] = answer.errors.full_messages
      redirect_to root_path 
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
