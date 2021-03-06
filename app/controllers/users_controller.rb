class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @user =current_user.id
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     redirect_to user_path(@user)
     flash[:notice] = "You have updated user successfully"
    else
      render :edit
    end
  end

  def show
   @user = User.find(params[:id])
   @books = @user.books.all
   @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end
