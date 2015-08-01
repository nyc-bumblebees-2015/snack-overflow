require 'rails_helper'

describe Vote do
  before(:each) do
    @user = create(:user)
    @question = create(:question, user: @user)
    @answer = create(:answer, question: @question, user: @user)
  end

  it 'belongs to a user' do
    question_upvote = build(:question_upvote, votable: @question, user: @user)
    answer_upvote = build(:answer_upvote, votable: @answer, user: @user)
    question_downvote = build(:question_downvote, votable: @question, user: @user)
    answer_downvote = build(:answer_downvote, votable: @answer, user: @user)
    expect(question_upvote.user).to eq(@user)
    expect(answer_upvote.user).to eq(@user)
    expect(question_downvote.user).to eq(@user)
    expect(answer_downvote.user).to eq(@user)
  end

  it 'belongs to a question' do
    question_upvote = build(:question_upvote, votable: @question, user: @user)
    question_downvote = build(:question_downvote, votable: @question, user: @user)
    expect(question_upvote.votable).to eq(@question)
    expect(question_downvote.votable).to eq(@question)
  end

   it 'belongs to a answer' do
    answer_upvote = build(:answer_upvote, votable: @answer, user: @user)
    answer_downvote = build(:answer_downvote, votable: @answer, user: @user)
    expect(answer_upvote.votable).to eq(@answer)
    expect(answer_downvote.votable).to eq(@answer)
  end

  it 'any vote made by an unsigned in user is invalid' do
    question_upvote = build(:question_upvote, votable: @question, user: nil)
    answer_upvote = build(:answer_upvote, votable: @answer, user: nil)
    question_downvote = build(:question_downvote, votable: @question, user: nil)
    answer_downvote = build(:answer_downvote, votable: @answer, user: nil)
    expect(question_upvote).to be_invalid
    expect(answer_upvote).to be_invalid
    expect(question_downvote).to be_invalid
    expect(answer_downvote).to be_invalid
  end
end