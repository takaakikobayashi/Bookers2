class BooksController < ApplicationController
	def new
		@book = Book.new
    end
    def create
    	book = Book.new(book_params)
        book.user_id = current_user.id
        book.save
        redirect_to book_path(book.id)
    end
    def index
        @user = Book.user
        @books = Book.all
    end
    def show
        @user = User.find(params[:id])
    	@book = Book.find(params[:id])
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        book = Book.find(params[:id])
        book.update(book_params)
        redirect_to book_path
    end
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to book_path
    end
    private
    def book_params
      params.require(:book).permit(:title, :option)
    end
end
