require 'rails_helper'
describe AnswersController do

  context "#create" do
    let (:test_user) { create(:user) }
    let (:test_question) { create(:question, user: test_user) }
    let (:test_answer) { create(:answer, user: test_user, question: test_question) }

    before :each do 
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(test_user)
     allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    end

    it "saves new answer in the database" do 
      expect {
        post :create, question_id: test_question, answer: attributes_for(:answer)
      }.to change(Answer, :count).by(1)
    end

    xit "redirects with success message with valid answer" do
    end

    xit "redirects with error message with no question" do
    end
    xit "redirects with error message with no user" do
    end
    xit "redirects with error message with no content" do
    end
  end

end