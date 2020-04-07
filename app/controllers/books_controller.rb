class BooksController < ApplicationController
	def new
		@book = Book.new
    end
    def create
    	@book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            flash[:notice] = "You have created book successfully."
        redirect_to book_path(@book.id)
    else
        @books = Book.all
        render action: :index
    end
   end
    def index
        @books = Book.all
        @book = Book.new
        @book = @book.user
    end
    def show
        @book = Book.where(id: params[:id])
    end
    def edit
        @book = Book.find(params[:id])
    end
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "You have updated book successfully."
        redirect_to book_path and return
    end
    else
        @books = Book.all
        render action: :edit
    end
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to book_path
    end
    private
    def book_params
      params.require(:book).permit(:title, :opinion)
    end
end
