require 'rails_helper'

describe Question do
  it "belongs to a user" do
    user = create(:user)
    question = create(:question, user: user)
    expect(question).to be_valid
  end
end
