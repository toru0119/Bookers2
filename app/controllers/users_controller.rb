class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def index
    @books = @user.books.all
  end
  def show
    @user = User.new(user_params)
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end
end
