class AnswersController < ApplicationController
  def create
    logged_in? 
    answer = Answer.new(answer_params)
    question = Question.find_by(id: params[:question_id])
    answer.question = question
    if answer.save
      flash[:success] = "Your answer has been added!"
    else
      flash[:error] = answer.errors.full_messages
    end
    redirect_to question_path(question)
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
end
