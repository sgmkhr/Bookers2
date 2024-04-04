class UsersController < ApplicationController
  
  before_action :is_matching_login_user, only: [:update]
  
  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end 
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end 
  end 

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books
  end
  
  def index
    @user = current_user
    @users = User.all
    @new_book = Book.new
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end 
  
  def book_params
    params.require(:book).permit(:title, :body)
  end 
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end 
  end 
  
end
