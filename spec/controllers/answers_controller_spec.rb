require 'rails_helper'
describe AnswersController do

  context "#create" do
    let (:test_user) { create(:user) }
    let (:test_question) { create(:question, user: test_user) }
    let (:test_answer) { create(:answer, user: test_user, question: test_question) }
    let (:invalid_answer) {create(:invalid_answer, user: nil, question: nil)}

    before :each do 
     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(test_user)
     allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
    end

    context "with valid attributes" do
      it "saves new answer in the database" do 
        expect {
          post :create, question_id: test_question, answer: attributes_for(:answer)
        }.to change(Answer, :count).by(1)
      end

      it "redirects with success message" do
        post :create, question_id: test_question, answer: attributes_for(:answer)
        expect(response).to redirect_to question_path(test_question)
        expect(flash[:success]).to be_present
      end
    end
    
    context "with invalid attributes" do
      it "does not save new answer in the database" do 
        expect {
          post :create, question_id: test_question, answer: attributes_for(:invalid_answer)
        }.to change(Answer, :count).by(0)
      end

      it "redirects with error message" do
        post :create, question_id: test_question, answer: attributes_for(:invalid_answer)
        expect(response).to redirect_to question_path(test_question)
        expect(flash[:error]).to be_present
      end
    end
  end

end