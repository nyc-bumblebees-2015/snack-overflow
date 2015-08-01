require 'rails_helper'

describe Comment do
  before(:each) do
    @user = create(:user)
    @question = create(:question, user: @user)
    @answer = create(:answer, question: @question, user: @user)
    @question_comment = create(:question_comment, commentable: @question, user: @user)
    @answer_comment = create(:answer_comment, commentable: @answer, user: @user)
  end

  it "belongs to a user" do
    expect(@question_comment.user).to eq(@user)
    expect(@answer_comment.user).to eq(@user)
  end

  it 'belongs to a question' do
    expect(@question_comment.commentable).to eq(@question)
  end


end