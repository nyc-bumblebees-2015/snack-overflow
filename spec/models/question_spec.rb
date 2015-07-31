require 'rails_helper'

describe Question do
  before(:each) do
    user = create(:user)
    @question = create(:question, user: user)
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

  it "receives an accepted answer among suggested answers"
  it "cannot have an accepted answer that is not among suggested answers"
  it "can have many tags"
  it "can have votes"
  it "can have many answers"
end
