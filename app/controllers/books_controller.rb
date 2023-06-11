class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book。.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @book = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    if current_user
      @book = Book.find(params[:id])
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.params(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    paramss.require(:book).permit(:title, :body)
  end
end
