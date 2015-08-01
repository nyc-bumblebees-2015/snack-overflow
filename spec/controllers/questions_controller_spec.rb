require 'rails_helper'
describe QuestionsController do
  before :each do
      @question1 = create(:question, user: create(:user))
      @question2 = create(:question, user: create(:user))
      @question3 = create(:question, user: create(:user))
  end

  describe 'GET #index' do
    it "populates an array of most recent questions" do
      get :index
      expect(assigns(:recent_questions)).to eq([@question3, @question2, @question1])
    end

    it "populates an array of the most popular questions" do
      upvote = create(:question_upvote, votable: @question3, user: create(:user))
      downvote = create(:question_downvote, votable: @question2, user: create(:user))
      get :index
      expect(assigns(:popular_questions)).to eq([@question3, @question1, @question2])
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      question = create(:question)
      get :show, id: question
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new Question to @question' do
      get :new
      expect(assigns(:question)).to be_a_new(Question)
    end

    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end

    describe 'GET #edit' do
      it "assigns the requested question to @question" do
        get :edit, id: @question1
        expect(assigns(:question)).to eq @question1
      end

      it "renders the :edit template" do
        get :edit, id: @question1
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new question in the database" do
        set_user_session create(:user)
        expect{
          post :create, question: attributes_for(:question)
        }.to change(Question, :count).by(1)
      end

      it "redirects to questions#show" do
        set_user_session create(:user)
        post :create, question: attributes_for(:question)
        expect(response).to redirect_to question_path(assigns[:question])
      end
    end

    context "without a current user" do
      it "does not save the new question in the database" do
        expect{
          post :create, question: attributes_for(:question)
        }.to_not change(Question, :count)
      end

      it "redirects to root" do
        post :create, question: attributes_for(:question)
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new question in the database" do
        set_user_session create(:user)
        expect{
          post :create, question: attributes_for(:question, title: nil)
        }.to_not change(Question, :count)
      end

      it "redirects to root" do
        set_user_session create(:user)
        post :create, question: attributes_for(:question, title: nil)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @question = create(:question,
        title: "Best Question",
        content: "This is the best question.\nReally great.",
        user: create(:user))
    end

    context "valid attributes" do
      it "locates the requested @question" do
        patch :update, id: @question, question: attributes_for(:question)
        expect(assigns(:question)).to eq(@question)
      end

      it "change @question's attributes" do
        patch :update, id: @question,
        question: attributes_for(:question,
          title: "Even Better Question",
          content: "This is the best question.\nReally great.")
        @question.reload
        expect(@question.title).to eq("Even Better Question")
        expect(@question.content).to eq("This is the best question.\nReally great.")
      end

      it "redirects to the updated question" do
        patch :update, id: @question, question: attributes_for(:question)
        expect(response).to redirect_to @question
      end
    end

    context "valid attributes" do
      it "does not change the question's attributes" do
        patch :update, id: @question,
        question: attributes_for(:question,
          title: nil,
          content: 'Maybe not the most fun')
        @question.reload
        expect(@question.title).to eq('Best Question')
        expect(@question.content).to_not eq('Maybe not the most fun')
      end

      it "redirects to the question" do
        patch :update, id: @question,
        question: attributes_for(:question, title: nil)
        expect(response).to redirect_to @question
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @question = create(:question)
    end

    it "deletes the question" do
      expect{
        delete :destroy, id: @question
      }.to change(Question, :count).by(-1)
    end

    it "redirects to contacts#index" do
      delete :destroy, id: @question
      expect(response).to redirect_to root_path
    end
  end
end
