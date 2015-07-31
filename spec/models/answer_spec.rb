require 'rails_helper'

describe Answer do

  let (:test_user) { create(:user) }
  let (:test_question) { create(:question) }
  let (:test_answer) { create(:answer, user: test_user, question: test_question) }

  it "belongs to a question and a user and has content" do
    expect(test_answer).to be_valid
  end

  it "will not save if it doesn't have content" do 
    test_answer.content = nil
    expect(test_answer).to be_invalid
  end

  it "will not save if it doesn't belong to a question" do 
    test_answer.question = nil
    expect(test_answer).to be_invalid
  end

  it "will not save if it doesn't belong to a user" do 
    test_answer.user = nil
    expect(test_answer).to be_invalid
  end
end
