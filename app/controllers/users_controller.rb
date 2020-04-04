class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end
  def index
  	@user = User.find(params[:id])
  	@books = @user.books.page(params[:page]).reverse_order
  end
def edit
  @user = User.find(params[:id])
end
def update
  user = User.find(params[:id])
  user.update(user_params)
  redirect_to users_path(user.id)
end
private
    def user_params
        params.require(:user).permit(:name, :image, :introduction)
    end
end
