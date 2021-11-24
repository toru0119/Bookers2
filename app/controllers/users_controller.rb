class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def book_params
    params.permit(:book, :body)
  end

end
