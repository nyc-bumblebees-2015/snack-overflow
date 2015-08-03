require 'rails_helper'
describe CommentsController do
  before(:each) do
    @user = create(:user)
    @question = create(:question, user: @user)
    @answer = create(:answer, question: @question, user: @user)
    @question_comment = create(:question_comment, commentable: @question, user: @user)
    @answer_comment = create(:answer_comment, commentable: @answer, user: @user)
  end

  describe 'POST #create' do
    before(:each) do
      set_user_session create(:user)
    end

    context 'with valid attributes' do
      it 'saves the new question comment in the database' do
        expect {
          post :create, question_id: @question.id, comment: attributes_for(:question_comment)
        }.to change(Comment, :count).by(1)
      end

      it 'saves the new answer comment in the database' do
        expect {
          post :create, answer_id: @answer.id, comment: attributes_for(:answer_comment)
        }.to change(Comment, :count).by(1)
      end

      it 'renders the new comment after commenting on a question' do
        post :create, question_id: @question.id, comment: attributes_for(:question_comment)
        expect(response).to render_template partial: 'comments/comment', locals: {comment: @question_comment}
      end

      it 'renders the new comment after commenting on an answer' do
        post :create, answer_id: @answer.id, comment: attributes_for(:answer_comment)
        expect(response).to render_template partial: 'comments/comment', locals: {comment: @answer_comment}
      end

    end

    context 'without valid attributes' do
      it 'does not save a empty question comment to the database' do
        expect {
          post :create, question_id: @question.id, comment: attributes_for(:invalid_question_comment)
        }.to change(Comment, :count).by(0)
      end

      it 'does not save a empty answer comment to the database' do
        expect {
          post :create, answer_id: @answer.id, comment: attributes_for(:invalid_answer_comment)
        }.to change(Comment, :count).by 0
      end

      it 'does not save a question comment without user logged in' do
        expect {
          post :create, question_id: @question.id, comment: attributes_for(:invalid_question_comment)
        }.to change(Comment, :count).by 0
      end

      it 'does not save an answer comment without user logged in' do
        expect {
          post :create, answer_id: @answer.id, comment: attributes_for(:invalid_answer_comment)
        }.to change(Comment, :count).by 0
      end

      it 'redirects to question#show after failure to add a question comment' do
        post :create, question_id: @question.id, comment: attributes_for(:invalid_question_comment)
        expect(response).to redirect_to question_path(@question)
      end

      it 'redirects to question#show after failure to add an answer comment' do
        post :create, answer_id: @answer.id, comment: attributes_for(:invalid_answer_comment)
        expect(response).to redirect_to question_path(@question)
      end

    end
  end

end