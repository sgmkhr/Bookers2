class BooksController < ApplicationController
  def index
    @books = Book.all
    @new_book = Book.new
    @user = current_user
    byebug
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(params[:id])
    else 
      render :index 
    end 
  end 

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else 
      render :edit
    end 
  end 

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = current_user
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end 
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end 
  
end
