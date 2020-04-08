class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  def index
  	@users = User.all
    @user_id = User.find(current_user.id)
    @book = Book.new
  end
def edit
  @user = User.find(params[:id])
end
def update
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
  redirect_to user_path(@user.id) and return
end
else
   @users = User.all
   render action: :edit
end
private
    def user_params
        params.require(:user).permit(:name, :image, :introduction)
    end
end
