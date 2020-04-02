class UsersController < ApplicationController
  def index
    user_id = current_user.id
    @users = User.all(user_id)
  end
  def show
  	@user = User.find(params[:id])
  	@books = @user.books(params[:page]).reverse_order
  end
  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
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
    def book_params
        params.require(:book_image).permit(:name, :image, :introduction)
    end
end
