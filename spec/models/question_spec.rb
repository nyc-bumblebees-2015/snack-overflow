require 'rails_helper'

describe Question do
  before(:each) do
    @user = create(:user)
    @question = create(:question, user: @user)
  end

  it "is valid with a title, content, and user" do
    expect(@question).to be_valid
  end

  it "is invalid without a title" do
    @question.title = nil
    expect(@question).to be_invalid
  end

  it "is invalid without content" do
    @question.content = nil
    expect(@question).to be_invalid
  end

  it "is invalid without a user" do
    @question.user = nil
    expect(@question).to be_invalid
  end

  it "receives an accepted answer among suggested answers" do
    answer = create(:answer, user: @user, question: @question)
    @question.accepted_answer = answer
    expect(@question).to be_valid
  end

  it "cannot have an accepted answer that is not among suggested answers" do
    answer = create(:answer, user: @user, question_id: 2)
    @question.accepted_answer = answer
    expect(@question).to be_invalid
  end

  it "can have many tags" do
    tag1 = create(:tag)
    tag2 = create(:tag)
    @question.tags << [tag1,tag2]
    expect(@question.tags.count).to eq 2
  end

  it "can have votes" do
    create(:question_upvote, votable: @question, user: create(:user))
    create(:question_downvote, votable: @question, user: create(:user))
    create(:question_upvote, votable: @question, user: create(:user))
    expect(@question.votes_total).to eq 1
  end

  it "can have many answers" do
    create(:answer, user: create(:user), question: @question)
    create(:answer, user: create(:user), question: @question)
    expect(@question.answers.count).to eq 2
  end
end
