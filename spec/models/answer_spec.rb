require 'rails_helper'

describe Answer do
  it "belongs to a user" do
    user = create(:user)
    answer = create(:answer, user: user)
    expect(answer).to be_valid
  end

  xit "belongs to a question" do 

  end

  xit "has content" do 
  end

  xit "will not save if it doesn't have content" do 
  end
end
