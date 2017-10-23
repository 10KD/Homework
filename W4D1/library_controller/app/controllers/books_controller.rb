class BooksController < ApplicationController
  def index
    @books = Book.all# your code here
    render :index
  end

  def new
    # your code here
    render :new
  end

  def create
    book = Book.new(book_params)

    if book.save
      redirect_to :books
    else
      flash.now[:errors] = book.errors.full_messages
      render :new
    end
    # your code here
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to :books
    # your code here
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
