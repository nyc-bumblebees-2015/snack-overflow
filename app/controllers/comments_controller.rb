class CommentsController < ApplicationController
  def create
    answer_or_question = get_answer_or_question
    comment = Comment.new(comment_params.merge(commentable: answer_or_question))
    question = get_question(answer_or_question)
    if comment.save
      flash[:success] = "Your comment has been added!"
      render comment
    else
      error_message = "ERROR: your comment could not be saved"
      render error_message
    end
  end

  private
  def get_answer_or_question
    answer_id, question_id = params[:answer_id], params[:question_id]
    answer_id ? Answer.find(answer_id) : Question.find(question_id)
  end

  # check if input is an answer, if so, get the question associated with the answer, else return the question
  def get_question(answer)
    answer.is_a?(Answer) ? answer.question : answer
  end

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end

end
