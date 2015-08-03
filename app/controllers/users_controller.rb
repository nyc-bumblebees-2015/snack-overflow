class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user && user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: current_user.id)
    answers = Answer.where(user_id: current_user.id)
    @questions = []
    answers.each do |answer|
      @questions << Question.find_by(id: answer.question_id)
    end

  end

  def edit
    @user = User.find_by(id: current_user.id)
  end

  def update
    user = User.find_by(id: current_user.id)
    if user.update(user_params)
      redirect_to user_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    redirect_to root_path
  end

  private


  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
