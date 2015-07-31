class CommentsController < ApplicationController
  def create
    answer_or_question = get_answer_or_question
    comment = Comment.new(comment_params.merge(commentable: answer_or_question))

    if comment.save
      redirect_to question_path(get_question(answer_or_question))
    else
      #don't know where to direct to upon failure
      redirect_to question_path(get_question(answer_or_question))
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
