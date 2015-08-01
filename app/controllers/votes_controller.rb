class VotesController < ApplicationController
  def create
    if params[:voteable_type] == "Question"
      voteable = Question.find_by(id: params[:question_id])
    else
      voteable = Answer.find_by(id: params[:answer_id])
    end
    voteable.votes << Vote.new(value: params[:vote_value], user: current_user)
    if voteable.save && request.xhr?
      vote_count = voteable.votes_total
      render json: {vote_count: vote_count}.to_json
    end
  end
end
