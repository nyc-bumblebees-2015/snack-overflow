class QuestionsController < ApplicationController
  def index
    @recent_questions = Question.recent
    @popular_questions = Question.most_popular
  end

  def show
    @question = Question.find_by(id: params[:id])
    # @comment = Comment.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      redirect_to @question, notice: "Question created successfully!"
    else
      flash[:errors] = @question.errors.full_messages
      redirect_to root_path
    end
  end

  def edit
    @question = Question.find_by(params[:question_params])
  end

  def update
    @question = Question.find_by(id: params[:id])
    if @question.update(question_params)
      redirect_to @question, notice: "Question updated successfully!"
    else
      flash[:errors] = @question.errors.full_messages
      redirect_to @question
    end
  end

  def destroy
    question = Question.find_by(id: params[:id])
    question.destroy
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
